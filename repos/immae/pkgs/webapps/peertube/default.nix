{ ldap ? false, sendmail ? false, light ? null, syden ? false, runCommand, libsass
, lib, stdenv, rsync, fetchzip, youtube-dl, fetchurl, mylibs, python, nodejs, nodePackages, yarn2nix-moretea }:
let
  nodeHeaders = fetchurl {
    url = "https://nodejs.org/download/release/v${nodejs.version}/node-v${nodejs.version}-headers.tar.gz";
    sha256 = "1df3yhlwlvai0m9kvjyknjg11hnw0kj0rnhyzbwvsfjnmr6z8r76";
  };
  source = mylibs.fetchedGithub ./peertube.json;
  patchedSource = stdenv.mkDerivation (source // rec {
    phases = [ "unpackPhase" "patchPhase" "installPhase" ];
    patches = [ ./yarn_fix_http_node.patch ]
      ++ lib.optionals ldap [ ./ldap.patch ]
      ++ lib.optionals sendmail [ ./sendmail.patch ]
      ++ lib.optionals syden [ ./syden.patch ];
    installPhase = let
      # Peertube supports several languages, but they take a very long
      # time to build. The build script accepts --light which builds
      # only English, and --light-fr which only builds English + French.
      # This small hack permits to builds only English + A chosen
      # language depending on the value of "light"
      # Default (null) is to build every language
      lightFix = if light == true || light == null then "" else ''
        sed -i -e "s/fr-FR/${light}/g" -e "s/--light-fr/--light-language/" $out/scripts/build/client.sh
      '';
    in ''
      mkdir $out
      cp -a . $out/
      ${lightFix}
      '';
  });
  serverPatchedPackage = runCommand "server-package" {} ''
    mkdir -p $out
    cp ${patchedSource}/package.json $out/
    cp ${patchedSource}/yarn.lock $out/
  '';
  clientPatchedPackage = runCommand "client-package" {} ''
    mkdir -p $out
    cp ${patchedSource}/client/package.json $out/
    cp ${patchedSource}/client/yarn.lock $out/
  '';

  yarnModulesConfig = {
    bcrypt = {
      buildInputs = [ nodePackages.node-pre-gyp ];
      postInstall = let
        bcrypt_lib = fetchurl {
          url = "https://github.com/kelektiv/node.bcrypt.js/releases/download/v3.0.7/bcrypt_lib-v3.0.7-node-v64-linux-x64-glibc.tar.gz";
          sha256 = "0gbq4grhp5wl0f9yqb4y43kjfh8nivfd6y0nkv1x6gfvs2v23wb0";
        };
      in
        ''
          mkdir lib && tar -C lib -xf ${bcrypt_lib}
          patchShebangs ../node-pre-gyp
          npm run install
        '';
    };
    dtrace-provider = {
      buildInputs = [ python nodePackages.node-gyp ];
      postInstall = ''
        npx node-gyp rebuild --tarball=${nodeHeaders}
        '';
    };
    node-sass = {
      buildInputs = [ libsass python ];
      postInstall =
        ''
          node scripts/build.js --tarball=${nodeHeaders}
        '';
    };

    sharp = {
      buildInputs = [ python nodePackages.node-gyp ];
      postInstall =
        let
          tarball = fetchurl {
            url = "https://github.com/lovell/sharp-libvips/releases/download/v8.8.1/libvips-8.8.1-linux-x64.tar.gz";
            sha256 = "0xqv61g6s6rkvc31zq9a3bf8rp56ijnpw0xhr91hc88asqprd5yh";
          };
        in
        ''
          mkdir vendor
          tar -C vendor -xf ${tarball}
          patchShebangs ../prebuild-install
          npx node install/libvips
          npx node install/dll-copy
          npx prebuild-install || npx node-gyp rebuild --tarball=${nodeHeaders}
        '';
    };
    utf-8-validate = {
      buildInputs = [ nodePackages.node-gyp-build ];
    };
    youtube-dl = {
      postInstall = ''
        mkdir bin
        ln -s ${youtube-dl}/bin/youtube-dl bin/youtube-dl
        cat > bin/details <<EOF
        {"version":"${youtube-dl.version}","path":null,"exec":"youtube-dl"}
        EOF
        '';
    };
  };
  serverYarnModulesArg = rec {
    pname = "peertube-server-yarn-modules";
    version = source.version;
    name = "${pname}-${version}";
    packageJSON = "${serverPatchedPackage}/package.json";
    yarnLock = "${serverPatchedPackage}/yarn.lock";
    yarnNix = ./server-yarn-packages.nix;
    pkgConfig = yarnModulesConfig;
  };
  clientYarnModulesArg = rec {
    pname = "peertube-client-yarn-modules";
    version = source.version;
    name = "${pname}-${version}";
    packageJSON = "${clientPatchedPackage}/package.json";
    yarnLock = "${clientPatchedPackage}/yarn.lock";
    yarnNix = ./client-yarn-packages.nix;
    pkgConfig = yarnModulesConfig;
  };
  yarnModulesNoWorkspace = args: (yarn2nix-moretea.mkYarnModules args).overrideAttrs(old: {
    buildPhase = builtins.replaceStrings [" ./package.json"] [" /dev/null; cp deps/*/package.json ."] old.buildPhase;
  });

  patchedPackages = stdenv.mkDerivation (source // rec {
    patches = if ldap then [ ./ldap.patch ] else [ ./yarn_fix_http_node.patch ];
    installPhase = ''
      mkdir $out
      cp package.json yarn.lock $out/
      '';
  });
  serverYarnModules = yarnModulesNoWorkspace serverYarnModulesArg;
  serverYarnModulesProd = yarnModulesNoWorkspace (serverYarnModulesArg // { yarnFlags = yarn2nix-moretea.defaultYarnFlags ++ [ "--production" ]; });
  clientYarnModules = yarnModulesNoWorkspace clientYarnModulesArg;

  server = stdenv.mkDerivation ({
    pname = "peertube-server";
    version = source.version;
    src = patchedSource;
    buildPhase = ''
      ln -s ${serverYarnModules}/node_modules .
      npm run build:server
      '';
    installPhase = ''
      mkdir $out
      cp -a dist $out
      '';
    buildInputs = [ nodejs serverYarnModules ];
  });

  client = stdenv.mkDerivation ({
    pname = "peertube-client";
    version = source.version;
    src = patchedSource;
    buildPhase = let
      lightArg = if light == null then "" else if light == true then "--light" else "--light-language";
    in ''
      ln -s ${serverYarnModules}/node_modules .
      cp -a ${clientYarnModules}/node_modules client/
      chmod +w client/node_modules
      patchShebangs .
      npm run build:client -- ${lightArg}
      '';
    installPhase = ''
      mkdir $out
      cp -a client/dist $out
      '';
    buildInputs = [ nodejs clientYarnModules ];
  });

  package = stdenv.mkDerivation rec {
    version = source.version;
    pname = "peertube";
    src = patchedSource;
    buildPhase = ''
      ln -s ${serverYarnModulesProd}/node_modules .
      ln -s ${clientYarnModules}/node_modules client/
      rm -rf dist && cp -a ${server}/dist dist
      rm -rf client/dist && cp -a ${client}/dist client/
      '';
    installPhase = ''
      mkdir $out
      cp -a * $out
      ln -s /tmp $out/.cache
      '';

    meta = {
      description = "A free software to take back control of your videos";

      longDescription = ''
        PeerTube aspires to be a decentralized and free/libre alternative to video
        broadcasting services.
        PeerTube is not meant to become a huge platform that would centralize
        videos from all around the world. Rather, it is a network of
        inter-connected small videos hosters.
        Anyone with a modicum of technical skills can host a PeerTube server, aka
        an instance. Each instance hosts its users and their videos. In this way,
        every instance is created, moderated and maintained independently by
        various administrators.
        You can still watch from your account videos hosted by other instances
        though if the administrator of your instance had previously connected it
        with other instances.
      '';

      license = stdenv.lib.licenses.agpl3Plus;

      homepage = "https://joinpeertube.org/";

      platforms = stdenv.lib.platforms.linux; # not sure here
      maintainers = with stdenv.lib.maintainers; [ matthiasbeyer immae ];
    };
  };
in
  package

{ stdenv, fetchfromgh, appimageTools, undmg }:
let
  inherit (stdenv.hostPlatform) system;
  throwSystem = throw "Unsupported system: ${system}";

  pname = "keeweb";
  version = "1.15.5";
  name = "${pname}-${version}";

  suffix = {
    x86_64-linux = "linux.AppImage";
    x86_64-darwin = "mac.dmg";
  }.${system} or throwSystem;

  src = fetchfromgh {
    owner = "keeweb";
    repo = "keeweb";
    version = "v${version}";
    name = "KeeWeb-${version}.${suffix}";
    sha256 = {
      x86_64-linux = "1d4qx9yf7rgwb24d79c8gjx7i9vdic0mayw7vzwbdncpjd095i1v";
      x86_64-darwin = "0cv2s6bvd8ybvxd7m9pvjzawryg1vwsq20h6xbqj4r7mgq09zwfc";
    }.${system} or throwSystem;
  };

  appimageContents = appimageTools.extractType2 {
    inherit name src;
  };

  meta = with stdenv.lib; {
    description = "Free cross-platform password manager compatible with KeePass";
    homepage = "https://keeweb.info/";
    license = licenses.mit;
    maintainers = [ maintainers.sikmir ];
    platforms = [ "x86_64-linux" "x86_64-darwin" ];
    skip.ci = true;
  };

  linux = appimageTools.wrapType2 rec {
    inherit name src meta;

    extraInstallCommands = ''
      mv $out/bin/{${name},${pname}}
      install -Dm644 ${appimageContents}/keeweb.desktop -t $out/share/applications
      install -Dm644 ${appimageContents}/keeweb.png -t $out/share/icons/hicolor/256x256/apps
      install -Dm644 ${appimageContents}/usr/share/mime/keeweb.xml -t $out/share/mime
      substituteInPlace $out/share/applications/keeweb.desktop \
        --replace 'Exec=AppRun' 'Exec=${pname}'
    '';
  };

  darwin = stdenv.mkDerivation {
    inherit name src meta;

    preferLocalBuild = true;

    nativeBuildInputs = [ undmg ];

    sourceRoot = "KeeWeb.app";

    installPhase = ''
      mkdir -p $out/Applications/KeeWeb.app
      cp -R . $out/Applications/KeeWeb.app
    '';
  };
in
if stdenv.isDarwin
then darwin
else linux

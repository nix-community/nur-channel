{ lib, stdenv, fetchzip, jdk, makeWrapper, installShellFiles, coreutils }:
let
  pname = "spring-boot-cli";
in rec {
  springGen = {version, src} : stdenv.mkDerivation {
    inherit pname version src;

    nativeBuildInputs = [ makeWrapper installShellFiles ];

    installPhase = ''
      runHook preInstall
      rm bin/spring.bat
      installShellCompletion --bash shell-completion/bash/spring
      installShellCompletion --zsh shell-completion/zsh/_spring
      rm -r shell-completion
      cp -r . $out
      wrapProgram $out/bin/spring \
        --set JAVA_HOME ${jdk} \
        --set PATH /bin:${coreutils}/bin:${jdk}/bin
      runHook postInstall
    '';

    installCheckPhase = ''
      $out/bin/spring --version 2>&1 | grep -q "${version}"
    '';

    meta = with lib; {
      description = ''
        CLI which makes it easy to create spring-based applications
      '';
      longDescription = ''
        Spring Boot makes it easy to create stand-alone, production-grade
        Spring-based Applications that you can run. We take an opinionated view
        of the Spring platform and third-party libraries, so that you can get
        started with minimum fuss. Most Spring Boot applications need very
        little Spring configuration.

        You can use Spring Boot to create Java applications that can be started
        by using java -jar or more traditional war deployments. We also provide
        a command line tool that runs “spring scripts”.
      '';
      homepage = https://spring.io/projects/spring-boot;
      license = licenses.asl20;
      platforms = platforms.all;
      maintainers = with maintainers; [ moaxcp ];
    };
  };

  spring-boot-cli-2_2_6 = springGen rec {
    version = "2.2.6";
    src = fetchzip {
      url = "https://repo.spring.io/release/org/springframework/boot/${pname}/${version}.RELEASE/${pname}-${version}.RELEASE-bin.zip";
      sha256 = "1rb21a8nr4mcdsfv3c3xh45kcpdwllhjfb26w9xsdgfh1j4mhb81";
    };
  };

  spring-boot-cli-2_2_7 = springGen rec {
    version = "2.2.7";
    src = fetchzip {
      url = "https://repo.spring.io/release/org/springframework/boot/${pname}/${version}.RELEASE/${pname}-${version}.RELEASE-bin.zip";
      sha256 = "18ddyn07fir2bckaigis0518jr0g3g2kiqhhy56v8wbyg15vimhm";
    };
  };

  spring-boot-cli-2_4_1 = springGen rec {
    version = "2.4.1";
    src = fetchzip {
      url = "https://repo.spring.io/release/org/springframework/boot/${pname}/${version}/${pname}-${version}-bin.zip";
      sha256 = "05dyw3ysrwgyvv5p5c3hhmxs0hapxmzcqvb27cv11kj081wxili8";
    };
  };
}
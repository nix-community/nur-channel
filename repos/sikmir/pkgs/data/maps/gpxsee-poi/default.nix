{ lib, fetchurl, gzip, jq }:

{
  geocachingSu = fetchurl {
    name = "geocaching_su-2020-05-18";
    url = "https://nakarte.me/geocachingSu/geocaching_su2.json";
    sha256 = "17mg2qh4pqpi9524z2mi03xyrs9iyb2xqxmhj4qgwq1hwvlni64a";
    downloadToTemp = true;
    recursiveHash = true;
    preferLocalBuild = true;
    postFetch = ''
      install -dm755 $out/share/gpxsee/POI
      cat $downloadedFile | \
        ${gzip}/bin/gzip -d | \
        ${jq}/bin/jq -r '.[]|[.[3],.[2],.[0]]|@csv' > $out/share/gpxsee/POI/geocaching.su.csv
    '';

    meta = with lib; {
      homepage = "https://geocaching.su/";
      description = "Geocaches";
      maintainers = with maintainers; [ sikmir ];
      license = licenses.free;
      platforms = platforms.all;
      skip.ci = true;
    };
  };

  laavut = fetchurl {
    name = "laavut-2020-05-02";
    url = "http://www.laavu.org/lataa.php?paikkakunta=kaikki";
    sha256 = "0n7pni13krswgjfrpmkjjbhv5fnqsjx3dxha9m5nhkj1qb84n47z";
    downloadToTemp = true;
    recursiveHash = true;
    preferLocalBuild = true;
    postFetch = ''
      install -Dm644 $downloadedFile $out/share/gpxsee/POI/Laavut-kodat.gpx
    '';

    meta = with lib; {
      homepage = "http://www.laavu.org/";
      description = "Laavut ja kodat kartalla";
      maintainers = with maintainers; [ sikmir ];
      license = licenses.free;
      platforms = platforms.all;
      skip.ci = true;
    };
  };

  autiotuvat = fetchurl {
    name = "autiotuvat-2020-01-13";
    url = "http://www.laavu.org/autiotuvat/lataa.php?paikkakunta=kaikki";
    sha256 = "02v4m5xpsnlmmsl549b9a2c7hidcfgi10g3mdb5bvi1jcf4xj50z";
    downloadToTemp = true;
    recursiveHash = true;
    preferLocalBuild = true;
    postFetch = ''
      install -Dm644 $downloadedFile $out/share/gpxsee/POI/Autiotuvat.gpx
    '';

    meta = with lib; {
      homepage = "http://www.laavu.org/autiotuvat/";
      description = "Autiotuvat kartalla";
      maintainers = with maintainers; [ sikmir ];
      license = licenses.free;
      platforms = platforms.all;
      skip.ci = true;
    };
  };

  westra = fetchurl {
    name = "westra-2020-05-18";
    url = "https://nakarte.me/westraPasses/westra_passes.json";
    sha256 = "1h2rzh6x1zfr7j7f5cfai373qdnjf65gkdq5kklw5w0vn8jgm3gk";
    downloadToTemp = true;
    recursiveHash = true;
    preferLocalBuild = true;
    postFetch = ''
      install -dm755 $out/share/gpxsee/POI
      cat $downloadedFile | \
        ${gzip}/bin/gzip -d | \
        ${jq}/bin/jq -r '.[]|[.latlon[1],.latlon[0],.name]|@csv' > $out/share/gpxsee/POI/westra_passes.csv
    '';

    meta = with lib; {
      homepage = "https://westra.ru/passes/";
      description = "Mountain passes (Westra)";
      maintainers = with maintainers; [ sikmir ];
      license = licenses.free;
      platforms = platforms.all;
      skip.ci = true;
    };
  };
}

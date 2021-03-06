{stdenv, autoreconfHook, fetchurl, gmp, openblas}:
stdenv.mkDerivation rec {
  name = "iml-${version}";
  version = "1.0.5";
  src = fetchurl {
    url = "http://www.cs.uwaterloo.ca/~astorjoh/iml-${version}.tar.bz2";
    sha256 = "0akwhhz9b40bz6lrfxpamp7r7wkk48p455qbn04mfnl9a1l6db8x";
  };
  buildInputs = [
    gmp
    openblas
  ];
  nativeBuildInputs = [
    autoreconfHook
  ];
  configureFlags = [
    "--with-gmp-include=${gmp.dev}/include"
    "--with-gmp-lib=${gmp}/lib"
    "--with-cblas=-lopenblas"
    "--with-cblas-lib=${openblas}/lib"
    "--with-cblas-include=${openblas}/include"
    "--enable-shared"
    "--disable-static"
  ];
  doCheck = true;
  meta = {
    inherit version;
    description = ''Algorithms for computing exact solutions to dense systems of linear equations over the integers'';
    license = stdenv.lib.licenses.gpl2Plus;
    maintainers = [stdenv.lib.maintainers.raskin];
    platforms = stdenv.lib.platforms.linux;
    homepage = https://cs.uwaterloo.ca/~astorjoh/iml.html;
    updateWalker = true;
  };
}

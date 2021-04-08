{ lib
, fetchFromGitHub
, python39 }:

python39.pkgs.buildPythonPackage rec {
  pname = "biblib";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "colour-science";
    repo = "${pname}";
    rev = "v${version}";
    sha256 = "065ihxlc3pjiyaw4pbkc8y30jrn2r36li3xncb86ggkfc2mg9r4s";
  };

  meta = {
    description = "Parser for BibTeX bibliographic databases";
    homepage = "https://github.com/colour-science/biblib";
    license = [ lib.licenses.mit ];
    maintainers = let dschrempf = import ../../dschrempf.nix; in [ dschrempf ];
  };
}
{ nixpkgs ? import <nixpkgs> { } }:

with nixpkgs;

stdenv.mkDerivation rec {

  name = "personal-website";

  src = ./.;

  buildInputs = [ hugo ];

  buildPhase = "hugo";

  installPhase = ''
    mkdir -pv $out/nix-support/
    cp -r public $out
  '';

  meta = with lib; {
    description = "My personal website";
    licences = licenses.nonfree;
    author = "Samuel W. Flint <swflint@flintfam.org>";
  };

}

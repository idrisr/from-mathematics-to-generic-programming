{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/23.05";

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      compiler = "ghc927";
      pkgs = import nixpkgs { system = system; };

      hPkgs = pkgs.haskell.packages."${compiler}";

      myDevTools = with hPkgs; [
        ghc
        ghcid
        fourmolu
        hlint
        hoogle
        haskell-language-server
        implicit-hie
        retrie
        cabal-install
        pkgs.zlib
        QuickCheck
        hspec
      ];
      app = pkgs.haskell.packages.${compiler}.callPackage ./test.nix;

    in {
      apps.${system}.default = {
        type = "app";
        program = "${app { }}/bin/main";
      };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = myDevTools;
        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath myDevTools;
      };

      packages.${system}.default = app { };
    };
}

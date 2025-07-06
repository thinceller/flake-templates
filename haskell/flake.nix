{
  description = "A basic Haskell flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, treefmt-nix, ... }:
  flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [
      "aarch64-darwin"
      "x86_64-linux"
    ];
    imports = [
      treefmt-nix.flakeModule
    ];
    perSystem =
      { config, pkgs, ...}:
      {
        treefmt = {
          projectRootFile = "flake.nix";
          programs = {
            nixfmt.enable = true;
            ormolu.enable = true;
          };
        };

        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs; [
              ghc
              cabal-install
              haskell-language-server
            ];
            inputsFrom = [
              config.treefmt.build.devShell
            ];
          };
        };
      };
  };
}

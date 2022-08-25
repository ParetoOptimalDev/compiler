{
  description = "A very basic flake";
  inputs.haskellNix.url = "github:input-output-hk/haskell.nix";
  inputs.nixpkgs.follows = "haskellNix/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = { self, nixpkgs, flake-utils, haskellNix }:
    flake-utils.lib.eachSystem [ "aarch64-linux" "aarch64-darwin" "x86_64-linux" ] (system:
      let
        aarch64MultiMusl = haskellNix { pkgs = pkgs.pkgsCross.aarch64-multiplatform-musl; };
        overlays = [ haskellNix.overlay
                     (final: prev: {
                       elmProject =
                         final.haskell-nix.project' {
                           src = ./.;
                           compiler-nix-name = "ghc902";
                           shell.tools = {
                             cabal = {};
                             hlint = {};
                             haskell-language-server = {};
                           };
                           shell.crossPlatforms = p: [ p.musl64 ];
                         };
                     })
                   ];
        pkgs = import nixpkgs { inherit system overlays; inherit (haskellNix) config; 
                                nixpkgsArgs = {
                                  crossSystem = { config = "musl64"; };
                                };
                              };
        flake = pkgs.elmProject.flake {};
      in flake // {
        crossPlatforms = p: [p.musl64];
        flkPackages = pkgs;
        
        # trying to follow pattern at
        # https://input-output-hk.github.io/haskell.nix/tutorials/cross-compilation.html
        # with a couple differences:
        #
        # - using a flake
        # - using pkgsStatic overlay instead of setting static flags manually
        #
        defaultPackage = pkgs.aarch64-multiplatform-musl.pkgsStatic.haskellPackages.executables.components.exes.elm;
        elmAarch64Multi = pkgs.aarch64-multiplatform-musl.pkgsStatic.haskellPackages.executables.components.exes.elm;
        myFlake = flake;
      });
}

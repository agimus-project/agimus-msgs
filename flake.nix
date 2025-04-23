{
  description = "ROS messages of the agimus-project.";

  inputs = {
    gepetto.url = "github:gepetto/nix";
    flake-parts.follows = "gepetto/flake-parts";
    nixpkgs.follows = "gepetto/nixpkgs";
    nix-ros-overlay.follows = "gepetto/nix-ros-overlay";
    treefmt-nix.follows = "gepetto/treefmt-nix";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      { self, ... }:
      {
        systems = [ "x86_64-linux" ];
        imports = [ inputs.treefmt-nix.flakeModule ];
        flake.src = inputs.nixpkgs.lib.fileset.toSource {
          root = ./.;
          fileset = inputs.nixpkgs.lib.fileset.unions [
            ./CMakeLists.txt
            ./msg
            ./package.xml
          ];
        };
        perSystem =
          {
            lib,
            pkgs,
            system,
            self',
            ...
          }:
          {
            _module.args.pkgs = import inputs.nixpkgs {
              inherit system;
              overlays = [
                inputs.nix-ros-overlay.overlays.default
                inputs.gepetto.overlays.default
              ];
            };
            checks = lib.mapAttrs' (n: lib.nameValuePair "package-${n}") self'.packages;
            packages = {
              default = self'.packages.agimus-msgs;
              agimus-msgs = pkgs.rosPackages.humble.agimus-msgs.overrideAttrs {
                inherit (self) src;
              };
            };
            treefmt.programs = {
              deadnix.enable = true;
              nixfmt.enable = true;
            };
          };
      }
    );
}

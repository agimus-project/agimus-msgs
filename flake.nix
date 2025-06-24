{
  description = "ROS messages of the agimus-project.";

  inputs = {
    gepetto.url = "github:gepetto/nix";
    flake-parts.follows = "gepetto/flake-parts";
    nixpkgs.follows = "gepetto/nixpkgs";
    nix-ros-overlay.follows = "gepetto/nix-ros-overlay";
    systems.follows = "gepetto/systems";
    treefmt-nix.follows = "gepetto/treefmt-nix";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports = [ inputs.gepetto.flakeModule ];
      perSystem =
        { lib, pkgs, ... }:
        {
          packages = lib.filterAttrs (_n: v: v.meta.available && !v.meta.broken) (rec {
            default = agimus-msgs;
            agimus-msgs = pkgs.rosPackages.humble.agimus-msgs.overrideAttrs {
              src = lib.fileset.toSource {
                root = ./.;
                fileset = lib.fileset.unions [
                  ./CMakeLists.txt
                  ./msg
                  ./package.xml
                ];
              };
            };
          });
        };
    };
}

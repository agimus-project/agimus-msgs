{
  description = "ROS messages of the agimus-project.";

  inputs = {
    gepetto.url = "github:gepetto/nix/centralize";
    flake-parts.follows = "gepetto/flake-parts";
    nixpkgs.follows = "gepetto/nixpkgs";
    nix-ros-overlay.follows = "gepetto/nix-ros-overlay";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
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
          packages = {
            default = self'.packages.py-agimus-msgs;
            agimus-msgs = pkgs.agimus-msgs.overrideAttrs {
              src = lib.fileset.toSource {
                root = ./.;
                fileset = lib.fileset.unions [
                  ./CMakeLists.txt
                  ./msg
                  ./package.xml
                ];
              };
            };
            py-agimus-msgs = pkgs.python3Packages.toPythonModule self'.packages.agimus-msgs;
          };
        };
    };
}

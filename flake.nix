{
  description = "ROS messages of the agimus-project.";

  inputs = {
    gazebros2nix.url = "github:gepetto/gazebros2nix";
    flake-parts.follows = "gazebros2nix/flake-parts";
    nixpkgs.follows = "gazebros2nix/nixpkgs";
    nix-ros-overlay.follows = "gazebros2nix/nix-ros-overlay";
    systems.follows = "gazebros2nix/systems";
    treefmt-nix.follows = "gazebros2nix/treefmt-nix";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      { lib, ... }:
      {
        systems = import inputs.systems;
        imports = [
          inputs.gazebros2nix.flakeModule
          {
            gazebros2nix.rosOverrides.agimus-msgs = _final: _ros-final: {
              src = lib.fileset.toSource {
                root = ./.;
                fileset = lib.fileset.unions [
                  ./CMakeLists.txt
                  ./action
                  ./msg
                  ./package.xml
                ];
              };
            };
          }
        ];
      }
    );
}

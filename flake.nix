{
  description = ''
    ae.systems/Risala: Monorepo for Risala, a powerful yet secure messenger for the GCC
  '';

  outputs =
    inputs@{ parts, systems, ... }:
    parts.lib.mkFlake { inherit inputs; } {
      systems = import systems;
      imports = [ ];
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";

    parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    treefmt = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    flake-registry = "";
    show-trace = true;

    experimental-features = "flakes nix-command pipe-operators fetch-closure";
  };
}

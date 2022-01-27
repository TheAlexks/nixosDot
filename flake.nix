{
  description = "Alex's first flake. Alex has never used NixOS, so this flake might be a bit messy.";

  # Bitch, repos go brr
  inputs = {
    # The main repo of NixOS
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";

    # Unstable-small
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    unstable-small.url = "github:nixos/nixpkgs/nixos-unstable-small";

    # Why install pkgs globally, when you can manage them locally?
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "unstable-small";

    # flake-utils
    # External functions that can help you write flakes.
    flake-utils.url = "github:numtide/flake-utils";
    flake-utils.inputs.nixpkgs.follows = "unstable-small";

  };
  # END OF INPUTS #
  

    outputs = { self, ... } @ inputs:
    {

      nixosConfigurations = import ./nixos inputs;

      homeConfigurations = import ./home inputs;


      lib = import ./lib inputs;
    };

}

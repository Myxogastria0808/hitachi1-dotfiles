{
  inputs = {
    # nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixvim
    nixvim-config.url = "github:Myxogastria0808/nix-flakes-nixvim";
  };

  outputs = inputs: {
    ## home-manager ##
    homeConfigurations = {
      hitachi1 = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
          system = "x86_64-linux";
          # Enable unfree pkgs
          config.allowUnfree = true;
        };
        extraSpecialArgs = {
          inherit inputs;
          username = "hello";
        };
        modules = [
          ./home/home.nix
        ];
      };
    };
  };
}

{
  inputs,
  pkgs,
  system,
  username,
  ...
}:

{
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "25.11"; # Please read the comment before changing.
  };
  home.packages = with pkgs; [
    # nixvim
    inputs.nixvim-config.packages.${system}.nixvim
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

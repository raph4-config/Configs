{ config, pkgs, ... }:
{

  home.username = "arn";
  home.homeDirectory = "/Users/arn";

  home.stateVersion = "26.05";

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}

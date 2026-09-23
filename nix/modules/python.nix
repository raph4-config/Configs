{ pkgs, ... }:
{
    home.packages = [
      pkgs.python312
      pkgs.poetry
    ];
}

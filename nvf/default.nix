{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./plugins.nix
    ./settings.nix
    ./mappings.nix
    (import ./love2d-nvim.nix {
      inherit inputs;
      inherit pkgs;
    })
  ];
}

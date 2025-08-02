to update flake:
    nix flake update
to update system:
    sudo nixos-rebuild switch --flake .#nixos-morningstar
to update home-manager
    home-manager switch --flake .#jandro

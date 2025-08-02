to update flake:
    nix flake update
to update system:
    sudo nixos-rebuild switch --flake .#nixos-morningstar
to update home-manager:
    home-manager switch --flake .#jandro

to update git:
    git add {changed files}
    git commit -m "Commit Message (BE DESCRIPTIVE)"
    git push github main

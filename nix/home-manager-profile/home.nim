## A small home profile that a Home Manager configuration reads (flake.nix).
## It names packages by their canonical reprobuild names; the Nix side turns
## them into nixpkgs attributes through reprobuild's Nix catalog.

import repro_profile

profile "example":
  activity default:
    jq

  activity develop:
    fd
    when linux():
      htop

  activity desktop:
    vscode

  hosts:
    "laptop": [default, develop]
    "server": [default]
    "mac": [default, desktop]

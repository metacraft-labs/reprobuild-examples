# A Home Manager configuration driven by a reprobuild home profile

`home.nim` is a small home profile: three activities, three hosts. `flake.nix`
builds a Home Manager configuration for the host `laptop` whose
`home.packages` are the packages the profile selects for it, read from the
committed export `home-export.json` through
`reprobuild.homeManagerModules.intent`. The package list is written once, in
`home.nim`.

```bash
# The packages Home Manager installs: fd, htop and jq, plus Home Manager's own.
nix eval --json .#homeConfigurations.laptop.config.home.packages \
  --apply 'map (p: p.name)'

# Refresh the export after editing home.nim, and check it is current.
repro home export --profile-dir . --host laptop > home-export.json
repro home export --profile-dir . --host laptop --check home-export.json

# Compare the configuration with the profile.
nix build .#checks.x86_64-linux.home-equivalence-laptop
```

`home-equivalence-allow.toml` lists what Home Manager adds by itself, each
row with its reason. The reprobuild user documentation's machine guides walk
through each step.

The host `mac` adds the `desktop` activity, whose application, `vscode`,
reaches Home Manager as a Homebrew cask token rather than a package:

```bash
nix eval --json .#homeConfigurations.mac.config.reprobuild.intent.homebrew.casks
```

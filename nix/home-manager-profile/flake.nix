{
  description = "A Home Manager configuration whose packages come from a reprobuild home profile";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    reprobuild.url = "github:metacraft-labs/reprobuild/84b459adda91535f0b89424dfc95aa34bfa67a32";
  };

  outputs = { self, nixpkgs, home-manager, reprobuild }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      host = "laptop";
    in
    {
      # Home Manager installs the packages the profile selects for `host`,
      # read from the committed export (home-export.json).
      homeConfigurations.${host} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          reprobuild.homeManagerModules.intent
          {
            home.username = "example";
            home.homeDirectory = "/home/example";
            home.stateVersion = "25.11";

            reprobuild.intent = {
              enable = true;
              inherit host;
              snapshot = ./home-export.json;
              packages.enable = true;
            };
          }
        ];
      };

      # A Mac that still installs applications with Homebrew: the profile's
      # applications become cask tokens in reprobuild.intent.homebrew.casks,
      # for the host's Homebrew module (Home Manager has no Homebrew option).
      homeConfigurations.mac = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        modules = [
          reprobuild.homeManagerModules.intent
          {
            home.username = "example";
            home.homeDirectory = "/Users/example";
            home.stateVersion = "25.11";
            reprobuild.intent = {
              enable = true;
              host = "mac";
              snapshot = ./home-export.json;
              packages.enable = true;
              homebrew.enable = true;
            };
          }
        ];
      };

      # Compares what this configuration gives the host with what the profile
      # declares for it, and fails on a difference the allowlist does not
      # excuse.
      checks.${system}."home-equivalence-${host}" = reprobuild.lib.homeEquivalenceCheck {
        configuration = self.homeConfigurations.${host};
        inherit host;
        profileDir = ./.;
        allowlist = ./home-equivalence-allow.toml;
      };
    };
}

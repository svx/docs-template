{
  description = "A Nix-flake-based Node.js development environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      overlays = [
        (final: prev: rec {
          nodejs = prev.nodejs_20;
          yarn = (prev.yarn.override { inherit nodejs; });
          pnpm = prev.nodePackages.pnpm;
        })
      ];
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit overlays system; };
      });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            nodejs
            vale
            (yarn.override { nodejs = nodejs_20; })
            #pnpm
            lychee #https://github.com/lycheeverse/lychee
            lefthook #https://github.com/evilmartians/lefthook
            ];

          shellHook = ''
          echo "::Versions::"
          echo "Node: `${pkgs.nodejs_20}/bin/node --version`"
          echo "Lychee: `lychee --version`"
          echo "Lefthook: `lefthook version`"
          #exec zsh
          '';
        };
      });
    };
}

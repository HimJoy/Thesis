{
    description = ( "TUHH SMS Thesis Template" );

    inputs = {
        nixpkgs = { url = "github:NixOS/nixpkgs/nixos-unstable"; };
    };

    outputs = { self, nixpkgs }:
    let
        system = "x86_64-linux"; # should also work for "aarch64-linux" "aarch64-darwin" "x86_64-darwin"
        pkgs = nixpkgs.legacyPackages.${system};
        dependencies = [
            pkgs.buildPackages.texlive.combined.scheme-full
        ];
    in
    {
        devShells.${system}.default = pkgs.mkShell {
            buildInputs = dependencies;
            shellHook = ''
                export LC_ALL=C
            '';
        };
        packages.${system}.default = pkgs.stdenv.mkDerivation {
            name = "build-thesis";
            src = ./.;
            buildInputs = dependencies;
            installPhase = ''
                cp thesis.pdf $out
            '';
        };
    };
}

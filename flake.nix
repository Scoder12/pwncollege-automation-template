{
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs =
          [ (pkgs.python310.withPackages (ps: [ ps.requests ps.pwntools ps.paramiko ])) ];
      };
    };
}

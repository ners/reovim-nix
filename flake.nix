{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      lib = nixpkgs.lib;
      system = lib.attrByPath [ "currentSystem" ] "x86_64-linux" builtins;
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      reovim = pkgs.callPackage ./default.nix { };
      defaultPackage.${system} = self.reovim;
    };
}

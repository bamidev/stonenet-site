{
  description = "Publish the website";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system: 
      let
        pkgs = nixpkgs.legacyPackages.${system};
        publishSite = pkgs.writers.writeBashBin "publish-site" (with pkgs; ''
          set -e

          ${hugo}/bin/hugo
          ${rsync}/bin/rsync --delete -r -e '${openssh}/bin/ssh -p 12346' ./public/* stonenet@stonenet.org:/var/www/stonenet.org
        '');
      in {
        apps.publish = {
          name = "Publish the website";
          type = "app";
          program = "${publishSite}/bin/publish-site";
        };
      }
    );
}

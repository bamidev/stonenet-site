# Download Stonenet

## Linux

Currently, there are Debian packages and Nix modules for Stonenet.

### Debian

For any debian-based distro, you can install Stonenet like so:
```
echo "deb http://get.stonenet.org/debian stable main" > /etc/apt/sources.list.d/stonenet.list
wget -qO- - https://get.stonenet.org/gpg-key.pub | sudo apt-key add -
sudo apt update
sudo apt install stonenet stonenet-desktop
```

### Nix

There are Nix modules available, which can be used in your NixOS configuration, or in your home-manager configuration. You can put something like this in your NixOS or home-manager configuration:

```
{ lib, pkgs, ... }:
let
  stonenet = (builtins.getFlake "github:bamidev/stonenet/main").nixosModules.${builtins.currentSystem}.default;
in rec {
  imports = [
    stonenet
  ];

  services.stonenet = {
    enable = true;
    desktop.enable = true;

    config = {
      bucket_size = 4;
    };
  };

}
```

## Windows

You can get the latest installer over here: https://get.stonenet.org/windows/

## MacOS

Stonenet can be installed on MacOS via home-manager. See the Nix installation instructions above.

The desktop client will not work though, so you will need to disable it and access the user interface by navigating to `http://localhost:37338` in the browser.

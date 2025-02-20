# nixconfig-starter

A Nix/NixOS configuration using flakes to help you get started quickly

## Getting Started

- Fork this repo if you want to be able to save your customizations. For example, name it nixconfig.

### NixOS

- Download the [ISO](https://nixos.org/download.html#nixos-iso) and write it to a flash drive
- Install using the GUI installer or terminal

```
nix-shell -p git
git clone https://github.com/<GITHUB_USER>/nixconfig.git
cd nixconfig
cp /etc/nixos/*.nix systems/nixos
```

```
nano flake.nix
```

- Modify the `flake.nix` where it says "CHANGE ME" to the user you set up on installation
- Press ctrl+x to exit nano and select yes to save.

```
nano systems/nixos/configuration.nix
```

- Allow docker access: Under you user `extraGroups` add "docker" inside the brackets `[ ]`
- Use ZSH shell by default: On the line under extraGroups add `shell = "/etc/profiles/per-user/USERNAME/bin/zsh";` (replace USERNAME with your username)
- You can remove user specific packages since we are managing them using home-manager, delete the following lines:

```
    packages = with pkgs; [
      firefox
      kate
    #  thunderbird
    ];
```

- Press ctrl+x to exit nano and select yes to save.
- stage all changes with `git add .`

```
sudo nixos-rebuild boot --flake .#nixos
sudo reboot
```

Once the machine reboots, the login screen may still flicker. At bottom right of the screen, select `Gnome with Xorg` (or whatever your desktop manager is with `Xorg`).

If eveything works, commit and push these changes.

### Docker

```
docker-compose run --name mynix nix bash
home-manager switch --flake .#docker
```

Note: be careful of running `docker system prune` while the container is stopped since it will delete it

To restart the container after a reboot run:

```
docker start -i mynix
```

## Adding software

- You can search for software from this site: https://search.nixos.org/. The name of the package is the red text next to `Name` in the results
- Add the package to `home.packages` in `home/default.nix` or `home/graphical.nix` if it is GUI software
- Then run:

```
sudo nixos-rebuild switch --flake .#
```

## Upgrading

- Updates are manual, so set a calander event every Friday etc. to update your system
- All software, including the OS is locked to the nixpkgs git version in `flake.lock`, to update this run:

```
sudo nix flake update
```

- Then run this to apply and reboot

```
sudo nixos-rebuild boot --flake .#
sudo reboot
```

- Once you are confident everything is working, you can remove old generations with

```
sudo nix-collect-garbage -d
```

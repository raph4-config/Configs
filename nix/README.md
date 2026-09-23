# NIX

User environment managed by [Home Manager](https://nix-community.github.io/home-manager)
in standalone mode, through a flake.

## Layout

```text
nix
├── flake.lock
├── flake.nix
├── home
└── modules
```

## Commands

Run from `nix/`.

| Command                         | Does                                                  |
| ------------------------------- | ----------------------------------------------------- |
| `home-manager build --flake .`  | build without activating, result linked in `./result` |
| `home-manager switch --flake .` | build and activate a new generation                   |

### Inspect

| Command                    | Does                                                   |
| -------------------------- | ------------------------------------------------------ |
| `home-manager packages`    | packages installed in the active generation            |
| `home-manager generations` | list generations, the active one is marked `(current)` |

### Update

| Command                      | Does                                                 |
| ---------------------------- | ---------------------------------------------------- |
| `nix flake update --flake .` | bump inputs to their latest versions in `flake.lock` |

### Rollback and clean up

| Command                                      | Does                                          |
| -------------------------------------------- | --------------------------------------------- |
| `<generation path>/activate`                 | roll back to that generation                  |
| `home-manager expire-generations "-30 days"` | drop generations older than 30 days           |
| `nix store gc`                               | delete store paths no generation uses anymore |

### Explore

| Command                     | Does                                                  |
| --------------------------- | ----------------------------------------------------- |
| `nix search nixpkgs <name>` | find a package name                                   |
| `nix shell nixpkgs#<name>`  | try a package in a throwaway shell, nothing installed |

## Add a package

1. Find its name on [search.nixos.org](https://search.nixos.org/packages).
2. Add `pkgs.<name>` to `home.packages` in `home/default.nix`.
3. `home-manager switch --flake .`
4. If brew had it too: `brew uninstall <name>` then `hash -r`, brew comes first in `PATH`.

## Dev shells

Not used yet. A dev shell is a temporary environment entered with `nix develop` and gone
on `exit`. Global tools belong in `modules/`, and each project's `.venv` holds its own
dependencies, so one is only worth it when:

- a project needs another language version or system libraries (postgresql, openssl)
- a personal project: put its `flake.nix` in the project repo, not here
- a work repo that must not ship Nix files: a local `.envrc` with
  `use flake ~/raph_config/nix#<shell>`, ignored by git

Another Python version for a venv, without installing it anywhere:

```sh
nix shell nixpkgs#python311 -c python3.11 -m venv .venv
```

## Useful links

| Link                               | For                                                 |
| ---------------------------------- | --------------------------------------------------- |
| [Zero to Nix][zero-to-nix]         | first contact: store, flakes, dev shells            |
| [nix.dev][nix-dev]                 | official tutorials, the Nix language                |
| [NixOS & Flakes Book][flakes-book] | practical flakes and Home Manager setups            |
| [Home Manager manual][hm-manual]   | install modes, flakes, how modules work             |
| [Home Manager options][hm-options] | every option (`programs.*`, `home.*`) with examples |
| [NixOS packages][nixos-packages]   | package names and versions in nixpkgs               |
| [Nix Pills][nix-pills]             | how Nix works under the hood, for later             |

[zero-to-nix]: https://zero-to-nix.com
[nix-dev]: https://nix.dev
[flakes-book]: https://nixos-and-flakes.thiscute.world
[hm-manual]: https://nix-community.github.io/home-manager/
[hm-options]: https://home-manager-options.extranix.com
[nixos-packages]: https://search.nixos.org/packages
[nix-pills]: https://nixos.org/guides/nix-pills/

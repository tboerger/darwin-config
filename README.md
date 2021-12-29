# workstation

[![Build](https://github.com/tboerger/workstation/actions/workflows/build.yml/badge.svg)](https://github.com/tboerger/workstation/actions/workflows/build.yml)

Provisioning for my [NixOS](https://nixos.org/) workstations.

## chnum

```console
sudo nix-shell --packages nixUnstable

bash -c "$(curl -fsSL https://raw.githubusercontent.com/tboerger/workstation/master/scripts/chnum-partitions)"
nixos-install --root /mnt --flake github:tboerger/workstation#chnum
```

## Security

If you find a security issue please contact thomas@webhippie.de first.

## Contributing

Fork -> Patch -> Push -> Pull Request

## Authors

-   [Thomas Boerger](https://github.com/tboerger)

## License

Apache-2.0

## Copyright

```console
Copyright (c) 2021 Thomas Boerger <thomas@webhippie.de>
```

# workstation

[![Build](https://github.com/tboerger/workstation/actions/workflows/build.yml/badge.svg)](https://github.com/tboerger/workstation/actions/workflows/build.yml)

Provisioning for my Macbook's based on [Nix](https://nixos.org/manual/nix/stable/).

## Osiris

Generally we disable SIP, just boot into the recovery system and open a terminal
to execute `csrutil disable`, after rebooting into the regular system you can
check with `csrutil status` if it's still disabled.

### Bootstrap

Copy the SSH keys from our secret stick, otherwise it's really difficult to
decrypt the secrets stored within this repository.

```console
sh <(curl -L https://nixos.org/nix/install)
echo "run\tprivate/var/run" | sudo tee -a /etc/synthetic.conf
reboot

nix \
    --extra-experimental-features "nix-command flakes" \
    build \
    github:tboerger/workstation\#osiris \
    --no-write-lock-file

./result/sw/bin/darwin-rebuild switch \
    --flake github:tboerger/workstation\#osiris
```

### Updates

If the repository had been cloned you could just execute `make switch`,
otherwise there is still this long option to update the deployment:

```console
darwin-rebuild switch \
    --flake github:tboerger/workstation\#osiris
```

## Hathor

Generally we disable SIP, just boot into the recovery system and open a terminal
to execute `csrutil disable`, after rebooting into the regular system you can
check with `csrutil status` if it's still disabled.

### Bootstrap

Copy the SSH keys from our secret stick, otherwise it's really difficult to
decrypt the secrets stored within this repository.

```console
sh <(curl -L https://nixos.org/nix/install)
echo "run\tprivate/var/run" | sudo tee -a /etc/synthetic.conf
reboot

nix \
    --extra-experimental-features "nix-command flakes" \
    build \
    github:tboerger/workstation\#hathor \
    --no-write-lock-file

./result/sw/bin/darwin-rebuild switch \
    --flake github:tboerger/workstation\#hathor
```

### Updates

If the repository had been cloned you could just execute `make switch`,
otherwise there is still this long option to update the deployment:

```console
darwin-rebuild switch \
    --flake github:tboerger/workstation\#hathor
```

## Anubis

Generally we disable SIP, just boot into the recovery system and open a terminal
to execute `csrutil disable`, after rebooting into the regular system you can
check with `csrutil status` if it's still disabled.

### Bootstrap

Copy the SSH keys from our secret stick, otherwise it's really difficult to
decrypt the secrets stored within this repository.

```console
sh <(curl -L https://nixos.org/nix/install)
echo "run\tprivate/var/run" | sudo tee -a /etc/synthetic.conf
reboot

nix \
    --extra-experimental-features "nix-command flakes" \
    build \
    github:tboerger/workstation\#anubis \
    --no-write-lock-file

./result/sw/bin/darwin-rebuild switch \
    --flake github:tboerger/workstation\#anubis
```

### Updates

If the repository had been cloned you could just execute `make switch`,
otherwise there is still this long option to update the deployment:

```console
darwin-rebuild switch \
    --flake github:tboerger/workstation\#anubis
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

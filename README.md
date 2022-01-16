# workstation

[![Build](https://github.com/tboerger/workstation/actions/workflows/build.yml/badge.svg)](https://github.com/tboerger/workstation/actions/workflows/build.yml)

Provisioning for my Macbook's based on [Nix][nix].

## Secrets

Generally all secrets are encrypted with [agenix][agenix], so make sure to copy
the SSH keys from the `secrets` stick with these commands:

```console
mkdir -p $HOME/.ssh
cp /Volumes/secrets/ssh/id_* $HOME/.ssh/
chmod u=rw,g=,o= $HOME/.ssh/id_*
```

## Prepare

Generally we disable SIP, just boot into the recovery system and open a terminal
to execute `csrutil disable`, after rebooting into the regular system you can
check with `csrutil status` if it's still disabled.

Generally it's a good idea to install all apps from the store which have been
bought, especially Xcode, otherwise it fails to build macOS applications.

## Osiris

### Bootstrap

```console
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

### Bootstrap

```console
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

### Bootstrap

```console
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

[nix]: https://nixos.org/manual/nix/stable/
[agenix]: https://github.com/ryantm/agenix

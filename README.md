# Workstation

[![Build Status](https://cloud.drone.io/api/badges/tboerger/workstation/status.svg)](https://cloud.drone.io/tboerger/workstation)

Provisioning for some of my workstations based on [Ansible](https://www.ansible.com). This repository is following [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) to automatically generate changelogs from the Git history.

## Prepare

To be able to use these scripts you got to allow the terminal app (or the terminal you are using while bootstrapping) full disk access within the security and privacy settings. Open the `System Preferences`, head to `Security & Privacy` into the `Privacy` tab, scroll down to `Full Disk Access` and drag your terminal application into the listing.

```console
curl -sSLo- https://raw.github.com/tboerger/workstation/master/bin/bootstrap | bash
echo "secure-vault-password" >| $HOME/.workstation/.vaultpasswd
```

## Hathor

```console
cd $HOME/.workstation/

bin/galaxy
bin/playbook -c local -l hathor -D -K
```

## Maat

```console
cd $HOME/.workstation/

bin/galaxy
bin/playbook -c local -l maat -D -K
```

## Osiris

```console
cd $HOME/.workstation/

bin/galaxy
bin/playbook -c local -l osiris -D -K
```

## Security

If you find a security issue please contact thomas@webhippie.de first.

## Contributing

Fork -> Patch -> Push -> Pull Request

## Authors

* [Thomas Boerger](https://github.com/tboerger)

## License

Apache-2.0

## Copyright

```console
Copyright (c) 2019 Thomas Boerger <thomas@webhippie.de>
```

# Workstation

Provisioning for some of my workstations based on [Ansible][ansible]. This
repository is following [conventional commits][commits] to automatically
generate changelogs from the Git history.

## Prepare

```console
wget -O- https://raw.github.com/tboerger/workstation/master/bin/bootstrap | bash
echo "secure-vault-password" >| $HOME/.workstation/.vaultpasswd
```

## Chnum

```console
workstation-galaxy
workstation-playbook -c local -l chnum -D -K
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
Copyright (c) 2019 Thomas Boerger <thomas@webhippie.de>
```

[ansible]: https://www.ansible.com
[commits]: https://www.conventionalcommits.org/en/v1.0.0/

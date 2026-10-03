# homelab-ansible-role-shell

[![Lint](https://github.com/iamrobertyoung/homelab-ansible-role-shell/actions/workflows/lint.yml/badge.svg)](https://github.com/iamrobertyoung/homelab-ansible-role-shell/actions/workflows/lint.yml)
[![Release](https://github.com/iamrobertyoung/homelab-ansible-role-shell/actions/workflows/release.yml/badge.svg)](https://github.com/iamrobertyoung/homelab-ansible-role-shell/actions/workflows/release.yml)
[![SLSA 3](https://slsa.dev/images/gh-badge-level3.svg)](https://slsa.dev)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/iamrobertyoung/homelab-ansible-role-shell/badge)](https://securityscorecards.dev/viewer/?uri=github.com/iamrobertyoung/homelab-ansible-role-shell)

Ansible role for configuring shell environments. Sets up zsh with oh-my-zsh, a custom theme, and vim configuration.

## Requirements

- Ansible >= 2.15
- Target: Ubuntu (focal, jammy, noble) or Debian (bullseye, bookworm, trixie)

## Role Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `shell_user` | `noxious` | Target user for shell configuration |
| `shell_home_directory` | `/home/{{ shell_user }}` | User's home directory |
| `shell_show_pretty_info` | `true` | Display hostname (figlet) and system info on shell startup |
| `shell_hostname` | **required** | Hostname to display on shell startup (required if `shell_show_pretty_info` is true) |
| `shell_ohmyzsh_directory` | `{{ shell_home_directory }}/.oh-my-zsh` | Oh-My-Zsh installation directory |
| `shell_ohmyzsh_update` | `false` | Update oh-my-zsh when running the role |
| `shell_ohmyzsh_update_mode` | `disabled` | Oh-my-zsh update mode: `disabled`, `auto`, or `reminder` |

## Tags

Run specific parts of the role using tags:

- `zsh` - Zsh and oh-my-zsh configuration
- `vim` - Vim configuration

## Usage

### Install via requirements.yml

```yaml
- src: git@github.com:iamrobertyoung/homelab-ansible-role-shell.git
  scm: git
  version: main
  name: shell
```

```bash
ansible-galaxy install -r requirements.yml
```

### Example Playbook

```yaml
- hosts: servers
  roles:
    - role: shell
      vars:
        shell_user: myuser
        shell_hostname: my-server
        shell_show_pretty_info: true
```

### Run specific tasks

```bash
ansible-playbook site.yml --tags "zsh"
ansible-playbook site.yml --tags "vim"
```

## What Gets Installed

### Zsh
- zsh shell with oh-my-zsh framework
- Custom codespaces theme with git status integration
- figlet and hyfetch/neofetch for system info display

### Vim
- vim editor with dark theme (desert colorscheme)
- Syntax highlighting enabled

## Supply Chain Security

This role uses SLSA Level 3 provenance for release artifacts. You can verify the provenance of downloaded releases using the GitHub CLI:

```bash
gh attestation verify shell-v1.0.0.tar.gz --owner iamrobertyoung
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for development setup and guidelines.

## License

MIT

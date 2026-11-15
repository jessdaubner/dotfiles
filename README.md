# Overview
Setup a development environment for a new Mac quickly with my prefered tools and configurations.

#### Organization
* *zsh* - .zshrc for the default macOS shell (git-aware prompt, asdf, direnv, aliases)
* *bash* - .bashrc, .profile with the same setup for bash
* *vim* - .vimrc with aliases, styling, and plugins
* *asdf* - notes on using asdf + direnv for per-project tool versions
* *Brewfile* - software installed with Homebrew

## Setup
1. Configure Github by [creating a new SSH key and adding it to your account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).
2. Clone this repo and run the setup script:

```bash
git clone git@github.com:jessdaubner/dotfiles.git
cd dotfiles && ./setup.sh
```

`setup.sh` is safe to re-run. It:
* installs [Homebrew](https://brew.sh/) if missing (needs `sudo`; skipped with a warning if you don't have it) and installs everything in the `Brewfile` with `brew bundle`
* symlinks `.zshrc`, `.bashrc`, `.profile`, `.vimrc` and `.tmux.conf` into `$HOME`, backing up any existing files as `<name>.bak.<timestamp>`
* installs [vim-plug](https://github.com/junegunn/vim-plug) and the vim plugins

Open a new terminal afterwards to load the shell config. Put machine-specific settings (work aliases, secrets) in `~/.zshrc.local`, which is sourced but not tracked.

### Shell
zsh is the macOS default and is what `zsh/.zshrc` targets. To use bash instead, install Homebrew's bash, add `$(brew --prefix)/bin/bash` to `/etc/shells` and run `chsh -s $(brew --prefix)/bin/bash`; `bash/.bashrc` has the same setup.

Optionally, change the Terminal profile in Settings > Profiles (e.g. Pro, 16pt font).

### Git
```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
gh auth login
```

### Configure Cloud Provider CLI
#### Azure
Run `az login`.
#### AWS
Run `aws configure` and enter AWS Access Key ID, AWS Secret Access Key, and region.

### Installation checks
```bash
brew --version
git --version
gh --version
asdf --version
direnv --version
```

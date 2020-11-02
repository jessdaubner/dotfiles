# Overview
Setup a development environment for a new Mac quickly with my prefered tools and configurations.

#### Organization
* *vim* - .vimrc with aliases, styling, and plugins
* *bash* - .bashrc, .profile to configure terminal
* *ssh* - Github, VPN templates

## Downloads & Configurations

### General Software
1. Clone this repo and run the setup script on your new machine.

```bash
git clone git@github.com:jessdaubner/dotfiles.git
cd dotfiles && setup.sh
```
`setup.sh` installs [Home Brew](https://brew.sh/) and uses [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) to install software on your macOS.

2. Configure Github by [creating a new public key and adding it to your account](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/).

### Configure Vim
1. Download [vim-plug](https://github.com/junegunn/vim-plug), a minimalist Vim plugin manager
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
2. Copy the `.vimrc` file to home directory
```bash
cp dotfiles/vim/.vimrc ~/.vimrc
```
3. Start vim and install the plugins
```bash
vim
:PlugInstall
```

### Configure Terminal
1. For the newer version of MacOS, continue to use bash as the default shell with `chsh -s /bin/bash` and verify the change with `echo "$SHELL"`
2. Copy the `.bashrc` and `.profile` files to home directory
```bash
cp dotfiles/bash/* ~/
source ~/.bashrc
```
3. Manually modify the default Terminal settings Preferences > Profile > Select the Pro profile and change font size to 16pt.

### Python
Add the Python 3 location to the $PATH variable
```bash
~ export PATH=~/Library/Python/3.7/bin:$PATH
```

### Configure AWS CLI
Run `aws configure` and enter AWS Access Key ID, AWS Secret Access Key, and region.

### Installation checks
```bash
which python
python --version
aws --version
java --version
```

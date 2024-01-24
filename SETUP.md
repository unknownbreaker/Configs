# Setup Notes

## Linux

### Runtime Environments

NVM

```console
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install --lts
```

Golang

```console
wget https://go.dev/dl/go1.21.6.linux-amd64.tar.gz
tar -C ~/local -xzf go1.21.6.linux-amd64.tar.gz
rm go1.21.6.linux-amd64.tar.gz
```

Python

```console
curl https://pyenv.run | bash
pyenv install 3
```

In case Python installation fails due to missing OpenSSL.
OpenSSL

```console
wget https://www.openssl.org/source/openssl-3.2.0.tar.gz
tar zxvf openssl-3.2.0.tar.gz
cd openssl-3.2.0

USERNAME=XXX \
./config --prefix=/home/$USERNAME/local/openssl --openssldir=/home/$USERNAME/local/openssl no-ssl2

make

make test

make install
```

```console
openssl version -d

CONFIGURE_OPTS="-with-openssl=<openssl install prefix>" \
pyenv install 3
```

Ruby

```console
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
```

### Zsh

oh-my-zsh

```console
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

fzf-zsh-plugin

```console
git clone --depth 1 https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
```

zsh-autosuggestions

```console
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

zsh-syntax-highlighting

```console
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Symlink custom theme

```console
cd ~/.oh-my-zsh/custom/themes && ln -s ~/Configs/Zsh/rob.zsh-theme rob.zsh-theme && cd -
```

autojump

```console
git clone https://github.com/wting/autojump.git ~/autojump
cd ~/autojump
./install.py
rm -rf ~/autojump
```

### Tmux

TPM

```console
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Neovim

```console
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar zxvf nvim-linux64.tar.gz
mv nvim-linux64 ~/local
```

### LazyVim

```console
mv ~/.config/nvim{,.bak}
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

LazyGit

```console
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit ~/local/bin
rm lazygit.tar.gz
```

### Misc

```console
git clone https://github.com/wwalker/ssh-find-agent.git ~/Documents/Repos/ssh-find-agent
```

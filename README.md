# my-configurations

## Install Brew
```
https://brew.sh/index_ko
```

## Install Fish

```shell
brew install fish
```

```shell
cat /etc/shells
which fish

~ % which fish
/opt/homebrew/bin/fish

sudo -e /etc/shells
```
> Add fish abs path to last line

```shell
chsh -s /opt/homebrew/bin/fish
```

## Font - Fira code

```
brew tap homebrew/cask-fonts &&
brew install --cask font-Fira-Code-nerd-font
```

```shell
fish_add_path /opt/homebrew/bin
```

## Install rbenv
```
brew install rbenv
```

## Install pyenv

```
brew install pyenv xz
env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.10.3
pyenv global 3.10.3
```

## Install Neovim
```shell
brew install neovim
pip3 install pynvim
```

## Install Tig
```$ brew install tig```

## Install Tmux
```sh
$ brew install tmux
```

### Setup TMUX 
```sh
git clone https://github.com/gpakosz/.tmux.git "$HOME/private/tmux"
cp -rf "~/private/my-configurations/.config/tmux" ~/.config/tmux
ln -s "$HOME/private/tmux/.tmux.conf" "~/.config/tmux/tmux.conf"
```

## Install CMake
```sh
$ brew install cmake
```

## Setup NVIM config

```
mkdir -p ~/.config/nvim
```

# Install Language

## Installing Go

### gvm
```
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
```

### After M1 (Appli silicon)
```
curl -sSL https://golang.org/dl/go1.16.2.darwin-amd64.tar.gz | tar zxv
export GOROOT_BOOTSTRAP="$(pwd)/go"
gvm install go1.22.0

rm -rf go
```

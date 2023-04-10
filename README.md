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

## Install rbenv
```
brew install rbenv
```

## Install pyenv

```
env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.10.3
pyenv global 3.10.3
```

## Get Mac Terminal color scheme
```
mkdir ~/tmp
cd ~/tmp
wget https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/terminal/OceanicMaterial.terminal
```

## Zsh

### Installing oh my zsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Themes

ZSH_THEME="agnoster"

### Installing completions and jump
```
brew install zsh-completions autojump zsh-syntax-highlighting zsh-autosuggestions
```

### Download .zshrc
```
curl -o ~/.zshrc https://raw.githubusercontent.com/9to6/my-configurations/master/.zshrc
```

### directory permission problems
``
compaudit | xargs chmod g-w`
```


## Install Neovim
```shell
brew install neovim
pip3 install pynvim
```

## Install Tig
```$ brew install tig```

## Install Tmux
```$ brew install tmux```

### Downloading tmux.conf
```
curl -o ~/.tmux.conf https://raw.githubusercontent.com/9to6/my-configurations/master/tmux.conf.mac
```

## Install CMake
```$ brew install cmake```

## Install ctags
```$ brew install ctags```

## Setup NVIM config

```
mkdir -p ~/.config/nvim
```

```
cat > ~/.config/nvim/init.vim << EOF
set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc
EOF
```

## vimrc
```bash
curl -o ~/.vimrc https://raw.githubusercontent.com/9to6/my-configurations/master/vimrc.nvim
```

## [Vundle](https://github.com/VundleVim/Vundle.vim) Install
```$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim```

### Install Plugin
Launch ```nvim``` and run ```:PluginInstall```

### Compile [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
```sh
$ cd ~/.vim/bundle/YouCompleteMe/
$ ./install.py --gocode-completer
```
Launch ```vim```, open ```.go``` file and run ```:GoInstallBinaries```


# Install Language

## Installing Go

### gvm
```
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
```

### Not M1
```
gvm install go1.4 -B
gvm install go1.
```

### M!
```
curl -sSL https://golang.org/dl/go1.16.2.darwin-amd64.tar.gz | tar zxv
export GOROOT_BOOTSTRAP="$(pwd)/go"
gvm install go1.17.8

rm -rf go
```

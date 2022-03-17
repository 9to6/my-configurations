# my-configurations

## Install Brew
```
https://brew.sh/index_ko
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

## Font - Fira code

```
brew tap homebrew/cask-fonts
brew cask install font-fira-code
```

## Get Mac Terminal color scheme
```
mkdir ~/tmp
cd ~/tmp
wget https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/terminal/iceberg-dark.terminal
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
brew install zsh-completions jump zsh-syntax-highlighting zsh-autosuggestions
```


### Installings Plugins
```
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

### Updating .zshrc file
`plugins=(git zsh-syntax-highlighting zsh-autosuggestions)`

## Install Neovim
```shell
brew install neovim
pip3 install pynvim
```

## Install Tig
```$ brew install tig```

## Install Tmux
```$ brew install tmux```

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

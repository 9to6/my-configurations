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
env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.9.7
```

## Font - Fira code

```
brew tap homebrew/cask-fonts
brew cask install font-fira-code
```

## Zsh

### Installing oh my zsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Themes

ZSH_THEME="agnoster"

### Installing Zsh and completions
```
brew install zsh zsh-completions
```

### Installing Jump plugin
```
brew install jump
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

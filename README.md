# my-configurations

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

### Installings Plugins
```
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

### Updating .zshrc file
`plugins=(git zsh-syntax-highlighting zsh-autosuggestions)`

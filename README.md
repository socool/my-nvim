# Step to install plugin

## Create plugin file (*.lua)
```
vim.keymap.set("n","<C-n>",":Neotree toggle<CR>",{noremap = true, silent = true})
```
## Install nerd font

### Step 1 - Add Cask-Fonts Formulae
```
brew tap homebrew/cask-fonts
```

### Step 2 - Install each font

```
brew tap homebrew/cask-fonts
brew install --cask font-3270-nerd-font
brew install --cask font-fira-mono-nerd-font
brew install --cask font-inconsolata-go-nerd-font
brew install --cask font-inconsolata-lgc-nerd-font
brew install --cask font-inconsolata-nerd-font
brew install --cask font-monofur-nerd-font
brew install --cask font-overpass-nerd-font
brew install --cask font-ubuntu-mono-nerd-font
brew install --cask font-agave-nerd-font
brew install --cask font-arimo-nerd-font
brew install --cask font-anonymice-nerd-font
brew install --cask font-aurulent-sans-mono-nerd-font
brew install --cask font-bigblue-terminal-nerd-font
brew install --cask font-bitstream-vera-sans-mono-nerd-font
brew install --cask font-blex-mono-nerd-font
brew install --cask font-caskaydia-cove-nerd-font
brew install --cask font-code-new-roman-nerd-font
brew install --cask font-cousine-nerd-font
brew install --cask font-daddy-time-mono-nerd-font
brew install --cask font-dejavu-sans-mono-nerd-font
brew install --cask font-droid-sans-mono-nerd-font
brew install --cask font-fantasque-sans-mono-nerd-font
brew install --cask font-fira-code-nerd-font
brew install --cask font-go-mono-nerd-font
brew install --cask font-gohufont-nerd-font
brew install --cask font-hack-nerd-font
brew install --cask font-hasklug-nerd-font
brew install --cask font-heavy-data-nerd-font
brew install --cask font-hurmit-nerd-font
brew install --cask font-im-writing-nerd-font
brew install --cask font-iosevka-nerd-font
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-lekton-nerd-font
brew install --cask font-liberation-nerd-font
brew install --cask font-meslo-lg-nerd-font
brew install --cask font-monoid-nerd-font
brew install --cask font-mononoki-nerd-font
brew install --cask font-mplus-nerd-font
brew install --cask font-noto-nerd-font
brew install --cask font-open-dyslexic-nerd-font
brew install --cask font-profont-nerd-font
brew install --cask font-proggy-clean-tt-nerd-font
brew install --cask font-roboto-mono-nerd-font
brew install --cask font-sauce-code-pro-nerd-font
brew install --cask font-shure-tech-mono-nerd-font
brew install --cask font-space-mono-nerd-font
brew install --cask font-terminess-ttf-nerd-font
brew install --cask font-tinos-nerd-font
brew install --cask font-ubuntu-nerd-font
brew install --cask font-victor-mono-nerd-font
```

### Step 3 - Setup font
- Restart your macosx
- Select font "Edit Session" > "Text" > "Font"

## Link
- https://alpha2phi.medium.com/
Medium store all thing about nvm
- https://github.com/folke/which-key.nvim
Nvim plugin display popup with key bidngs
- https://github.com/nvim-neo-tree/neo-tree.nvim
Nvim plugin for tree browse file system
- https://github.com/Chalermpun/IDE
Example personal IDE
- https://www.nerdfonts.com/
Iconic font aggregator, collection, patcher

## How to 
- Format file <space>+fm

## Hot Key
### Move cursor
- 0: goto start line
- $: goto end of line
- w: move next word
- b: back next word
- {: move to next paragraph
- }: back to previous paragraph

### Move screen
- Ctrl+F: move forwards full scrren
- Ctrl+B: move backwards full screen
- Ctrl+D: move down half screen
- Ctrl+U: move up half screen
- Ctrl+E: scroll down
- Ctrl+Y: scroll up
- zz: center cursor line
- zt: put cursor line at top
- zb: put curosor line at bottom 

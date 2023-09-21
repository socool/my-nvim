# Step to install plugin

## Create plugin file (\*.lua)

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

## Special Keys

<cmd> - is : which starts a cmd
<cr> - is enter
<Esc> - is Escape
<C-x> - is Ctrl+x
<M-x> - is alt+x
<M-X> - is alt+shift+x
<A-x> - is alt+x
<A-X> - is alt+shift+x
<leader> - is the leader key

## Hot Key

### Basic binds

- i: enter Insert mode
- a: enter insert mode After the cursor
- I: enter Insert mode at the beginning of the line
- A: enter insert mode at the end of the line (same as a but for the entire line)
- o: insert new line below
- O: insert new line above
- u: Undo, check out undotree
- Ctrl+r: Redo
- zz: Recenter the screen, there are more binds for screen actions but this is the most important one

### Arrows

- h: left
- j: down
- k: up
- l: right

### Words

- w: jump Word forward
- b: jump word Backwards
- e: jump forward to the End of the word
- ge: jump to the End of the previous word

### Generics

- 0: go to the beginning of the line
- $: go to the end of the line
- <C-u>: go Up half a page
- <C-d>: go Down half a page
- %: jump to the pair of the bracket/quote/ifdef your cursor on
- <C-o>: jump to the previous position you jumped from (you can do it multiple times)
- <C-i>: jump to the next position you jumped to (you can do it multiple times)

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

### Git

- Space+g+t: show git window
- c+c: commit all change
- g+Space+Push: push chaneg

### Tips

- g+.: show hidden file
- Space+x+s: show system info
- Ctrl+\: terminal

### Navigate & Find

- t: find word in current cursor
- f: find character in current
- Ctrl+P: telescope file browser
- Space+f+g: live grep
- :%s/^M//g: remove ^M entered by holding down Ctrl and typing v followerd by m,and release Ctrl

### Theme

- :Telescope colorschema: change theme

### ChatGPT

- Shift+V+): select code snippet
- y+Space+C+e: show code snippet for ChatGPT
- Ctr+d: show difference

### Coding

#### numToStr/Comment.nvim

##### Visual Mode

- g+c+c: toggles the current line using linewise comment
- g+b+c: toggles the current line using blockwise comment
- [COUNT]+g+c+c: toggles the number of line given as a prefix-count using linewise
- [COUNT]+g+b+c: toggles the number of line given as a prefix-count using blockise

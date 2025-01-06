# `my dotfiles`

## Nvim

### Shortcuts

#### Copilot

- `<Leader>aa` - open copilot chat window
- `<c-s>` - with copilot window open, request a response from copilot

### Known Issues

1. Copilot only completing one line - solution is to use a different version of node [Github](https://github.com/orgs/community/discussions/16593)

## Vim

### Setup

1. Make sure submodules are checked out after pull:

   git submodule init
   git submodule update

2. Set up coc (<https://github.com/neoclide/coc.nvim>)

   cd .vim/bundle/coc.nvim

   yarn

To update already downloaded modules,

    git submodule update --remote --merge

or, if that doesn't work:

    git submodule foreach git reset --hard HEAD

    git submodule foreach git checkout master

    git submodule foreach git pull origin master

## Reference

- [Neovim Options List](https://neovim.io/doc/user/options.html)
- [Neovim Default options](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua)
- [Fzf-lua docs - custom keybinds](https://github.com/ibhagwan/fzf-lua/wiki#how-do-i-set-custom-actions)

### Renaming variable

1. Place cursor over variable
2. Press `gd` to go to function definition and highlight entire word
3. Press `cgn` and type a new name for the variable
4. Press `.` to repeat the change until all instances are renamed

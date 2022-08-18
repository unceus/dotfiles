`my dotfiles`

# Setup

1. Make sure submodules are checked out after pull:

    git submodule init
    git submodule update

2. Set up coc (https://github.com/neoclide/coc.nvim)

    cd .vim/bundle/coc.nvim

    yarn

To update already downloaded modules,

    git submodule update --remote --merge

or, if that doesn't work:

    git submodule foreach git reset --hard HEAD

    git submodule foreach git checkout master

    git submodule foreach git pull origin master

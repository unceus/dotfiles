`my dotfiles`


Make sure submodules are checked out after pull:

    git submodule init
    git submodule update

To update already downloaded modules,
    
    git submodule update --recursive

or, if that doesn't work:

    git submodule foreach git reset --hard HEAD
    
    git submodule foreach git checkout master

    git submodule foreach git pull origin master

# Configs
Syncing up all my settings.

## Local configuration
### Instructions

1. Move the directory/file into `~/[Base]/Config/[App]` folder.
2. After directory/file has been removed from original location, stay inside that location and create a symlink to the path where the real directory/file exists. <br>`ln -s ~/[Base]/Configs/[App]/[dir OR file name]`

## Vim
### Instructions
####Adding new plugins
`git submodule add [ssh path without .git] [path to submodule in repo]` (This clones the repo but also adds to .gitmodules file and indexes it as a submodule.)

#### Setup system for plugins

In case, the system is not setup yet, do the following:

##### Install universal-ctags to support `vim-gutentags`.

```
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```

##### Install YouCompleteMe

After cloning all submodules within YouCompleteMe, go to the root and run:
```
install.sh
```

##### Install Silver Searcher

Using ack.vim plugin to power searching in files. vimrc is hijacking it to use Ag instead. Install Silver Searcher:
```
brew install the_silver_searcher
```

#### Syncing plugins on different machine
1. `git pull origin master` to update the local machine's settings.
2. `git submodule init` to index the new submodules found in .gitmodules.
3. `git submodule update` to download the plugin to the machine.

#### Installing matcher
```shell
$ make
# move `matcher` somewhere useful
$ make install
# make install will install it to /usr/local/bin.
```

# Configs
Syncing up all my settings.
## Vim
### Instructions
####Adding new plugins
`git submodule add [path]` (This clones the repo but also adds to .gitmodules file and indexes it as a submodule.)

#### Syncing plugins on different machine
1. `git pull origin master` to update the local machine's settings.
2. `git submodule init` to index the new submodules found in .gitmodules.
3. `git submodule update` to download the plugin to the machine.

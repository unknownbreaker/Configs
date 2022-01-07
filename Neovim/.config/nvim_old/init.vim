" auto-install vim-plug                                                                                                                
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))                                                                                    
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \                                                                  
      source https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                                                             
  autocmd VimEnter * PlugInstall                                                                                                      
endif                                                                                                                                 

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/settings.vim
" Use this when Neovim 0.5.0 is fully released
" source ~/.config/nvim/lua.vim
" source ~/.config/nvim/plugin-vim-airline.vim
source ~/.config/nvim/plugin-vim-lightline.vim
source ~/.config/nvim/plugin-vim-startify.vim
source ~/.config/nvim/plugin-vim-unimpaired.vim
source ~/.config/nvim/plugin-fzf.vim.vim
" source ~/.config/nvim/plugin-fzf-preview.vim
source ~/.config/nvim/plugin-fzf-checkout.vim
source ~/.config/nvim/plugin-coc.nvim.vim
source ~/.config/nvim/plugin-coc-explorer.vim
source ~/.config/nvim/plugin-coc-diagnostic.vim
source ~/.config/nvim/plugin-coc-bookmark.vim

" source ~/.config/nvim/plugin-vim-agriculture.vim
" source ~/.config/nvim/plugin-nerdtree.vim
" source ~/.config/nvim/plugin-nerdtree-git-plugin.vim
source ~/.config/nvim/plugin-nerdcommenter.vim
source ~/.config/nvim/plugin-detectindent.vim
source ~/.config/nvim/plugin-vim-orgmode.vim
source ~/.config/nvim/plugin-vim-pasta.vim
source ~/.config/nvim/plugin-limelight.vim.vim
source ~/.config/nvim/plugin-vim-fugitive.vim
source ~/.config/nvim/plugin-vimwiki.vim
source ~/.config/nvim/plugin-vim-speeddating.vim
source ~/.config/nvim/plugin-vim-graphql.vim
source ~/.config/nvim/plugin-vimspector.vim
source ~/.config/nvim/plugin-vim-maximizer.vim

" source ~/.config/nvim/plugin-ale.vim
" source ~/.config/nvim/plugin-coc-prettier.vim
" source ~/.config/nvim/plugin-coc-emmet.vim
source ~/.config/nvim/plugin-coc-fzf-preview.vim
" source ~/.config/nvim/plugin-vim-gutentags.vim
if !exists('g:vscode')
endif


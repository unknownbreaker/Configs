call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'tpope/vim-obsession'

Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" CoC plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-emmet'
Plug 'neoclide/coc-json'
Plug 'neoclide/coc-tabnine'
Plug 'neoclide/coc-css'
Plug 'neoclide/coc-html'
Plug 'voldikss/coc-bookmark'
Plug 'neoclide/coc-snippets'
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/vim-jsx-improve'

" Orgmode support
Plug 'jceb/vim-orgmode'
Plug 'mattn/calendar-vim'
Plug 'vim-scripts/utl.vim'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-speeddating'
Plug 'chrisbra/NrrwRgn'
Plug 'vim-scripts/SyntaxRange'

" vimwiki
Plug 'vimwiki/vimwiki'

Plug 'jpalardy/vim-slime'

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'haya14busa/vim-textobj-function-syntax'
Plug 'pangloss/vim-javascript'
Plug 'glts/vim-textobj-comment'
Plug 'sgur/vim-textobj-parameter'
Plug 'vimtaku/vim-textobj-keyvalue'
Plug 'jceb/vim-textobj-uri'

" Snippets
Plug 'andys8/vscode-jest-snippets'
Plug 'xabikos/vscode-javascript'
Plug 'xabikos/vscode-react'

Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'scss', 'css', 'json', 'html', 'markdown'] }
Plug 'vim-airline/vim-airline'
Plug 'iCyMind/NeoSolarized'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'ciaranm/detectindent'
Plug 'sickill/vim-pasta'

Plug 'junegunn/limelight.vim'

call plug#end()

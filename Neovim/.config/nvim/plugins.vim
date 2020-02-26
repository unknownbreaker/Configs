call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'tpope/vim-obsession'
Plug 'christoomey/vim-tmux-navigator'

Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Coc Extensions
Plug 'neoclide/coc-emmet'
Plug 'neoclide/coc-json'
Plug 'neoclide/coc-tabnine'
Plug 'neoclide/coc-css'
Plug 'neoclide/coc-html'
Plug 'voldikss/coc-bookmark'
Plug 'neoclide/coc-snippets'
Plug 'neoclide/coc-tsserver'

" Orgmode support
" Plug 'jceb/vim-orgmode'
Plug 'mattn/calendar-vim'
" Plug 'vim-scripts/utl.vim'
" Plug 'vim-scripts/taglist.vim'
" Plug 'majutsushi/tagbar'
" Plug 'chrisbra/NrrwRgn'
" Plug 'vim-scripts/SyntaxRange'

" Note taking
Plug 'vimwiki/vimwiki'
Plug 'dhruvasagar/vim-dotoo'

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
Plug 'neoclide/vim-jsx-improve'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-jdaddy'
Plug 'nelstrom/vim-textobj-rubyblock'

" Snippets
Plug 'andys8/vscode-jest-snippets'
Plug 'xabikos/vscode-javascript'
Plug 'xabikos/vscode-react'

Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/1.x', 'for': ['javascript', 'scss', 'css', 'json', 'html', 'markdown', 'ruby'] }
Plug 'vim-airline/vim-airline'
Plug 'iCyMind/NeoSolarized'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'ciaranm/detectindent'
Plug 'sickill/vim-pasta'
Plug 'vim-ruby/vim-ruby'
Plug 'ngmy/vim-rubocop'

Plug 'junegunn/limelight.vim'

call plug#end()

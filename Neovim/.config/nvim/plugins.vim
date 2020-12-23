call plug#begin('~/.config/nvim/plugged')

" === NEOVIM 0.5.0 ===
" Lua things
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'

" Telescope
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-lua/telescope.nvim'
" === NEOVIM 0.5.0 ===

" Start screen
Plug 'mhinz/vim-startify'

if !exists('g:vscode')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
Plug 'stsewd/fzf-checkout.vim'

" vim and tmux integration
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

" File navigation
"Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-vinegar'

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
" Plug 'jparise/vim-graphql'
" Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

" Orgmode support
" Plug 'jceb/vim-orgmode'
Plug 'mattn/calendar-vim'
" Plug 'vim-scripts/utl.vim'
" Plug 'vim-scripts/taglist.vim'
" Plug 'majutsushi/tagbar'
Plug 'chrisbra/NrrwRgn'
" Plug 'vim-scripts/SyntaxRange'

" Note taking
Plug 'vimwiki/vimwiki'
Plug 'junegunn/limelight.vim'

Plug 'jpalardy/vim-slime'
endif

" Language
Plug 'sheerun/vim-polyglot'

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'haya14busa/vim-textobj-function-syntax'
" Plug 'pangloss/vim-javascript'
Plug 'glts/vim-textobj-comment'
Plug 'sgur/vim-textobj-parameter'
" Plug 'vimtaku/vim-textobj-keyvalue'
" Plug 'jceb/vim-textobj-uri'
" Plug 'mustache/vim-mustache-handlebars'
" Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'whatyouhide/vim-textobj-xmlattr'

Plug 'wellle/targets.vim'
if !exists('g:vscode')
Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'tpope/vim-jdaddy'
Plug 'honza/vim-snippets'
endif

if !exists('g:vscode')
" Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'scss', 'css', 'json', 'html', 'markdown', 'ruby'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
" Plug 'iCyMind/NeoSolarized'
Plug 'rakr/vim-one'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'sjl/vitality.vim'
" Plug 'MattesGroeger/vim-bookmarks'
Plug 'puremourning/vimspector', { 'do': './install_gadget.py' }
Plug 'szw/vim-maximizer'

" Turn off
" Plug 'dense-analysis/ale'
" Plug 'ludovicchabant/vim-gutentags'
endif

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'preservim/nerdcommenter'
Plug 'ciaranm/detectindent'
Plug 'sickill/vim-pasta'
Plug 'vim-ruby/vim-ruby'
Plug 'ruby-formatter/rufo-vim'
Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-eunuch'
Plug 'matze/vim-move'
Plug 'justinmk/vim-sneak'
Plug 'mg979/vim-visual-multi'
" Plug 'machakann/vim-highlightedyank'
Plug 'ap/vim-css-color'

" Turn off
" Plug 'psliwka/vim-smoothie'
" Plug 'kchmck/vim-coffee-script'

call plug#end()

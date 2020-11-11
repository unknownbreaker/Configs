call plug#begin('~/.config/nvim/plugged')

" Start screen
Plug 'mhinz/vim-startify'

if !exists('g:vscode')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" vim and tmux integration
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'camspiers/animate.vim'
" Plug 'camspiers/lens.vim'

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'jparise/vim-graphql'
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

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
Plug 'junegunn/limelight.vim'

Plug 'jpalardy/vim-slime'
endif

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'haya14busa/vim-textobj-function-syntax'
Plug 'pangloss/vim-javascript'
Plug 'glts/vim-textobj-comment'
Plug 'sgur/vim-textobj-parameter'
Plug 'vimtaku/vim-textobj-keyvalue'
Plug 'jceb/vim-textobj-uri'
Plug 'mustache/vim-mustache-handlebars'
Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'wellle/targets.vim'
Plug 'whatyouhide/vim-textobj-xmlattr'
if !exists('g:vscode')
Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'tpope/vim-jdaddy'
endif

if !exists('g:vscode')
" Plug 'dense-analysis/ale'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'scss', 'css', 'json', 'html', 'markdown', 'ruby'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'iCyMind/NeoSolarized'
Plug 'rakr/vim-one'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'sjl/vitality.vim'
Plug 'jesseleite/vim-agriculture'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'stsewd/fzf-checkout.vim'
Plug 'puremourning/vimspector', { 'do': './install_gadget.py' }
Plug 'szw/vim-maximizer'
endif

Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'ciaranm/detectindent'
Plug 'sickill/vim-pasta'
Plug 'vim-ruby/vim-ruby'
Plug 'ruby-formatter/rufo-vim'
Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-eunuch'
Plug 'matze/vim-move'
Plug 'psliwka/vim-smoothie'
Plug 'mg979/vim-visual-multi'

Plug 'kchmck/vim-coffee-script'
call plug#end()

" Change leader key
let mapleader = ","

" Other UI changes
set showmatch				" Show matching braces
set hlsearch				" Switch on highlighting for the last used search pattern
set showcmd				" Display incomplete commands
set ignorecase				" Ignore case on searches
set smartcase				" Use case sensitive search if there is capital letter in search
set undolevels=1000			" Set number of undos that are remembered
set number				" Show line numbers
set tabstop=2				" Use 2 space tabs
set shiftwidth=2			" Use 2 space tabs
set incsearch				" Incremental search: jump tot he first occurrence of search while user still searching
set mouse=a				" Enable mouse
set autoindent				" Use auto indentation
set scrolloff=3				" Start scrolling when 3 lines away from bottom
set laststatus=2			" Always display status line
set cursorline				" Highlight current line
set expandtab				" Use spaces instead of tabs
set omnifunc=syntaxcomplete#Complete	
set wildmenu
set wildmode=longest:full,full
au BufReadPost *.mustache set filetype=html syntax=mustache
syntax on
set nocompatible
filetype plugin on

colorscheme NeoSolarized
set termguicolors
set background=dark

" Code folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Faster scrolling of large files
set lazyredraw
set regexpengine=1

" Share system clipboard
set clipboard=unnamedplus

" Remapping keys

" Terminal mode
if has('nvim')
  " " Exit
  " :tnoremap <Esc> <C-\><C-n>
  " :tnoremap <A-[> <Esc>
  " :tnoremap <C-v><Esc> <Esc>

  " " Switch windows
  " " Terminal mode:
  " tnoremap <A-h> <c-\><c-n><c-w>h
  " tnoremap <A-j> <c-\><c-n><c-w>j
  " tnoremap <A-k> <c-\><c-n><c-w>k
  " tnoremap <A-l> <c-\><c-n><c-w>l
  " " Insert mode:
  " inoremap <A-h> <Esc><c-w>h
  " inoremap <A-j> <Esc><c-w>j
  " inoremap <A-k> <Esc><c-w>k
  " inoremap <A-l> <Esc><c-w>l
  " " Visual mode:
  " vnoremap <A-h> <Esc><c-w>h
  " vnoremap <A-j> <Esc><c-w>j
  " vnoremap <A-k> <Esc><c-w>k
  " vnoremap <A-l> <Esc><c-w>l
  " " Normal mode:
  " nnoremap <A-h> <c-w>h
  " nnoremap <A-j> <c-w>j
  " nnoremap <A-k> <c-w>k
  " nnoremap <A-l> <c-w>l
endif

" Split windows and move into new split
nnoremap sh :vsplit<CR>
nnoremap sl :vsplit<CR><C-W><c-l>
nnoremap sj :split<CR><C-W><c-j>
nnoremap sk :split<CR>

" Deal with soft wrapped lines and moving around
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" Keep * on same word, as opposed to jumping to the next
nnoremap * *``

" Replaces the word under cursor for whatever you want; after that, you can keep pressing . and it will keep substituting all the instances of the original word (ala multiple cursors). You can skip them with n (as you would in a normal search). The second mapping goes the other way around: substitutes upwards.
nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN
nnoremap d* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgn
nnoremap d# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgN

" Jump to first and last non whitespace character of current line
nnoremap H _
nnoremap L g_

" Fast macro call
nnoremap Q @q

" Quick save/exit
nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q<cr>

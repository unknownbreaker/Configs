"======NOTES======
".vimrc is NOT located in ~/ anymore.
"======NOTES======

execute pathogen#infect()
syntax enable

"Solarized color scheme settings
if !has("gui_running")
  let g:solarized_termtrans=1
  let g:solarized_termcolors=256
endif
colorscheme solarized
set background=dark

"Git commit message format
autocmd Filetype gitcommit setlocal spell textwidth=65

"Git gutter settings
let g:gitgutter_max_signs = 500  " default value

"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_javascript_checkers = ['jshint', 'eslint']

"NERDtree settings
"Opens a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Code folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
"set foldlevel=1

"JavaScript filetype settings
autocmd FileType javascript set textwidth=79
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS "Auto enable JS Autocomplete


"FORMATTING OPTIONS
"Indenting rules
:set softtabstop=2 "Convert tabs to spaces
:set shiftwidth=2
":set expandtab
:set autoindent
":set smartindent
:set nu                 "Enable line numbers
:set relativenumber

:set clipboard=unnamedplus "Set clipboard to + key.

"Set *.md to be markdown files instead of Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"Fire markdown preview
filetype plugin indent on

"Paste toggle shortcut"
set pastetoggle=<F2>

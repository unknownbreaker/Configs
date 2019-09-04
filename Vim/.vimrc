"======NOTES======
".vimrc is NOT located in ~/ anymore.
"======NOTES======

execute pathogen#infect()
set nocompatible    "Run in Vim, not Vi
syntax on
filetype on     "Enable filetype detection
filetype indent on  "Enable filetype-specific indenting
filetype plugin on  "Enable filetype-specific plugins

set rtp+=/usr/local/opt/fzf
"
" enable indentation
set breakindent
set linebreak

"Enable persistent undo
if has('persistent_undo')
  set undofile
  set undodir=$HOME/.vim/undo
endif
"Solarized color scheme settings
if !has("gui_running")
  let g:solarized_termtrans=1
  let g:solarized_termcolors=256
endif
colorscheme solarized
set background=dark

"Git commit message format
autocmd Filetype gitcommit setlocal spell textwidth=65

"yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

"Git gutter settings
let g:gitgutter_max_signs = 1000  " default value
let g:gitgutter_async = 0

"Tab completion
let g:SuperTabDefaultCompletionType = "<c-p>"

"enhance YCM JS completion with Tern
autocmd FileType javascript setlocal omnifunc=tern#Complete

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
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_ruby_checkers = ['rubylint']
let g:syntastic_html_checkers = ['jshint', 'eslint', 'jshint', 'stylelint']

"TernJS
"enable keyboard shortcuts
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints='on_hold'

"JSX
let g:jsx_ext_required = 1

"ack
let g:ackprg = 'ag --nogroup --nocolor --no-column'
"
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"Mustache handle bars
let g:mustache_abbreviations = 1

"NERDtree settings
"Opens a NERDTree automatically when vim starts up if no files were specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Code folding settings
":set foldmethod=indent   "fold based on indent
:set softtabstop=2 "Convert tabs to spaces
:set shiftwidth=2
:set tabstop=2
:set expandtab
:set autoindent
":set smartindent
":set nu                 "Enable line numbers
:set number relativenumber
:set backspace=2 " make backspace work like most other programs

":set clipboard=unnamedplus "Set clipboard to + key.
:set hlsearch "Highlights search matches.
:set incsearch "Displays match while typing it.

"Set *.md to be markdown files instead of Modula-2.
"autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"Paste toggle shortcut
set pastetoggle=<F2>

"Remapped keys
"Helps jump to first line of wrapped line.
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Set width of NERTree to 31 chars
let NERDTreeWinSize = 35

" Use ag instead of ack
let g:ackprg = 'ag --vimgrep'

" Range jsbeautify
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
autocmd FileType scss vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" Search strings and ignore regex forward slashes. 
command! -nargs=1 S let @/ = escape('<args>', '\')
nmap <Leader>S :execute(":S " . input('Regex-off: /'))<CR>

" Vimwiki settings
let g:vimwiki_hl_cb_checked = 2
let g:vimwiki_folding = 1
autocmd BufNewFile,BufReadPost *.wiki set filetype=vimwiki

" Ctags with CtrlP
nnoremap <leader>. :CtrlPTag<cr>

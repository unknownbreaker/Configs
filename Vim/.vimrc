"======NOTES======
".vimrc is NOT located in ~/ anymore.
"======NOTES======

execute pathogen#infect()
set nocompatible    "Run in Vim, not Vi
syntax on
filetype on	    "Enable filetype detection
filetype indent on  "Enable filetype-specific indenting
filetype plugin on  "Enable filetype-specific plugins

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

"Tab completion
let g:SuperTabDefaultCompletionType = "<c-p>"

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
":set foldmethod=indent   "fold based on indent
:set softtabstop=2 "Convert tabs to spaces
:set shiftwidth=2
:set tabstop=2
:set expandtab
:set autoindent
":set smartindent
":set nu                 "Enable line numbers
:set relativenumber

:set clipboard=unnamedplus "Set clipboard to + key.

"Set *.md to be markdown files instead of Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"Paste toggle shortcut
set pastetoggle=<F2>

"CtrlP settings with Silver Searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Matcher configs
if executable('matcher')
    let g:ctrlp_match_func = { 'match': 'GoodMatch' }

    function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)

      " Create a cache file if not yet exists
      let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
      if !( filereadable(cachefile) && a:items == readfile(cachefile) )
        call writefile(a:items, cachefile)
      endif
      if !filereadable(cachefile)
        return []
      endif

      " a:mmode is currently ignored. In the future, we should probably do
      " something about that. the matcher behaves like "full-line".
      let cmd = 'matcher --limit '.a:limit.' --manifest '.cachefile.' '
      if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
        let cmd = cmd.'--no-dotfiles '
      endif
      let cmd = cmd.a:str

      return split(system(cmd), "\n")

    endfunction
end
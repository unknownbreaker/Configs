" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" Disable if eslint file does not exist
autocmd FileType javascript let g:ale_linters = findfile('.eslintrc', '.;') != '' ? {'javascript': ['eslint']} : {'javascript': ['']}

nmap <silent> <C-p> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)

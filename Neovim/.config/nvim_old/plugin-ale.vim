" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" Disable if eslint file does not exist
autocmd FileType javascript let g:ale_linters = findfile('.eslintrc', '.;') != '' ? {'javascript': ['eslint']} : {'javascript': ['']}

nmap <silent> <C-p> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)

let g:ale_fixers = {
\   'typescript': ['prettier', 'eslint'],
\   'javascript': ['prettier', 'eslint'],
\   'css': ['prettier', 'eslint'],
\   'html': ['prettier', 'eslint']
\}

let g:ale_linters = {}
let g:ale_linters.typescript = ['eslint', 'tsserver']
let g:ale_linters.javascript = ['eslint', 'tsserver', 'flow-language-server']
let g:ale_linters.ruby = ['']

let g:ale_typescript_prettier_use_local_config = 1

let g:ale_fix_on_save = 1

let g:ale_linters_explicit = 1


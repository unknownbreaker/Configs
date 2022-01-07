" augroup mygroup
"   autocmd!
"   autocmd BufEnter *.* :DetectIndent<CR>
" augroup end

autocmd VimEnter * DetectIndent

" To prefer 'expandtab' to 'noexpandtab' when no detection is possible:
let g:detectindent_preferred_expandtab = 1

" To specify a preferred indent level when no detection is possible:
let g:detectindent_preferred_indent = 2


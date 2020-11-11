command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

vmap <A-p>  <Plug>(coc-format-selected)
nmap <A-p>  <Plug>(coc-format-selected)

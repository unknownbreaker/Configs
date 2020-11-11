Plug '~/.fzf'

let $FZF_DEFAULT_COMMAND='rg --files'

" Enable preview window
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" git grep wrapper
command! -bang -nargs=* GGrep
    \ call fzf#vim#grep(
    \   'git grep --line-number '.shellescape(<q-args>), 0,
    \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" Rg command with preview window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Rg command with preview window
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg -B 3 -A 2 --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"   \   fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Delete buffer from list of buffers
function! Bufs()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': Bufs(),
  \ 'sink*': { lines -> execute('bwipeout '.join(map(lines, {_, line -> split(line)[0]}))) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))


" Mappings
" Mapping selecting mappings
nmap <leader>f<tab> <plug>(fzf-maps-n)
xmap <leader>f<tab> <plug>(fzf-maps-x)
omap <leader>f<tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using Vim function
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Search word under cursor
" nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

" Search files
" nnoremap <silent> <Leader>f :Files<CR>

" Search buffers
" nnoremap <silent> <Leader>b :Buffers<CR>

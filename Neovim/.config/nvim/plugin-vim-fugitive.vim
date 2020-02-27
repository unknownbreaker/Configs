nmap <silent> <Leader>gs :Gstatus<CR>
nmap <silent> <Leader>gl :Glog<CR>
nnoremap <silent> <Leader>ga :Gwrite<CR>
nmap <silent> <Leader>gc :Gcommit<CR>

au! VimEnter COMMIT_EDITMSG exec :startinsert<CR>

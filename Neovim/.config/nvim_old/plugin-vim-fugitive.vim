nmap <silent> <Leader>gs :Gstatus<CR>
nmap <silent> <Leader>gl :Glog<CR>
nmap <silent> <Leader>ga :Gwrite<CR>
nmap <silent> <Leader>gc :Gcommit<CR>
nmap <Leader>gps  :execute ":Git push origin " . fugitive#head(0)<CR>
nmap <Leader>gmc :Gdiffsplit!<CR>


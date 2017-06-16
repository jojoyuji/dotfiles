autocmd BufEnter,BufNewFile,BufRead *.json noremap Q :JSONFormatter<cr> :execute 'normal gqaj'<cr>


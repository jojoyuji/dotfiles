autocmd BufEnter,BufNewFile,BufRead *.json noremap Q :call JsonFormatter()<cr> :execute 'normal gqaj'<cr>


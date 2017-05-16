autocmd BufNewFile,BufRead *.ejs setf html
autocmd BufEnter,BufNewFile,BufRead *.ejs noremap Q :call HtmlBeautify()<cr>

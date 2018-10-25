"autocmd FileType vue noremap <buffer> Q :%!vue-formatter<CR>
"autocmd BufEnter,BufNewFile,BufRead *.vue noremap <buffer> Q :%!vue-formatter<CR>
"autocmd BufEnter,BufNewFile,BufRead *.vue noremap Q :ALEFix<cr>
autocmd BufEnter,BufNewFile,BufRead *.vue set foldmethod=indent
autocmd FileType vue syntax sync fromstart


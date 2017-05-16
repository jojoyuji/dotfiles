"noremap Q :Esformatter<cr>
"vnoremap Q :EsformatterVisual<cr>
"au FileWritePre, BufWritePre *.js :Esformatter  % <cr>
"

autocmd BufEnter,BufNewFile,BufRead *.js noremap Q :Esformatter<cr>
autocmd BufEnter,BufNewFile,BufRead *.js vnoremap Q :EsformatterVisual<cr>


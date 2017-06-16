"au BufNewFile,BufRead *.js setf javascript
"au BufNewFile,BufRead *.jsm setf javascript
"au BufNewFile,BufRead *.jsx setf javascript
"au BufNewFile,BufRead Jakefile setf javascript
 "Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=99
autocmd BufEnter,BufNewFile,BufRead *.jsx noremap Q :Neoformat<cr>
"autocmd BufEnter,BufNewFile,BufRead *.jsx vnoremap Q :EsformatterVisual<cr>

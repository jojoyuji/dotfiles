au BufNewFile,BufRead *.conf setf nginx
au BufNewFile,BufRead *.conf setf nginx
 "Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=99

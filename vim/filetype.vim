"au BufNewFile,BufRead *.less set filetype=css
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,nginx.conf if &ft == '' | setfiletype nginx | endif

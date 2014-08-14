let g:airline#themes#gruvbox#palette = {}

let s:N1 = [ '#282828', '#b8bb26', 235, 142  ]
let s:N2 = [ '#bdae93', '#665c54', 248, 241  ]
let s:N3 = [ '#a89984', '#3c3836', 243, 237  ]
let g:airline#themes#gruvbox#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let g:airline#themes#gruvbox#palette.normal_modified = {
      \ 'airline_c': [ '#fb4934', '#3c3836', 167, 237  ],
      \ 
}


let s:I1 = [ '#282828', '#fb4934', 235, 167  ]
let s:I2 = s:N2
let s:I3 = s:N3
let g:airline#themes#gruvbox#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#gruvbox#palette.insert_modified = {
      \ 'airline_c': [ '#fb4934', '#3c3836', 167, 237, ''  ],
      \ 
}


let g:airline#themes#gruvbox#palette.replace = copy(g:airline#themes#gruvbox#palette.insert)
let g:airline#themes#gruvbox#palette.replace.airline_a = s:I1
let g:airline#themes#gruvbox#palette.replace_modified = g:airline#themes#gruvbox#palette.insert_modified


let s:V1 = [ '#282828', '#fe8019', 235, 208  ]
let s:V2 = s:N2
let s:V3 = s:N3
let g:airline#themes#gruvbox#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#gruvbox#palette.visual_modified = {
      \ 'airline_c': [ '#fb4934', '#3c3836', 167, 237, ''  ],
      \ 
}


let s:IA1 = s:N3
let s:IA2 = s:N3
let s:IA3 = s:N3
let g:airline#themes#gruvbox#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#gruvbox#palette.inactive_modified = {
      \ 'airline_c': [ '#fb4934', '#3c3836', 167, 237, ''  ],
      \ 
}


let g:airline#themes#gruvbox#palette.accents = {
      \ 'red': [ '#fb4934', '', 167, ''  ]
      \ 
}

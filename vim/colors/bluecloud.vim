" Vim color file
"
" Author: Edwin Pujols <edwinpm5@gmail.com>
"
"

hi clear

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="bluecloud"
set background=dark

hi ColorColumn     guifg=#ff0000 guibg=#002050
" Comment ^^
hi LineNr          guifg=#2a62b2 guibg=#0c1c33
hi NonText         guifg=#16345e guibg=#0c1c33
hi Normal          guifg=#bfcfcf guibg=#16345e
hi Comment         guifg=#3274d4
hi Boolean         guifg=#87f0ff
hi Character       guifg=#73c216
hi Number          guifg=#a7dd40
hi String          guifg=#87cd40
hi Conditional     guifg=#60e0ef               gui=bold
hi Constant        guifg=#8f8fa5               gui=bold
hi Cursor          guifg=#16345e guibg=#e0e0e0
hi CursorLine                    guibg=#112747
hi CursorColumn                  guibg=#112747
hi CursorLineNr    guifg=#aad262 guibg=#0c1c33 gui=none
hi Debug           guifg=#bca3a3               gui=bold
hi Define          guifg=#e4cc47
hi Delimiter       guifg=#8f8f8f
hi DiffAdd                       guibg=#103030
hi DiffChange      guifg=#080800 guibg=#404030
hi DiffDelete      guifg=#302020 guibg=#000000
hi DiffText                      guibg=#420000 gui=none

hi Directory       guifg=#a09fdf               gui=bold
hi Error           guifg=#960050 guibg=#1e0010
hi ErrorMsg        guifg=#ff0050 guibg=#1e0010 gui=bold
hi Exception       guifg=#ffaf20               gui=bold
hi Float           guifg=#87dd40
hi FoldColumn      guifg=#465457 guibg=#000000
hi Folded          guifg=#2a62b2 guibg=#102544
hi Function        guifg=#ec8763
hi Identifier      guifg=#dcb070
hi Ignore          guifg=#808080 guibg=#16345e
hi IncSearch       guifg=#000000 guibg=#ffff00 gui=none

hi Keyword         guifg=#80b8bc               gui=bold
hi Label           guifg=#df7aff               gui=none
hi Macro           guifg=#c4be89               gui=none
hi SpecialKey      guifg=#e4cc47               gui=none

hi MatchParen      guifg=#000000 guibg=#fd971f gui=bold
hi ModeMsg         guifg=#4a9cff
hi MoreMsg         guifg=#e4cc47
hi Operator        guifg=#a0a0f0

" complete menu
hi Pmenu           guifg=#e4cc47 guibg=#000000
hi PmenuSel        guifg=#e4cc47 guibg=#000000 gui=reverse
hi PmenuSbar                     guibg=#080808
hi PmenuThumb      guifg=#e4cc47

hi PreCondit       guifg=#ec6753               gui=none
hi PreProc         guifg=#f0a0a0
hi Question        guifg=#e4cc47               gui=bold
hi Repeat          guifg=#60e0ef               gui=bold
hi Search          guifg=#000000 guibg=#ff00ff

" marks column
hi SignColumn      guifg=#ec6753 guibg=#232526
hi SpecialChar     guifg=#df90b8               gui=none
hi SpecialComment  guifg=#0088db               gui=bold
hi Special         guifg=#cfb032               gui=none
hi SpecialKey      guifg=#c8aa85               gui=none
if has("spell")
    hi SpellBad    guisp=#ff3030               gui=undercurl
    hi SpellCap    guisp=#f0c000               gui=undercurl
    hi SpellLocal  guisp=#50df50               gui=undercurl
    hi SpellRare   guisp=#a540ff               gui=undercurl
endif
hi Statement       guifg=#609fd3               gui=bold
hi StatusLine      guifg=#2a62b2 guibg=#000000 gui=bold
hi StatusLineNC    guifg=#141414 guibg=#103c67
hi StorageClass    guifg=#ffa71f               gui=none
hi Structure       guifg=#e4cc47
hi Tag             guifg=#00faff               gui=none
hi TabLineSel      guifg=#2a62b2 guibg=#000000 gui=bold
hi TabLineFill     guifg=#0c1c33 guibg=#ff0000
hi TabLine         guifg=#544a80 guibg=#0c1c33 gui=none
hi Title           guifg=#bf909a guibg=#112747 gui=bold
hi Todo            guifg=#e4cc47 guibg=#000000 gui=bold

hi Typedef         guifg=#e4cc47
hi Type            guifg=#e4cc47               gui=none
hi Underlined      guifg=#b3b4b4               gui=underline

hi VertSplit       guifg=#10304c guibg=#0a0a0a gui=bold
hi VisualNOS                     guibg=#403d3d
hi Visual          guifg=#70a0ff guibg=#000f30 gui=none
hi WarningMsg      guifg=#000000 guibg=#ffaf00 gui=bold
hi WildMenu        guifg=#e4cc47 guibg=#000000

hi helpCommand        guifg=#ffffff
hi helpExample        guifg=#70a0ff
hi helpNote           guifg=#f0f050 guibg=#000000 gui=bold
hi NERDTreeLink       guifg=#a2d23c
hi NERDTreeExecFile   guifg=#ec7753
hi NERDTreeOpenable   guifg=#ec7753
hi NERDTreeRO         guifg=#a0ac00 guibg=#202122 gui=none
hi NERDTreeToggleOff  guifg=#3274d4 guibg=#000000 gui=none
hi NERDTreeToggleOn   guifg=#e4cc47 guibg=#000000 gui=bold
hi pythonBuiltin      guifg=#cfa555
hi pythonSpaceError   guifg=#ffff00 guibg=#ff0000
hi texStatement       guifg=#afc25f               gui=none

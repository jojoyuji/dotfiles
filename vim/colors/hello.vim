" Vim color file
" Converted from Textmate theme Baby, The Code Shines Bright using Coloration v0.3.3 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "hello"

hi Cursor ctermfg=0 ctermbg=15 cterm=NONE guifg=#000000 guibg=#ffffff gui=NONE
hi Visual ctermfg=NONE ctermbg=53 cterm=NONE guifg=NONE guibg=#442b62 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#191919 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#191919 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#191919 gui=NONE
hi LineNr ctermfg=243 ctermbg=234 cterm=NONE guifg=#7b7b7b guibg=#191919 gui=NONE
hi VertSplit ctermfg=238 ctermbg=238 cterm=NONE guifg=#474747 guibg=#474747 gui=NONE
hi MatchParen ctermfg=97 ctermbg=NONE cterm=underline guifg=#94579e guibg=NONE gui=underline
hi StatusLine ctermfg=231 ctermbg=238 cterm=bold guifg=#f6f6f6 guibg=#474747 gui=bold
hi StatusLineNC ctermfg=231 ctermbg=238 cterm=NONE guifg=#f6f6f6 guibg=#474747 gui=NONE
hi Pmenu ctermfg=182 ctermbg=NONE cterm=NONE guifg=#d99ed1 guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=53 cterm=NONE guifg=NONE guibg=#442b62 gui=NONE
hi IncSearch ctermfg=0 ctermbg=79 cterm=NONE guifg=#000000 guibg=#61c8c3 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bff294 guibg=NONE gui=NONE
hi Folded ctermfg=59 ctermbg=0 cterm=NONE guifg=#4d605f guibg=#000000 gui=NONE

hi Normal ctermfg=231 ctermbg=0 cterm=NONE guifg=#f6f6f6 guibg=#000000 gui=NONE
hi Boolean ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bff294 guibg=NONE gui=NONE
hi Character ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bff294 guibg=NONE gui=NONE
hi Comment ctermfg=59 ctermbg=NONE cterm=NONE guifg=#4d605f guibg=NONE gui=NONE
hi Conditional ctermfg=97 ctermbg=NONE cterm=NONE guifg=#94579e guibg=NONE gui=NONE
hi Constant ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bff294 guibg=NONE gui=NONE
hi Define ctermfg=97 ctermbg=NONE cterm=NONE guifg=#94579e guibg=NONE gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f6f6f6 guibg=#3e7b05 gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#830000 guibg=NONE gui=NONE
hi DiffChange ctermfg=231 ctermbg=17 cterm=NONE guifg=#f6f6f6 guibg=#102544 gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f6f6f6 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Float ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bff294 guibg=NONE gui=NONE
hi Function ctermfg=182 ctermbg=NONE cterm=NONE guifg=#d99ed1 guibg=NONE gui=NONE
hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Keyword ctermfg=97 ctermbg=NONE cterm=NONE guifg=#94579e guibg=NONE gui=NONE
hi Label ctermfg=79 ctermbg=NONE cterm=NONE guifg=#61c8c3 guibg=NONE gui=NONE
hi NonText ctermfg=237 ctermbg=232 cterm=NONE guifg=#404040 guibg=#0c0c0c gui=NONE
hi Number ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bff294 guibg=NONE gui=NONE
hi Operator ctermfg=97 ctermbg=NONE cterm=NONE guifg=#94579e guibg=NONE gui=NONE
hi PreProc ctermfg=97 ctermbg=NONE cterm=NONE guifg=#94579e guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f6f6f6 guibg=NONE gui=NONE
hi SpecialKey ctermfg=237 ctermbg=234 cterm=NONE guifg=#404040 guibg=#191919 gui=NONE
hi Statement ctermfg=97 ctermbg=NONE cterm=NONE guifg=#94579e guibg=NONE gui=NONE
hi StorageClass ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi String ctermfg=79 ctermbg=NONE cterm=NONE guifg=#61c8c3 guibg=NONE gui=NONE
hi Tag ctermfg=182 ctermbg=NONE cterm=NONE guifg=#d99ed1 guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f6f6f6 guibg=NONE gui=bold
hi Todo ctermfg=59 ctermbg=NONE cterm=inverse,bold guifg=#4d605f guibg=NONE gui=inverse,bold
hi Type ctermfg=182 ctermbg=NONE cterm=NONE guifg=#d99ed1 guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=97 ctermbg=NONE cterm=NONE guifg=#94579e guibg=NONE gui=NONE
hi rubyFunction ctermfg=182 ctermbg=NONE cterm=NONE guifg=#d99ed1 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bff294 guibg=NONE gui=NONE
hi rubyConstant ctermfg=68 ctermbg=NONE cterm=NONE guifg=#4b7fd4 guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=79 ctermbg=NONE cterm=NONE guifg=#61c8c3 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=205 ctermbg=NONE cterm=NONE guifg=#f465b6 guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=205 ctermbg=NONE cterm=NONE guifg=#f465b6 guibg=NONE gui=NONE
hi rubyInclude ctermfg=97 ctermbg=NONE cterm=NONE guifg=#94579e guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=205 ctermbg=NONE cterm=NONE guifg=#f465b6 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=228 ctermbg=NONE cterm=NONE guifg=#f9ee99 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=228 ctermbg=NONE cterm=NONE guifg=#f9ee99 guibg=NONE gui=NONE
hi rubyEscape ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bff294 guibg=NONE gui=NONE
hi rubyControl ctermfg=97 ctermbg=NONE cterm=NONE guifg=#94579e guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=205 ctermbg=NONE cterm=NONE guifg=#f465b6 guibg=NONE gui=NONE
hi rubyOperator ctermfg=97 ctermbg=NONE cterm=NONE guifg=#94579e guibg=NONE gui=NONE
hi rubyException ctermfg=97 ctermbg=NONE cterm=NONE guifg=#94579e guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=205 ctermbg=NONE cterm=NONE guifg=#f465b6 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=68 ctermbg=NONE cterm=NONE guifg=#4b7fd4 guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=175 ctermbg=NONE cterm=NONE guifg=#de99bf guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=175 ctermbg=NONE cterm=NONE guifg=#de99bf guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=175 ctermbg=NONE cterm=NONE guifg=#de99bf guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=175 ctermbg=NONE cterm=NONE guifg=#de99bf guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=59 ctermbg=NONE cterm=NONE guifg=#4d605f guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=175 ctermbg=NONE cterm=NONE guifg=#de99bf guibg=NONE gui=NONE
hi htmlTag ctermfg=182 ctermbg=NONE cterm=NONE guifg=#d99ed1 guibg=NONE gui=NONE
hi htmlEndTag ctermfg=182 ctermbg=NONE cterm=NONE guifg=#d99ed1 guibg=NONE gui=NONE
hi htmlTagName ctermfg=182 ctermbg=NONE cterm=NONE guifg=#d99ed1 guibg=NONE gui=NONE
hi htmlArg ctermfg=182 ctermbg=NONE cterm=NONE guifg=#d99ed1 guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bff294 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=175 ctermbg=NONE cterm=NONE guifg=#de99bf guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=182 ctermbg=NONE cterm=NONE guifg=#d99ed1 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=205 ctermbg=NONE cterm=NONE guifg=#f465b6 guibg=NONE gui=NONE
hi yamlAlias ctermfg=205 ctermbg=NONE cterm=NONE guifg=#f465b6 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=79 ctermbg=NONE cterm=NONE guifg=#61c8c3 guibg=NONE gui=NONE
hi cssURL ctermfg=205 ctermbg=NONE cterm=NONE guifg=#f465b6 guibg=NONE gui=NONE
hi cssFunctionName ctermfg=175 ctermbg=NONE cterm=NONE guifg=#de99bf guibg=NONE gui=NONE
hi cssColor ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bff294 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=182 ctermbg=NONE cterm=NONE guifg=#d99ed1 guibg=NONE gui=NONE
hi cssClassName ctermfg=182 ctermbg=NONE cterm=NONE guifg=#d99ed1 guibg=NONE gui=NONE
hi cssValueLength ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bff294 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=156 ctermbg=NONE cterm=NONE guifg=#b3f382 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

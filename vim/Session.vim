let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <Plug>(neocomplete_start_auto_complete) =neocomplete#mappings#popup_post()
inoremap <silent> <Plug>(neocomplete_start_omni_complete) 
inoremap <silent> <expr> <Plug>(neocomplete_start_unite_quick_match) unite#sources#neocomplete#start_quick_match()
inoremap <silent> <expr> <Plug>(neocomplete_start_unite_complete) unite#sources#neocomplete#start_complete()
inoremap <expr> <D-M> (pumvisible() ? (col('.') > 1 ? 'i<Right>' : 'i') : '') . '=pumvisible() ? "\<C-n>\<C-p>\<Down>" : ""'
inoremap <expr> <D-m> (pumvisible() ? (col('.') > 1 ? 'i<Right>' : 'i') : '') . '=pumvisible() ? "\<C-n>\<C-p>\<Down>" : ""'
imap <D-k> 
imap <D-j> 
imap <D-l> <Down>
inoremap <D-BS> 
inoremap <M-BS> 
inoremap <M-Down> }
inoremap <D-Down> <C-End>
inoremap <M-Up> {
inoremap <D-Up> <C-Home>
noremap! <M-Right> <C-Right>
noremap! <D-Right> <End>
noremap! <M-Left> <C-Left>
noremap! <D-Left> <Home>
inoremap <silent> <Plug>NERDCommenterInsert  <BS>:call NERDComment('i', "insert")
inoremap <silent> <expr> <Plug>(neosnippet_start_unite_snippet) unite#sources#neosnippet#start_complete()
inoremap <silent> <expr> <Plug>(neosnippet_jump) neosnippet#mappings#jump_impl()
inoremap <silent> <expr> <Plug>(neosnippet_expand) neosnippet#mappings#expand_impl()
inoremap <silent> <expr> <Plug>(neosnippet_jump_or_expand) neosnippet#mappings#jump_or_expand_impl()
inoremap <silent> <expr> <Plug>(neosnippet_expand_or_jump) neosnippet#mappings#expand_or_jump_impl()
inoremap <silent> <C-Tab> =UltiSnips#ListSnippets()
inoremap <silent> <SNR>91_AutoPairsReturn =AutoPairsReturn()
inoremap <D-f> 
inoremap <D-J> vipJi
inoremap <expr> <F9> neocomplete#cancel_popup()
inoremap <expr> <BS> neocomplete#smart_close_popup()."\"
inoremap <F10> :Nyancat2
snoremap  a<BS>
nnoremap  :SidewaysLeft
xnoremap  :SidewaysLeft
onoremap  :SidewaysLeft
nmap 	 >>
xmap 	 >gv
omap 	 >gv
nnoremap  :SidewaysRight
xnoremap  :SidewaysRight
onoremap  :SidewaysRight
snoremap  a<BS>
nmap  <Plug>(wildfire-fuel)
xmap  <Plug>(wildfire-fuel)
omap  <Plug>(wildfire-fuel)
xnoremap <silent>  :call multiple_cursors#new("v")
nnoremap <silent>  :call multiple_cursors#new("n")
nmap  <Plug>yankstack_substitute_newer_paste
nmap  <Plug>yankstack_substitute_older_paste
nnoremap <silent>  :call repeat#wrap("\<C-R>",v:count)
nmap <silent>  gE <Plug>(easymotion-gE)
xmap <silent>  gE <Plug>(easymotion-gE)
omap <silent>  gE <Plug>(easymotion-gE)
nmap <silent>  ge <Plug>(easymotion-ge)
xmap <silent>  ge <Plug>(easymotion-ge)
omap <silent>  ge <Plug>(easymotion-ge)
nmap <silent>  E <Plug>(easymotion-E)
xmap <silent>  E <Plug>(easymotion-E)
omap <silent>  E <Plug>(easymotion-E)
nmap <silent>  e <Plug>(easymotion-e)
xmap <silent>  e <Plug>(easymotion-e)
omap <silent>  e <Plug>(easymotion-e)
nmap <silent>  B <Plug>(easymotion-B)
xmap <silent>  B <Plug>(easymotion-B)
omap <silent>  B <Plug>(easymotion-B)
nmap <silent>  b <Plug>(easymotion-b)
xmap <silent>  b <Plug>(easymotion-b)
omap <silent>  b <Plug>(easymotion-b)
nmap <silent>  W <Plug>(easymotion-W)
xmap <silent>  W <Plug>(easymotion-W)
omap <silent>  W <Plug>(easymotion-W)
nmap <silent>  w <Plug>(easymotion-w)
xmap <silent>  w <Plug>(easymotion-w)
omap <silent>  w <Plug>(easymotion-w)
nmap <silent>  T <Plug>(easymotion-T)
xmap <silent>  T <Plug>(easymotion-T)
omap <silent>  T <Plug>(easymotion-T)
nmap <silent>  t <Plug>(easymotion-t)
xmap <silent>  t <Plug>(easymotion-t)
omap <silent>  t <Plug>(easymotion-t)
nmap <silent>  F <Plug>(easymotion-F)
xmap <silent>  F <Plug>(easymotion-F)
omap <silent>  F <Plug>(easymotion-F)
nmap <silent>  f <Plug>(easymotion-f)
xmap <silent>  f <Plug>(easymotion-f)
omap <silent>  f <Plug>(easymotion-f)
nnoremap  j :SplitjoinSplit 
xnoremap  j :SplitjoinSplit 
onoremap  j :SplitjoinSplit 
nnoremap  k :SplitjoinJoin 
xnoremap  k :SplitjoinJoin 
onoremap  k :SplitjoinJoin 
xnoremap <silent> # :call VisualSelection('b')
xnoremap <silent> * :let old_reg=getreg('"')|let old_regtype=getregtype('"')gvy/=substitute(escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')gV:call setreg('"', old_reg, old_regtype)
xmap ,t :Align
nnoremap ,t :Align
onoremap ,t :Align
nmap ,ca <Plug>NERDCommenterAltDelims
xmap ,cu <Plug>NERDCommenterUncomment
nmap ,cu <Plug>NERDCommenterUncomment
xmap ,cb <Plug>NERDCommenterAlignBoth
nmap ,cb <Plug>NERDCommenterAlignBoth
nnoremap ,cl :ColorToggle
xnoremap ,cl :ColorToggle
onoremap ,cl :ColorToggle
nmap ,cA <Plug>NERDCommenterAppend
xmap ,cy <Plug>NERDCommenterYank
nmap ,cy <Plug>NERDCommenterYank
xmap ,cs <Plug>NERDCommenterSexy
nmap ,cs <Plug>NERDCommenterSexy
xmap ,ci <Plug>NERDCommenterInvert
nmap ,ci <Plug>NERDCommenterInvert
nmap ,c$ <Plug>NERDCommenterToEOL
xmap ,cn <Plug>NERDCommenterNested
nmap ,cn <Plug>NERDCommenterNested
xmap ,cm <Plug>NERDCommenterMinimal
nmap ,cm <Plug>NERDCommenterMinimal
xmap ,c  <Plug>NERDCommenterToggle
nmap ,c  <Plug>NERDCommenterToggle
xmap ,cc <Plug>NERDCommenterComment
nmap ,cc <Plug>NERDCommenterComment
nmap ,rwp <Plug>RestoreWinPosn
xmap ,rwp <Plug>RestoreWinPosn
omap ,rwp <Plug>RestoreWinPosn
nmap ,swp <Plug>SaveWinPosn
xmap ,swp <Plug>SaveWinPosn
omap ,swp <Plug>SaveWinPosn
nmap ,tsq <Plug>AM_tsq
xmap ,tsq <Plug>AM_tsq
omap ,tsq <Plug>AM_tsq
nmap ,tsp <Plug>AM_tsp
xmap ,tsp <Plug>AM_tsp
omap ,tsp <Plug>AM_tsp
nmap ,tml <Plug>AM_tml
xmap ,tml <Plug>AM_tml
omap ,tml <Plug>AM_tml
nmap ,tab <Plug>AM_tab
xmap ,tab <Plug>AM_tab
omap ,tab <Plug>AM_tab
nmap ,m= <Plug>AM_m=
xmap ,m= <Plug>AM_m=
omap ,m= <Plug>AM_m=
nmap ,tW@ <Plug>AM_tW@
xmap ,tW@ <Plug>AM_tW@
omap ,tW@ <Plug>AM_tW@
nmap ,t@ <Plug>AM_t@
xmap ,t@ <Plug>AM_t@
omap ,t@ <Plug>AM_t@
nmap ,t~ <Plug>AM_t~
xmap ,t~ <Plug>AM_t~
omap ,t~ <Plug>AM_t~
nmap ,t? <Plug>AM_t?
xmap ,t? <Plug>AM_t?
omap ,t? <Plug>AM_t?
nmap ,w= <Plug>AM_w=
xmap ,w= <Plug>AM_w=
omap ,w= <Plug>AM_w=
nmap ,ts= <Plug>AM_ts=
xmap ,ts= <Plug>AM_ts=
omap ,ts= <Plug>AM_ts=
nmap ,ts< <Plug>AM_ts<
xmap ,ts< <Plug>AM_ts<
omap ,ts< <Plug>AM_ts<
nmap ,ts; <Plug>AM_ts;
xmap ,ts; <Plug>AM_ts;
omap ,ts; <Plug>AM_ts;
nmap ,ts: <Plug>AM_ts:
xmap ,ts: <Plug>AM_ts:
omap ,ts: <Plug>AM_ts:
nmap ,ts, <Plug>AM_ts,
xmap ,ts, <Plug>AM_ts,
omap ,ts, <Plug>AM_ts,
nmap ,t= <Plug>AM_t=
xmap ,t= <Plug>AM_t=
omap ,t= <Plug>AM_t=
nmap ,t< <Plug>AM_t<
xmap ,t< <Plug>AM_t<
omap ,t< <Plug>AM_t<
nmap ,t; <Plug>AM_t;
xmap ,t; <Plug>AM_t;
omap ,t; <Plug>AM_t;
nmap ,t: <Plug>AM_t:
xmap ,t: <Plug>AM_t:
omap ,t: <Plug>AM_t:
nmap ,t, <Plug>AM_t,
xmap ,t, <Plug>AM_t,
omap ,t, <Plug>AM_t,
nmap ,t# <Plug>AM_t#
xmap ,t# <Plug>AM_t#
omap ,t# <Plug>AM_t#
nmap ,t| <Plug>AM_t|
xmap ,t| <Plug>AM_t|
omap ,t| <Plug>AM_t|
nmap ,T~ <Plug>AM_T~
xmap ,T~ <Plug>AM_T~
omap ,T~ <Plug>AM_T~
nmap ,Tsp <Plug>AM_Tsp
xmap ,Tsp <Plug>AM_Tsp
omap ,Tsp <Plug>AM_Tsp
nmap ,Tab <Plug>AM_Tab
xmap ,Tab <Plug>AM_Tab
omap ,Tab <Plug>AM_Tab
nmap ,TW@ <Plug>AM_TW@
xmap ,TW@ <Plug>AM_TW@
omap ,TW@ <Plug>AM_TW@
nmap ,T@ <Plug>AM_T@
xmap ,T@ <Plug>AM_T@
omap ,T@ <Plug>AM_T@
nmap ,T? <Plug>AM_T?
xmap ,T? <Plug>AM_T?
omap ,T? <Plug>AM_T?
nmap ,T= <Plug>AM_T=
xmap ,T= <Plug>AM_T=
omap ,T= <Plug>AM_T=
nmap ,T< <Plug>AM_T<
xmap ,T< <Plug>AM_T<
omap ,T< <Plug>AM_T<
nmap ,T; <Plug>AM_T;
xmap ,T; <Plug>AM_T;
omap ,T; <Plug>AM_T;
nmap ,T: <Plug>AM_T:
xmap ,T: <Plug>AM_T:
omap ,T: <Plug>AM_T:
nmap ,Ts, <Plug>AM_Ts,
xmap ,Ts, <Plug>AM_Ts,
omap ,Ts, <Plug>AM_Ts,
nmap ,T, <Plug>AM_T,o
xmap ,T, <Plug>AM_T,o
omap ,T, <Plug>AM_T,o
nmap ,T# <Plug>AM_T#
xmap ,T# <Plug>AM_T#
omap ,T# <Plug>AM_T#
nmap ,T| <Plug>AM_T|
xmap ,T| <Plug>AM_T|
omap ,T| <Plug>AM_T|
nmap ,Htd <Plug>AM_Htd
xmap ,Htd <Plug>AM_Htd
omap ,Htd <Plug>AM_Htd
nmap ,anum <Plug>AM_aunum
xmap ,anum <Plug>AM_aunum
omap ,anum <Plug>AM_aunum
nmap ,aenum <Plug>AM_aenum
xmap ,aenum <Plug>AM_aenum
omap ,aenum <Plug>AM_aenum
nmap ,aunum <Plug>AM_aunum
xmap ,aunum <Plug>AM_aunum
omap ,aunum <Plug>AM_aunum
nmap ,afnc <Plug>AM_afnc
xmap ,afnc <Plug>AM_afnc
omap ,afnc <Plug>AM_afnc
nmap ,adef <Plug>AM_adef
xmap ,adef <Plug>AM_adef
omap ,adef <Plug>AM_adef
nmap ,adec <Plug>AM_adec
xmap ,adec <Plug>AM_adec
omap ,adec <Plug>AM_adec
nmap ,ascom <Plug>AM_ascom
xmap ,ascom <Plug>AM_ascom
omap ,ascom <Plug>AM_ascom
nmap ,aocom <Plug>AM_aocom
xmap ,aocom <Plug>AM_aocom
omap ,aocom <Plug>AM_aocom
nmap ,adcom <Plug>AM_adcom
xmap ,adcom <Plug>AM_adcom
omap ,adcom <Plug>AM_adcom
nmap ,acom <Plug>AM_acom
xmap ,acom <Plug>AM_acom
omap ,acom <Plug>AM_acom
nmap ,abox <Plug>AM_abox
xmap ,abox <Plug>AM_abox
omap ,abox <Plug>AM_abox
nmap ,a( <Plug>AM_a(
xmap ,a( <Plug>AM_a(
omap ,a( <Plug>AM_a(
nmap ,a= <Plug>AM_a=
xmap ,a= <Plug>AM_a=
omap ,a= <Plug>AM_a=
nmap ,a< <Plug>AM_a<
xmap ,a< <Plug>AM_a<
omap ,a< <Plug>AM_a<
nmap ,a, <Plug>AM_a,
xmap ,a, <Plug>AM_a,
omap ,a, <Plug>AM_a,
nmap ,a? <Plug>AM_a?
xmap ,a? <Plug>AM_a?
omap ,a? <Plug>AM_a?
nmap ,gt <Plug>(signify-toggle)
nmap ,gh <Plug>(signify-toggle-highlight)
nmap ,gk <Plug>(signify-prev-hunk)
nmap ,gj <Plug>(signify-next-hunk)
nmap <silent> ,lg :LustyBufferGrep
nmap <silent> ,lb :LustyBufferExplorer
nmap <silent> ,lr :LustyFilesystemExplorerFromHere
nmap <silent> ,lf :LustyFilesystemExplorer
nmap ,, <Plug>(easymotion-prefix)
xmap ,, <Plug>(easymotion-prefix)
omap ,, <Plug>(easymotion-prefix)
nnoremap <silent> ,/ :execute 'vimgrep /'.@/.'/g %':copen
nmap ,cd :cd %:p:h
xmap ,cd :cd %:p:h
omap ,cd :cd %:p:h
nmap ,	 :wincmd w
nmap ,og :!open -a "google chrome"  %
nmap ,of :!open -a firefox.app % 
nmap ,,7 :set guifont=courier:h13
xmap ,,7 :set guifont=courier:h13
omap ,,7 :set guifont=courier:h13
nmap ,,6 :set guifont=menlo:h13
xmap ,,6 :set guifont=menlo:h13
omap ,,6 :set guifont=menlo:h13
nmap ,,5 :set guifont=andale\ mono:h12
xmap ,,5 :set guifont=andale\ mono:h12
omap ,,5 :set guifont=andale\ mono:h12
nmap ,,4 :set guifont=proggyclean:h11
xmap ,,4 :set guifont=proggyclean:h11
omap ,,4 :set guifont=proggyclean:h11
nmap ,,3 :set guifont=bitstream\ vera\ sans\ mono:h12
xmap ,,3 :set guifont=bitstream\ vera\ sans\ mono:h12
omap ,,3 :set guifont=bitstream\ vera\ sans\ mono:h12
nmap ,,2 :set guifont=monaco:h13
xmap ,,2 :set guifont=monaco:h13
omap ,,2 :set guifont=monaco:h13
nmap ,,1 :set guifont=inconsolata:h15
xmap ,,1 :set guifont=inconsolata:h15
omap ,,1 :set guifont=inconsolata:h15
nmap ,,` :set guifont=*
xmap ,,` :set guifont=*
omap ,,` :set guifont=*
nmap ,q :call KillBuffer(0)
xmap ,q :call KillBuffer(0)
omap ,q :call KillBuffer(0)
nnoremap ,sf :set filetype=
xnoremap ,sf :set filetype=
onoremap ,sf :set filetype=
nmap <silent> ,  :silent noh
nmap ,,ss :%s//<Left>
xmap ,,ss :%s//<Left>
omap ,,ss :%s//<Left>
nnoremap ,z zmzvzz
nnoremap ,W :%s/\s\+$//:let @/=''
nnoremap ,vc :call LoadingMsg('Cleaning Vundle plugins...'):so $MYVIMRC:BundleClean
nnoremap ,vu :call LoadingMsg("Updating Vundle plugins..."):so $MYVIMRC:BundleUpdate
nnoremap ,vi :call LoadingMsg('Installing Vundle plugins...'):so $MYVIMRC:BundleInstall
nnoremap ,\\ :SignifyToggle
xnoremap ,\\ :SignifyToggle
onoremap ,\\ :SignifyToggle
nmap ,neo :NeoCompleteToggle
xmap ,neo :NeoCompleteToggle
omap ,neo :NeoCompleteToggle
nnoremap ,b :LustyBufferExplorer
xnoremap ,b :LustyBufferExplorer
onoremap ,b :LustyBufferExplorer
nnoremap ,gu :!git pull
nnoremap ,gp :!git push
nnoremap ,gw :Gwrite
nnoremap ,gr :Gread
nnoremap ,gb :Gblame
nnoremap ,gd :Gdiff
nnoremap ,gc :Gcommit
nnoremap ,gs :Gstatus
nmap <silent> ,,	 :call rc:syncTree() 
xmap <silent> ,,	 :call rc:syncTree() 
omap <silent> ,,	 :call rc:syncTree() 
nnoremap ,mr :MRU
xnoremap ,mr :MRU
onoremap ,mr :MRU
nmap ,mb :PreviousBookmark
nmap ,mn :NextBookmark
nmap ,mm :ToggleBookmark
nnoremap <silent> ,,u :GundoToggle
xnoremap <silent> ,,u :GundoToggle
onoremap <silent> ,,u :GundoToggle
nnoremap ,so :call LoadingMsg("Loading vimrc..."):so $MYVIMRC
nmap ,pp :execute("e ".g:configpath."vim/pluginsrc")
xmap ,pp :execute("e ".g:configpath."vim/pluginsrc")
omap ,pp :execute("e ".g:configpath."vim/pluginsrc")
nmap ,mp :execute("e ".g:configpath."vim/mappingsrc")
xmap ,mp :execute("e ".g:configpath."vim/mappingsrc")
omap ,mp :execute("e ".g:configpath."vim/mappingsrc")
nmap ,gv :execute("e ".g:configpath."gvimrc")
xmap ,gv :execute("e ".g:configpath."gvimrc")
omap ,gv :execute("e ".g:configpath."gvimrc")
nmap ,vv :execute("e ".g:configpath."vimrc")
xmap ,vv :execute("e ".g:configpath."vimrc")
omap ,vv :execute("e ".g:configpath."vimrc")
nnoremap - :Switch
nnoremap <silent> . :call repeat#run(v:count)
xmap ; :
nnoremap ; :
xnoremap < <gv
xnoremap > >gv
inoremap <expr> ¬ pumvisible() ? '<D-n>' : '=pumvisible() ? "\<Down>" : ""'
imap  :wincmd w
imap Ð <Plug>yankstack_substitute_newer_paste
imap ð <Plug>yankstack_substitute_older_paste
nmap F <Plug>(clever-f-F)
xmap F <Plug>(clever-f-F)
omap F <Plug>(clever-f-F)
nmap H ^
xmap H ^
omap H ^
nnoremap J mzJ`z
nnoremap K <Nop>
xnoremap K <Nop>
onoremap K <Nop>
nmap L $
xmap L $
omap L $
nmap N Nzz
nnoremap Q gg=G``zz :StripWhiteSpaces
omap <silent> S <Plug>(seek-back)
xmap S <Plug>VSurround
nmap <silent> S <Plug>(seek-back)
nmap T <Plug>(clever-f-T)
xmap T <Plug>(clever-f-T)
omap T <Plug>(clever-f-T)
nnoremap <silent> U :call repeat#wrap('U',v:count)
omap <silent> X <Plug>(seek-back-cut)
xmap X <Plug>(Exchange)
nnoremap Y y$
nmap [xx <Plug>unimpaired_line_xml_encode
xmap [x <Plug>unimpaired_xml_encode
nmap [x <Plug>unimpaired_xml_encode
nmap [uu <Plug>unimpaired_line_url_encode
xmap [u <Plug>unimpaired_url_encode
nmap [u <Plug>unimpaired_url_encode
nmap [yy <Plug>unimpaired_line_string_encode
xmap [y <Plug>unimpaired_string_encode
nmap [y <Plug>unimpaired_string_encode
nmap [p <Plug>unimpairedPutAbove
nnoremap [ov :set virtualedit+=all
nnoremap [ox :set cursorline cursorcolumn
nnoremap [ow :set wrap
nnoremap [os :set spell
nnoremap [or :set relativenumber
nnoremap [on :set number
nnoremap [ol :set list
nnoremap [oi :set ignorecase
nnoremap [oh :set hlsearch
nnoremap [od :diffthis
nnoremap [ou :set cursorcolumn
nnoremap [oc :set cursorline
nnoremap [ob :set background=light
xmap [e <Plug>unimpairedMoveSelectionUp
nmap [e <Plug>unimpairedMoveUp
nmap [  <Plug>unimpairedBlankUp
omap [n <Plug>unimpairedContextPrevious
nmap [n <Plug>unimpairedContextPrevious
nmap [o <Plug>unimpairedOPrevious
nmap [f <Plug>unimpairedDirectoryPrevious
nmap <silent> [T <Plug>unimpairedTFirst
nmap <silent> [t <Plug>unimpairedTPrevious
nmap <silent> [ <Plug>unimpairedQPFile
nmap <silent> [Q <Plug>unimpairedQFirst
nmap <silent> [q <Plug>unimpairedQPrevious
nmap <silent> [ <Plug>unimpairedLPFile
nmap <silent> [L <Plug>unimpairedLFirst
nmap <silent> [l <Plug>unimpairedLPrevious
nmap <silent> [B <Plug>unimpairedBFirst
nmap <silent> [b <Plug>unimpairedBPrevious
nmap <silent> [A <Plug>unimpairedAFirst
nmap <silent> [a <Plug>unimpairedAPrevious
xmap [% [%m'gv``
nmap [c <Plug>(signify-prev-hunk)
nnoremap \ ;
nmap ]xx <Plug>unimpaired_line_xml_decode
xmap ]x <Plug>unimpaired_xml_decode
nmap ]x <Plug>unimpaired_xml_decode
nmap ]uu <Plug>unimpaired_line_url_decode
xmap ]u <Plug>unimpaired_url_decode
nmap ]u <Plug>unimpaired_url_decode
nmap ]yy <Plug>unimpaired_line_string_decode
xmap ]y <Plug>unimpaired_string_decode
nmap ]y <Plug>unimpaired_string_decode
nmap ]p <Plug>unimpairedPutBelow
nnoremap ]ov :set virtualedit-=all
nnoremap ]ox :set nocursorline nocursorcolumn
nnoremap ]ow :set nowrap
nnoremap ]os :set nospell
nnoremap ]or :set norelativenumber
nnoremap ]on :set nonumber
nnoremap ]ol :set nolist
nnoremap ]oi :set noignorecase
nnoremap ]oh :set nohlsearch
nnoremap ]od :diffoff
nnoremap ]ou :set nocursorcolumn
nnoremap ]oc :set nocursorline
nnoremap ]ob :set background=dark
xmap ]e <Plug>unimpairedMoveSelectionDown
nmap ]e <Plug>unimpairedMoveDown
nmap ]  <Plug>unimpairedBlankDown
omap ]n <Plug>unimpairedContextNext
nmap ]n <Plug>unimpairedContextNext
nmap ]o <Plug>unimpairedONext
nmap ]f <Plug>unimpairedDirectoryNext
nmap <silent> ]T <Plug>unimpairedTLast
nmap <silent> ]t <Plug>unimpairedTNext
nmap <silent> ] <Plug>unimpairedQNFile
nmap <silent> ]Q <Plug>unimpairedQLast
nmap <silent> ]q <Plug>unimpairedQNext
nmap <silent> ] <Plug>unimpairedLNFile
nmap <silent> ]L <Plug>unimpairedLLast
nmap <silent> ]l <Plug>unimpairedLNext
nmap <silent> ]B <Plug>unimpairedBLast
nmap <silent> ]b <Plug>unimpairedBNext
nmap <silent> ]A <Plug>unimpairedALast
nmap <silent> ]a <Plug>unimpairedANext
xmap ]% ]%m'gv``
nmap ]c <Plug>(signify-next-hunk)
xmap a% [%v]%
omap aq <Plug>(textobj-quoted-a)
xmap aq <Plug>(textobj-quoted-a)
omap az <Plug>(textobj-fold-a)
xmap az <Plug>(textobj-fold-a)
omap av <Plug>(textobj-variable-a)
xmap av <Plug>(textobj-variable-a)
omap a/ <Plug>(textobj-lastpat-n)
xmap a/ <Plug>(textobj-lastpat-n)
omap a? <Plug>(textobj-lastpat-N)
xmap a? <Plug>(textobj-lastpat-N)
omap ab <Plug>(textobj-brace-a)
xmap ab <Plug>(textobj-brace-a)
omap am <Plug>(textobj-motionmotion-a)
xmap am <Plug>(textobj-motionmotion-a)
omap ac <Plug>(textobj-comment-a)
xmap ac <Plug>(textobj-comment-a)
omap aC <Plug>(textobj-comment-big-a)
xmap aC <Plug>(textobj-comment-big-a)
omap af <Plug>(textobj-function-a)
xmap af <Plug>(textobj-function-a)
nnoremap cov :set =(&virtualedit =~# "all") ? 'virtualedit-=all' : 'virtualedit+=all'
nnoremap cox :set =&cursorline && &cursorcolumn ? 'nocursorline nocursorcolumn' : 'cursorline cursorcolumn'
nnoremap cod :=&diff ? 'diffoff' : 'diffthis'
nnoremap cob :set background==&background == 'dark' ? 'light' : 'dark'
nmap cxx <Plug>(ExchangeLine)
nmap cxc <Plug>(ExchangeClear)
nmap cx <Plug>(Exchange)
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
nmap f <Plug>(clever-f-f)
xmap f <Plug>(clever-f-f)
omap f <Plug>(clever-f-f)
nmap gx <Plug>NetrwBrowseX
xmap gS <Plug>VgSurround
nnoremap gu :OpenURL
omap iq <Plug>(textobj-quoted-i)
xmap iq <Plug>(textobj-quoted-i)
omap iz <Plug>(textobj-fold-i)
xmap iz <Plug>(textobj-fold-i)
omap iv <Plug>(textobj-variable-i)
xmap iv <Plug>(textobj-variable-i)
omap i/ <Plug>(textobj-lastpat-n)
xmap i/ <Plug>(textobj-lastpat-n)
omap i? <Plug>(textobj-lastpat-N)
xmap i? <Plug>(textobj-lastpat-N)
omap ib <Plug>(textobj-brace-i)
xmap ib <Plug>(textobj-brace-i)
omap im <Plug>(textobj-motionmotion-i)
xmap im <Plug>(textobj-motionmotion-i)
omap ic <Plug>(textobj-comment-i)
xmap ic <Plug>(textobj-comment-i)
omap if <Plug>(textobj-function-i)
xmap if <Plug>(textobj-function-i)
nmap n nzz
omap <silent> s <Plug>(seek-seek)
xmap s S
nmap <silent> s <Plug>(seek-seek)
nmap t <Plug>(clever-f-t)
xmap t <Plug>(clever-f-t)
omap t <Plug>(clever-f-t)
nnoremap <silent> u :call repeat#wrap('u',v:count)
nnoremap vv ^vg_
nnoremap vaf v$f{%;so
xnoremap vaf v$f{%;so
onoremap vaf v$f{%;so
omap <silent> x <Plug>(seek-seek-cut)
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
nnoremap zh zH
xnoremap zh zH
onoremap zh zH
nnoremap zl zL
xnoremap zl zL
onoremap zl zL
nnoremap zm zM
nnoremap zr zR
nmap <S-Tab> <<
xmap <S-Tab> <gv
omap <S-Tab> <gv
nnoremap <D-f> :JSBeautify
nnoremap <silent> <D-Down> :exe "resize " . (winheight(0) * 4/3)
nnoremap <silent> <D-Up> :exe "resize " . (winheight(0) * 3/4)
nnoremap <D-o> zH
xnoremap <D-o> zH
onoremap <D-o> zH
nnoremap <D-i> zL
xnoremap <D-i> zL
onoremap <D-i> zL
nmap <silent> <D-[> :bprev
xmap <silent> <D-[> :bprev
omap <silent> <D-[> :bprev
nmap <silent> <D-]> :bnext
xmap <silent> <D-]> :bnext
omap <silent> <D-]> :bnext
nmap <silent> <S-D-]> :set transparency+=1
xmap <silent> <S-D-]> :set transparency+=1
omap <silent> <S-D-]> :set transparency+=1
nmap <silent> <S-D-[> :set transparency-=1
xmap <silent> <S-D-[> :set transparency-=1
omap <silent> <S-D-[> :set transparency-=1
nmap <silent> <D-E> zz
nmap <silent> <D-D> zz
nmap <silent> <D-e> zz
nmap <silent> <D-d> zz
nnoremap <M-Down> }
xnoremap <M-Down> }
onoremap <M-Down> }
nnoremap <M-Up> {
xnoremap <M-Up> {
onoremap <M-Up> {
nnoremap <M-Right> <C-Right>
xnoremap <M-Right> <C-Right>
onoremap <M-Right> <C-Right>
nnoremap <D-Right> <End>
xnoremap <D-Right> <End>
onoremap <D-Right> <End>
nnoremap <M-Left> <C-Left>
xnoremap <M-Left> <C-Left>
onoremap <M-Left> <C-Left>
nnoremap <D-Left> <Home>
xnoremap <D-Left> <Home>
onoremap <D-Left> <Home>
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cfile>"),0)
nmap <silent> <Plug>unimpairedOPrevious <Plug>unimpairedDirectoryPrevious:echohl WarningMSG|echo "[o is deprecated. Use [f"|echohl NONE
nmap <silent> <Plug>unimpairedONext <Plug>unimpairedDirectoryNext:echohl WarningMSG|echo "]o is deprecated. Use ]f"|echohl NONE
nnoremap <silent> <Plug>unimpairedTLast :exe "".(v:count ? v:count : "")."tlast"
nnoremap <silent> <Plug>unimpairedTFirst :exe "".(v:count ? v:count : "")."tfirst"
nnoremap <silent> <Plug>unimpairedTNext :exe "".(v:count ? v:count : "")."tnext"
nnoremap <silent> <Plug>unimpairedTPrevious :exe "".(v:count ? v:count : "")."tprevious"
nnoremap <silent> <Plug>unimpairedQNFile :exe "".(v:count ? v:count : "")."cnfile"zv
nnoremap <silent> <Plug>unimpairedQPFile :exe "".(v:count ? v:count : "")."cpfile"zv
nnoremap <silent> <Plug>unimpairedQLast :exe "".(v:count ? v:count : "")."clast"zv
nnoremap <silent> <Plug>unimpairedQFirst :exe "".(v:count ? v:count : "")."cfirst"zv
nnoremap <silent> <Plug>unimpairedQNext :exe "".(v:count ? v:count : "")."cnext"zv
nnoremap <silent> <Plug>unimpairedQPrevious :exe "".(v:count ? v:count : "")."cprevious"zv
nnoremap <silent> <Plug>unimpairedLNFile :exe "".(v:count ? v:count : "")."lnfile"zv
nnoremap <silent> <Plug>unimpairedLPFile :exe "".(v:count ? v:count : "")."lpfile"zv
nnoremap <silent> <Plug>unimpairedLLast :exe "".(v:count ? v:count : "")."llast"zv
nnoremap <silent> <Plug>unimpairedLFirst :exe "".(v:count ? v:count : "")."lfirst"zv
nnoremap <silent> <Plug>unimpairedLNext :exe "".(v:count ? v:count : "")."lnext"zv
nnoremap <silent> <Plug>unimpairedLPrevious :exe "".(v:count ? v:count : "")."lprevious"zv
nnoremap <silent> <Plug>unimpairedBLast :exe "".(v:count ? v:count : "")."blast"
nnoremap <silent> <Plug>unimpairedBFirst :exe "".(v:count ? v:count : "")."bfirst"
nnoremap <silent> <Plug>unimpairedBNext :exe "".(v:count ? v:count : "")."bnext"
nnoremap <silent> <Plug>unimpairedBPrevious :exe "".(v:count ? v:count : "")."bprevious"
nnoremap <silent> <Plug>unimpairedALast :exe "".(v:count ? v:count : "")."last"
nnoremap <silent> <Plug>unimpairedAFirst :exe "".(v:count ? v:count : "")."first"
nnoremap <silent> <Plug>unimpairedANext :exe "".(v:count ? v:count : "")."next"
nnoremap <silent> <Plug>unimpairedAPrevious :exe "".(v:count ? v:count : "")."previous"
xnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment("x", "Uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment("n", "Uncomment")
xnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment("x", "AlignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment("n", "AlignBoth")
xnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment("x", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment("n", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAppend :call NERDComment("n", "Append")
xnoremap <silent> <Plug>NERDCommenterYank :call NERDComment("x", "Yank")
nnoremap <silent> <Plug>NERDCommenterYank :call NERDComment("n", "Yank")
xnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment("x", "Sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment("n", "Sexy")
xnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment("x", "Invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment("n", "Invert")
nnoremap <silent> <Plug>NERDCommenterToEOL :call NERDComment("n", "ToEOL")
xnoremap <silent> <Plug>NERDCommenterNested :call NERDComment("x", "Nested")
nnoremap <silent> <Plug>NERDCommenterNested :call NERDComment("n", "Nested")
xnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment("x", "Minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment("n", "Minimal")
xnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment("x", "Toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment("n", "Toggle")
xnoremap <silent> <Plug>NERDCommenterComment :call NERDComment("x", "Comment")
nnoremap <silent> <Plug>NERDCommenterComment :call NERDComment("n", "Comment")
xnoremap <silent> <Plug>(neosnippet_register_oneshot_snippet) :call neosnippet#mappings#_register_oneshot_snippet()
xnoremap <silent> <expr> <Plug>(neosnippet_start_unite_snippet_target) unite#sources#neosnippet_target#start()
xnoremap <silent> <Plug>(neosnippet_expand_target) :call neosnippet#mappings#_expand_target()
xnoremap <silent> <Plug>(neosnippet_get_selected_text) :call neosnippet#helpers#get_selected_text(visualmode(), 1)
snoremap <silent> <expr> <Plug>(neosnippet_jump) neosnippet#mappings#jump_impl()
snoremap <silent> <expr> <Plug>(neosnippet_expand) neosnippet#mappings#expand_impl()
snoremap <silent> <expr> <Plug>(neosnippet_jump_or_expand) neosnippet#mappings#jump_or_expand_impl()
snoremap <silent> <expr> <Plug>(neosnippet_expand_or_jump) neosnippet#mappings#expand_or_jump_impl()
snoremap <Del> a<BS>
snoremap <BS> a<BS>
nmap <C-Tab> :NERDTreeToggle
xmap <C-Tab> :NERDTreeToggle
omap <C-Tab> :NERDTreeToggle
xnoremap <silent> <Plug>(wildfire-water) :call wildfire#water(v:count1)
xnoremap <silent> <Plug>(wildfire-fuel) :call wildfire#fuel(v:count1)
nnoremap <silent> <Plug>(wildfire-fuel) :call wildfire#start(v:count1)
xnoremap <Plug>SidewaysArgumentTextobjI :call sideways#textobj#Argument('i')
onoremap <Plug>SidewaysArgumentTextobjI :call sideways#textobj#Argument('i')
xnoremap <Plug>SidewaysArgumentTextobjA :call sideways#textobj#Argument('a')
onoremap <Plug>SidewaysArgumentTextobjA :call sideways#textobj#Argument('a')
onoremap <silent> <Plug>(textobj-quoted-i) :call g:__textobj_quoted.do_by_function("select-i","-","o")
xnoremap <silent> <Plug>(textobj-quoted-i) :call g:__textobj_quoted.do_by_function("select-i","-","v")
onoremap <silent> <Plug>(textobj-quoted-a) :call g:__textobj_quoted.do_by_function("select-a","-","o")
xnoremap <silent> <Plug>(textobj-quoted-a) :call g:__textobj_quoted.do_by_function("select-a","-","v")
onoremap <silent> <Plug>(textobj-fold-i) :call g:__textobj_fold.do_by_function("select-i","-","o")
xnoremap <silent> <Plug>(textobj-fold-i) :call g:__textobj_fold.do_by_function("select-i","-","v")
onoremap <silent> <Plug>(textobj-fold-a) :call g:__textobj_fold.do_by_function("select-a","-","o")
xnoremap <silent> <Plug>(textobj-fold-a) :call g:__textobj_fold.do_by_function("select-a","-","v")
onoremap <silent> <Plug>(textobj-variable-i) :call g:__textobj_variable.do_by_function("select-i","-","o")
xnoremap <silent> <Plug>(textobj-variable-i) :call g:__textobj_variable.do_by_function("select-i","-","v")
onoremap <silent> <Plug>(textobj-variable-a) :call g:__textobj_variable.do_by_function("select-a","-","o")
xnoremap <silent> <Plug>(textobj-variable-a) :call g:__textobj_variable.do_by_function("select-a","-","v")
onoremap <silent> <Plug>(textobj-lastpat-n) :call g:__textobj_lastpat.do_by_function("select","n","o")
xnoremap <silent> <Plug>(textobj-lastpat-n) :call g:__textobj_lastpat.do_by_function("select","n","v")
onoremap <silent> <Plug>(textobj-lastpat-N) :call g:__textobj_lastpat.do_by_function("select","N","o")
xnoremap <silent> <Plug>(textobj-lastpat-N) :call g:__textobj_lastpat.do_by_function("select","N","v")
onoremap <silent> <Plug>(textobj-brace-i) :call g:__textobj_brace.do_by_function("select-i","-","o")
xnoremap <silent> <Plug>(textobj-brace-i) :call g:__textobj_brace.do_by_function("select-i","-","v")
onoremap <silent> <Plug>(textobj-brace-a) :call g:__textobj_brace.do_by_function("select-a","-","o")
xnoremap <silent> <Plug>(textobj-brace-a) :call g:__textobj_brace.do_by_function("select-a","-","v")
onoremap <silent> <Plug>(textobj-motionmotion-i) :call g:__textobj_motionmotion.do_by_function("select-i","-","o")
xnoremap <silent> <Plug>(textobj-motionmotion-i) :call g:__textobj_motionmotion.do_by_function("select-i","-","v")
onoremap <silent> <Plug>(textobj-motionmotion-a) :call g:__textobj_motionmotion.do_by_function("select-a","-","o")
xnoremap <silent> <Plug>(textobj-motionmotion-a) :call g:__textobj_motionmotion.do_by_function("select-a","-","v")
onoremap <silent> <Plug>(textobj-comment-i) :call g:__textobj_comment.do_by_function("select-i","-","o")
xnoremap <silent> <Plug>(textobj-comment-i) :call g:__textobj_comment.do_by_function("select-i","-","v")
onoremap <silent> <Plug>(textobj-comment-a) :call g:__textobj_comment.do_by_function("select-a","-","o")
xnoremap <silent> <Plug>(textobj-comment-a) :call g:__textobj_comment.do_by_function("select-a","-","v")
onoremap <silent> <Plug>(textobj-comment-big-a) :call g:__textobj_comment.do_by_function("select-a","big","o")
xnoremap <silent> <Plug>(textobj-comment-big-a) :call g:__textobj_comment.do_by_function("select-a","big","v")
onoremap <silent> <Plug>(textobj-function-i) :call g:__textobj_function.do_by_function("select-i","-","o")
xnoremap <silent> <Plug>(textobj-function-i) :call g:__textobj_function.do_by_function("select-i","-","v")
onoremap <silent> <Plug>(textobj-function-a) :call g:__textobj_function.do_by_function("select-a","-","o")
xnoremap <silent> <Plug>(textobj-function-a) :call g:__textobj_function.do_by_function("select-a","-","v")
nmap <silent> <Plug>RestoreWinPosn :call RestoreWinPosn()
nmap <silent> <Plug>SaveWinPosn :call SaveWinPosn()
nmap <SNR>71_WE <Plug>AlignMapsWrapperEnd
nmap <SNR>71_WS <Plug>AlignMapsWrapperStart
xmap <SNR>71_WS <Plug>AlignMapsWrapperStart
omap <SNR>71_WS <Plug>AlignMapsWrapperStart
nnoremap <silent> <Plug>(signify-toggle) :call sy#toggle()
nnoremap <silent> <Plug>(signify-toggle-highlight) :call sy#highlight#line_toggle()
nnoremap <silent> <expr> <Plug>(signify-prev-hunk) &diff ? '[c' : ":\call sy#jump#prev_hunk(v:count1)\"
nnoremap <silent> <expr> <Plug>(signify-next-hunk) &diff ? ']c' : ":\call sy#jump#next_hunk(v:count1)\"
nnoremap <D-p> :CtrlP
xnoremap <D-p> :CtrlP
onoremap <D-p> :CtrlP
nnoremap <silent> <expr> <Plug>(clever-f-repeat-back) clever_f#repeat(1)
xnoremap <silent> <expr> <Plug>(clever-f-repeat-back) clever_f#repeat(1)
onoremap <silent> <expr> <Plug>(clever-f-repeat-back) clever_f#repeat(1)
nnoremap <silent> <expr> <Plug>(clever-f-repeat-forward) clever_f#repeat(0)
xnoremap <silent> <expr> <Plug>(clever-f-repeat-forward) clever_f#repeat(0)
onoremap <silent> <expr> <Plug>(clever-f-repeat-forward) clever_f#repeat(0)
nnoremap <silent> <expr> <Plug>(clever-f-reset) clever_f#reset()
xnoremap <silent> <expr> <Plug>(clever-f-reset) clever_f#reset()
onoremap <silent> <expr> <Plug>(clever-f-reset) clever_f#reset()
nnoremap <silent> <expr> <Plug>(clever-f-T) clever_f#find_with('T')
xnoremap <silent> <expr> <Plug>(clever-f-T) clever_f#find_with('T')
onoremap <silent> <expr> <Plug>(clever-f-T) clever_f#find_with('T')
nnoremap <silent> <expr> <Plug>(clever-f-t) clever_f#find_with('t')
xnoremap <silent> <expr> <Plug>(clever-f-t) clever_f#find_with('t')
onoremap <silent> <expr> <Plug>(clever-f-t) clever_f#find_with('t')
nnoremap <silent> <expr> <Plug>(clever-f-F) clever_f#find_with('F')
xnoremap <silent> <expr> <Plug>(clever-f-F) clever_f#find_with('F')
onoremap <silent> <expr> <Plug>(clever-f-F) clever_f#find_with('F')
nnoremap <silent> <expr> <Plug>(clever-f-f) clever_f#find_with('f')
xnoremap <silent> <expr> <Plug>(clever-f-f) clever_f#find_with('f')
onoremap <silent> <expr> <Plug>(clever-f-f) clever_f#find_with('f')
nmap <silent> <Plug>(easymotion-prefix)N <Plug>(easymotion-N)
xmap <silent> <Plug>(easymotion-prefix)N <Plug>(easymotion-N)
omap <silent> <Plug>(easymotion-prefix)N <Plug>(easymotion-N)
nmap <silent> <Plug>(easymotion-prefix)n <Plug>(easymotion-n)
xmap <silent> <Plug>(easymotion-prefix)n <Plug>(easymotion-n)
omap <silent> <Plug>(easymotion-prefix)n <Plug>(easymotion-n)
nmap <silent> <Plug>(easymotion-prefix)k <Plug>(easymotion-k)
xmap <silent> <Plug>(easymotion-prefix)k <Plug>(easymotion-k)
omap <silent> <Plug>(easymotion-prefix)k <Plug>(easymotion-k)
nmap <silent> <Plug>(easymotion-prefix)j <Plug>(easymotion-j)
xmap <silent> <Plug>(easymotion-prefix)j <Plug>(easymotion-j)
omap <silent> <Plug>(easymotion-prefix)j <Plug>(easymotion-j)
nmap <silent> <Plug>(easymotion-prefix)s <Plug>(easymotion-s)
xmap <silent> <Plug>(easymotion-prefix)s <Plug>(easymotion-s)
omap <silent> <Plug>(easymotion-prefix)s <Plug>(easymotion-s)
xnoremap <silent> <Plug>(easymotion-activate) :call EasyMotion#activate(1)
nnoremap <silent> <Plug>(easymotion-activate) :call EasyMotion#activate(0)
onoremap <silent> <Plug>(easymotion-activate) :call EasyMotion#activate(0)
xnoremap <silent> <Plug>(easymotion-lineanywhere) :call EasyMotion#LineAnywhere(1,2)
nnoremap <silent> <Plug>(easymotion-lineanywhere) :call EasyMotion#LineAnywhere(0,2)
onoremap <silent> <Plug>(easymotion-lineanywhere) :call EasyMotion#LineAnywhere(0,2)
xnoremap <silent> <Plug>(easymotion-linebackward) :call EasyMotion#LineAnywhere(1,1)
nnoremap <silent> <Plug>(easymotion-linebackward) :call EasyMotion#LineAnywhere(0,1)
onoremap <silent> <Plug>(easymotion-linebackward) :call EasyMotion#LineAnywhere(0,1)
xnoremap <silent> <Plug>(easymotion-lineforward) :call EasyMotion#LineAnywhere(1,0)
nnoremap <silent> <Plug>(easymotion-lineforward) :call EasyMotion#LineAnywhere(0,0)
onoremap <silent> <Plug>(easymotion-lineforward) :call EasyMotion#LineAnywhere(0,0)
xnoremap <silent> <Plug>(easymotion-bd-el) :call EasyMotion#EL(1,2)
nnoremap <silent> <Plug>(easymotion-bd-el) :call EasyMotion#EL(0,2)
onoremap <silent> <Plug>(easymotion-bd-el) :call EasyMotion#EL(0,2)
xnoremap <silent> <Plug>(easymotion-gel) :call EasyMotion#EL(1,1)
nnoremap <silent> <Plug>(easymotion-gel) :call EasyMotion#EL(0,1)
onoremap <silent> <Plug>(easymotion-gel) :call EasyMotion#EL(0,1)
xnoremap <silent> <Plug>(easymotion-el) :call EasyMotion#EL(1,0)
nnoremap <silent> <Plug>(easymotion-el) :call EasyMotion#EL(0,0)
onoremap <silent> <Plug>(easymotion-el) :call EasyMotion#EL(0,0)
xnoremap <silent> <Plug>(easymotion-bd-wl) :call EasyMotion#WBL(1,2)
nnoremap <silent> <Plug>(easymotion-bd-wl) :call EasyMotion#WBL(0,2)
onoremap <silent> <Plug>(easymotion-bd-wl) :call EasyMotion#WBL(0,2)
xnoremap <silent> <Plug>(easymotion-bl) :call EasyMotion#WBL(1,1)
nnoremap <silent> <Plug>(easymotion-bl) :call EasyMotion#WBL(0,1)
onoremap <silent> <Plug>(easymotion-bl) :call EasyMotion#WBL(0,1)
xnoremap <silent> <Plug>(easymotion-wl) :call EasyMotion#WBL(1,0)
nnoremap <silent> <Plug>(easymotion-wl) :call EasyMotion#WBL(0,0)
onoremap <silent> <Plug>(easymotion-wl) :call EasyMotion#WBL(0,0)
xnoremap <silent> <Plug>(easymotion-prev) :call EasyMotion#NextPrevious(1,1)
nnoremap <silent> <Plug>(easymotion-prev) :call EasyMotion#NextPrevious(0,1)
onoremap <silent> <Plug>(easymotion-prev) :call EasyMotion#NextPrevious(0,1)
xnoremap <silent> <Plug>(easymotion-next) :call EasyMotion#NextPrevious(1,0)
nnoremap <silent> <Plug>(easymotion-next) :call EasyMotion#NextPrevious(0,0)
onoremap <silent> <Plug>(easymotion-next) :call EasyMotion#NextPrevious(0,0)
xnoremap <silent> <Plug>(easymotion-dotrepeat) :call EasyMotion#DotRepeat(1)
nnoremap <silent> <Plug>(easymotion-dotrepeat) :call EasyMotion#DotRepeat(0)
onoremap <silent> <Plug>(easymotion-dotrepeat) :call EasyMotion#DotRepeat(0)
xnoremap <silent> <Plug>(easymotion-repeat) :call EasyMotion#Repeat(1)
nnoremap <silent> <Plug>(easymotion-repeat) :call EasyMotion#Repeat(0)
onoremap <silent> <Plug>(easymotion-repeat) :call EasyMotion#Repeat(0)
xnoremap <silent> <Plug>(easymotion-jumptoanywhere) :call EasyMotion#JumpToAnywhere(1,2)
nnoremap <silent> <Plug>(easymotion-jumptoanywhere) :call EasyMotion#JumpToAnywhere(0,2)
onoremap <silent> <Plug>(easymotion-jumptoanywhere) :call EasyMotion#JumpToAnywhere(0,2)
xnoremap <silent> <Plug>(easymotion-bd-n) :call EasyMotion#Search(1,2)
nnoremap <silent> <Plug>(easymotion-bd-n) :call EasyMotion#Search(0,2)
onoremap <silent> <Plug>(easymotion-bd-n) :call EasyMotion#Search(0,2)
xnoremap <silent> <Plug>(easymotion-N) :call EasyMotion#Search(1,1)
nnoremap <silent> <Plug>(easymotion-N) :call EasyMotion#Search(0,1)
onoremap <silent> <Plug>(easymotion-N) :call EasyMotion#Search(0,1)
xnoremap <silent> <Plug>(easymotion-n) :call EasyMotion#Search(1,0)
nnoremap <silent> <Plug>(easymotion-n) :call EasyMotion#Search(0,0)
onoremap <silent> <Plug>(easymotion-n) :call EasyMotion#Search(0,0)
xnoremap <silent> <Plug>(easymotion-eol-bd-jk) :call EasyMotion#Eol(1,2)
nnoremap <silent> <Plug>(easymotion-eol-bd-jk) :call EasyMotion#Eol(0,2)
onoremap <silent> <Plug>(easymotion-eol-bd-jk) :call EasyMotion#Eol(0,2)
xnoremap <silent> <Plug>(easymotion-eol-k) :call EasyMotion#Eol(1,1)
nnoremap <silent> <Plug>(easymotion-eol-k) :call EasyMotion#Eol(0,1)
onoremap <silent> <Plug>(easymotion-eol-k) :call EasyMotion#Eol(0,1)
xnoremap <silent> <Plug>(easymotion-eol-j) :call EasyMotion#Eol(1,0)
nnoremap <silent> <Plug>(easymotion-eol-j) :call EasyMotion#Eol(0,0)
onoremap <silent> <Plug>(easymotion-eol-j) :call EasyMotion#Eol(0,0)
xnoremap <silent> <Plug>(easymotion-sol-bd-jk) :call EasyMotion#Sol(1,2)
nnoremap <silent> <Plug>(easymotion-sol-bd-jk) :call EasyMotion#Sol(0,2)
onoremap <silent> <Plug>(easymotion-sol-bd-jk) :call EasyMotion#Sol(0,2)
xnoremap <silent> <Plug>(easymotion-sol-k) :call EasyMotion#Sol(1,1)
nnoremap <silent> <Plug>(easymotion-sol-k) :call EasyMotion#Sol(0,1)
onoremap <silent> <Plug>(easymotion-sol-k) :call EasyMotion#Sol(0,1)
xnoremap <silent> <Plug>(easymotion-sol-j) :call EasyMotion#Sol(1,0)
nnoremap <silent> <Plug>(easymotion-sol-j) :call EasyMotion#Sol(0,0)
onoremap <silent> <Plug>(easymotion-sol-j) :call EasyMotion#Sol(0,0)
xnoremap <silent> <Plug>(easymotion-bd-jk) :call EasyMotion#JK(1,2)
nnoremap <silent> <Plug>(easymotion-bd-jk) :call EasyMotion#JK(0,2)
onoremap <silent> <Plug>(easymotion-bd-jk) :call EasyMotion#JK(0,2)
xnoremap <silent> <Plug>(easymotion-k) :call EasyMotion#JK(1,1)
nnoremap <silent> <Plug>(easymotion-k) :call EasyMotion#JK(0,1)
onoremap <silent> <Plug>(easymotion-k) :call EasyMotion#JK(0,1)
xnoremap <silent> <Plug>(easymotion-j) :call EasyMotion#JK(1,0)
nnoremap <silent> <Plug>(easymotion-j) :call EasyMotion#JK(0,0)
onoremap <silent> <Plug>(easymotion-j) :call EasyMotion#JK(0,0)
xnoremap <silent> <Plug>(easymotion-iskeyword-bd-e) :call EasyMotion#EK(1,2)
nnoremap <silent> <Plug>(easymotion-iskeyword-bd-e) :call EasyMotion#EK(0,2)
onoremap <silent> <Plug>(easymotion-iskeyword-bd-e) :call EasyMotion#EK(0,2)
xnoremap <silent> <Plug>(easymotion-iskeyword-ge) :call EasyMotion#EK(1,1)
nnoremap <silent> <Plug>(easymotion-iskeyword-ge) :call EasyMotion#EK(0,1)
onoremap <silent> <Plug>(easymotion-iskeyword-ge) :call EasyMotion#EK(0,1)
xnoremap <silent> <Plug>(easymotion-iskeyword-e) :call EasyMotion#EK(1,0)
nnoremap <silent> <Plug>(easymotion-iskeyword-e) :call EasyMotion#EK(0,0)
onoremap <silent> <Plug>(easymotion-iskeyword-e) :call EasyMotion#EK(0,0)
xnoremap <silent> <Plug>(easymotion-bd-E) :call EasyMotion#EW(1,2)
nnoremap <silent> <Plug>(easymotion-bd-E) :call EasyMotion#EW(0,2)
onoremap <silent> <Plug>(easymotion-bd-E) :call EasyMotion#EW(0,2)
xnoremap <silent> <Plug>(easymotion-gE) :call EasyMotion#EW(1,1)
nnoremap <silent> <Plug>(easymotion-gE) :call EasyMotion#EW(0,1)
onoremap <silent> <Plug>(easymotion-gE) :call EasyMotion#EW(0,1)
xnoremap <silent> <Plug>(easymotion-E) :call EasyMotion#EW(1,0)
nnoremap <silent> <Plug>(easymotion-E) :call EasyMotion#EW(0,0)
onoremap <silent> <Plug>(easymotion-E) :call EasyMotion#EW(0,0)
xnoremap <silent> <Plug>(easymotion-bd-e) :call EasyMotion#E(1,2)
nnoremap <silent> <Plug>(easymotion-bd-e) :call EasyMotion#E(0,2)
onoremap <silent> <Plug>(easymotion-bd-e) :call EasyMotion#E(0,2)
xnoremap <silent> <Plug>(easymotion-ge) :call EasyMotion#E(1,1)
nnoremap <silent> <Plug>(easymotion-ge) :call EasyMotion#E(0,1)
onoremap <silent> <Plug>(easymotion-ge) :call EasyMotion#E(0,1)
xnoremap <silent> <Plug>(easymotion-e) :call EasyMotion#E(1,0)
nnoremap <silent> <Plug>(easymotion-e) :call EasyMotion#E(0,0)
onoremap <silent> <Plug>(easymotion-e) :call EasyMotion#E(0,0)
xnoremap <silent> <Plug>(easymotion-iskeyword-bd-w) :call EasyMotion#WBK(1,2)
nnoremap <silent> <Plug>(easymotion-iskeyword-bd-w) :call EasyMotion#WBK(0,2)
onoremap <silent> <Plug>(easymotion-iskeyword-bd-w) :call EasyMotion#WBK(0,2)
xnoremap <silent> <Plug>(easymotion-iskeyword-b) :call EasyMotion#WBK(1,1)
nnoremap <silent> <Plug>(easymotion-iskeyword-b) :call EasyMotion#WBK(0,1)
onoremap <silent> <Plug>(easymotion-iskeyword-b) :call EasyMotion#WBK(0,1)
xnoremap <silent> <Plug>(easymotion-iskeyword-w) :call EasyMotion#WBK(1,0)
nnoremap <silent> <Plug>(easymotion-iskeyword-w) :call EasyMotion#WBK(0,0)
onoremap <silent> <Plug>(easymotion-iskeyword-w) :call EasyMotion#WBK(0,0)
xnoremap <silent> <Plug>(easymotion-bd-W) :call EasyMotion#WBW(1,2)
nnoremap <silent> <Plug>(easymotion-bd-W) :call EasyMotion#WBW(0,2)
onoremap <silent> <Plug>(easymotion-bd-W) :call EasyMotion#WBW(0,2)
xnoremap <silent> <Plug>(easymotion-B) :call EasyMotion#WBW(1,1)
nnoremap <silent> <Plug>(easymotion-B) :call EasyMotion#WBW(0,1)
onoremap <silent> <Plug>(easymotion-B) :call EasyMotion#WBW(0,1)
xnoremap <silent> <Plug>(easymotion-W) :call EasyMotion#WBW(1,0)
nnoremap <silent> <Plug>(easymotion-W) :call EasyMotion#WBW(0,0)
onoremap <silent> <Plug>(easymotion-W) :call EasyMotion#WBW(0,0)
xnoremap <silent> <Plug>(easymotion-bd-w) :call EasyMotion#WB(1,2)
nnoremap <silent> <Plug>(easymotion-bd-w) :call EasyMotion#WB(0,2)
onoremap <silent> <Plug>(easymotion-bd-w) :call EasyMotion#WB(0,2)
xnoremap <silent> <Plug>(easymotion-b) :call EasyMotion#WB(1,1)
nnoremap <silent> <Plug>(easymotion-b) :call EasyMotion#WB(0,1)
onoremap <silent> <Plug>(easymotion-b) :call EasyMotion#WB(0,1)
xnoremap <silent> <Plug>(easymotion-w) :call EasyMotion#WB(1,0)
nnoremap <silent> <Plug>(easymotion-w) :call EasyMotion#WB(0,0)
onoremap <silent> <Plug>(easymotion-w) :call EasyMotion#WB(0,0)
xnoremap <silent> <Plug>(easymotion-Tln) :call EasyMotion#TL(-1,1,1)
nnoremap <silent> <Plug>(easymotion-Tln) :call EasyMotion#TL(-1,0,1)
onoremap <silent> <Plug>(easymotion-Tln) :call EasyMotion#TL(-1,0,1)
xnoremap <silent> <Plug>(easymotion-t2) :call EasyMotion#T(2,1,0)
nnoremap <silent> <Plug>(easymotion-t2) :call EasyMotion#T(2,0,0)
onoremap <silent> <Plug>(easymotion-t2) :call EasyMotion#T(2,0,0)
xnoremap <silent> <Plug>(easymotion-t) :call EasyMotion#T(1,1,0)
nnoremap <silent> <Plug>(easymotion-t) :call EasyMotion#T(1,0,0)
onoremap <silent> <Plug>(easymotion-t) :call EasyMotion#T(1,0,0)
xnoremap <silent> <Plug>(easymotion-s) :call EasyMotion#S(1,1,2)
nnoremap <silent> <Plug>(easymotion-s) :call EasyMotion#S(1,0,2)
onoremap <silent> <Plug>(easymotion-s) :call EasyMotion#S(1,0,2)
xnoremap <silent> <Plug>(easymotion-tn) :call EasyMotion#T(-1,1,0)
nnoremap <silent> <Plug>(easymotion-tn) :call EasyMotion#T(-1,0,0)
onoremap <silent> <Plug>(easymotion-tn) :call EasyMotion#T(-1,0,0)
xnoremap <silent> <Plug>(easymotion-bd-t2) :call EasyMotion#T(2,1,2)
nnoremap <silent> <Plug>(easymotion-bd-t2) :call EasyMotion#T(2,0,2)
onoremap <silent> <Plug>(easymotion-bd-t2) :call EasyMotion#T(2,0,2)
xnoremap <silent> <Plug>(easymotion-tl) :call EasyMotion#TL(1,1,0)
nnoremap <silent> <Plug>(easymotion-tl) :call EasyMotion#TL(1,0,0)
onoremap <silent> <Plug>(easymotion-tl) :call EasyMotion#TL(1,0,0)
xnoremap <silent> <Plug>(easymotion-bd-tn) :call EasyMotion#T(-1,1,2)
nnoremap <silent> <Plug>(easymotion-bd-tn) :call EasyMotion#T(-1,0,2)
onoremap <silent> <Plug>(easymotion-bd-tn) :call EasyMotion#T(-1,0,2)
xnoremap <silent> <Plug>(easymotion-fn) :call EasyMotion#S(-1,1,0)
nnoremap <silent> <Plug>(easymotion-fn) :call EasyMotion#S(-1,0,0)
onoremap <silent> <Plug>(easymotion-fn) :call EasyMotion#S(-1,0,0)
xnoremap <silent> <Plug>(easymotion-bd-tl) :call EasyMotion#TL(1,1,2)
nnoremap <silent> <Plug>(easymotion-bd-tl) :call EasyMotion#TL(1,0,2)
onoremap <silent> <Plug>(easymotion-bd-tl) :call EasyMotion#TL(1,0,2)
xnoremap <silent> <Plug>(easymotion-fl) :call EasyMotion#SL(1,1,0)
nnoremap <silent> <Plug>(easymotion-fl) :call EasyMotion#SL(1,0,0)
onoremap <silent> <Plug>(easymotion-fl) :call EasyMotion#SL(1,0,0)
xnoremap <silent> <Plug>(easymotion-bd-tl2) :call EasyMotion#TL(2,1,2)
nnoremap <silent> <Plug>(easymotion-bd-tl2) :call EasyMotion#TL(2,0,2)
onoremap <silent> <Plug>(easymotion-bd-tl2) :call EasyMotion#TL(2,0,2)
xnoremap <silent> <Plug>(easymotion-bd-fn) :call EasyMotion#S(-1,1,2)
nnoremap <silent> <Plug>(easymotion-bd-fn) :call EasyMotion#S(-1,0,2)
onoremap <silent> <Plug>(easymotion-bd-fn) :call EasyMotion#S(-1,0,2)
xnoremap <silent> <Plug>(easymotion-f) :call EasyMotion#S(1,1,0)
nnoremap <silent> <Plug>(easymotion-f) :call EasyMotion#S(1,0,0)
onoremap <silent> <Plug>(easymotion-f) :call EasyMotion#S(1,0,0)
xnoremap <silent> <Plug>(easymotion-bd-fl) :call EasyMotion#SL(1,1,2)
nnoremap <silent> <Plug>(easymotion-bd-fl) :call EasyMotion#SL(1,0,2)
onoremap <silent> <Plug>(easymotion-bd-fl) :call EasyMotion#SL(1,0,2)
xnoremap <silent> <Plug>(easymotion-Fl2) :call EasyMotion#SL(2,1,1)
nnoremap <silent> <Plug>(easymotion-Fl2) :call EasyMotion#SL(2,0,1)
onoremap <silent> <Plug>(easymotion-Fl2) :call EasyMotion#SL(2,0,1)
xnoremap <silent> <Plug>(easymotion-tl2) :call EasyMotion#TL(2,1,0)
nnoremap <silent> <Plug>(easymotion-tl2) :call EasyMotion#TL(2,0,0)
onoremap <silent> <Plug>(easymotion-tl2) :call EasyMotion#TL(2,0,0)
xnoremap <silent> <Plug>(easymotion-f2) :call EasyMotion#S(2,1,0)
nnoremap <silent> <Plug>(easymotion-f2) :call EasyMotion#S(2,0,0)
onoremap <silent> <Plug>(easymotion-f2) :call EasyMotion#S(2,0,0)
xnoremap <silent> <Plug>(easymotion-Fln) :call EasyMotion#SL(-1,1,1)
nnoremap <silent> <Plug>(easymotion-Fln) :call EasyMotion#SL(-1,0,1)
onoremap <silent> <Plug>(easymotion-Fln) :call EasyMotion#SL(-1,0,1)
xnoremap <silent> <Plug>(easymotion-sln) :call EasyMotion#SL(-1,1,2)
nnoremap <silent> <Plug>(easymotion-sln) :call EasyMotion#SL(-1,0,2)
onoremap <silent> <Plug>(easymotion-sln) :call EasyMotion#SL(-1,0,2)
xnoremap <silent> <Plug>(easymotion-tln) :call EasyMotion#TL(-1,1,0)
nnoremap <silent> <Plug>(easymotion-tln) :call EasyMotion#TL(-1,0,0)
onoremap <silent> <Plug>(easymotion-tln) :call EasyMotion#TL(-1,0,0)
xnoremap <silent> <Plug>(easymotion-fl2) :call EasyMotion#SL(2,1,0)
nnoremap <silent> <Plug>(easymotion-fl2) :call EasyMotion#SL(2,0,0)
onoremap <silent> <Plug>(easymotion-fl2) :call EasyMotion#SL(2,0,0)
xnoremap <silent> <Plug>(easymotion-bd-fl2) :call EasyMotion#SL(2,1,2)
nnoremap <silent> <Plug>(easymotion-bd-fl2) :call EasyMotion#SL(2,0,2)
onoremap <silent> <Plug>(easymotion-bd-fl2) :call EasyMotion#SL(2,0,2)
xnoremap <silent> <Plug>(easymotion-T2) :call EasyMotion#T(2,1,1)
nnoremap <silent> <Plug>(easymotion-T2) :call EasyMotion#T(2,0,1)
onoremap <silent> <Plug>(easymotion-T2) :call EasyMotion#T(2,0,1)
xnoremap <silent> <Plug>(easymotion-bd-tln) :call EasyMotion#TL(-1,1,2)
nnoremap <silent> <Plug>(easymotion-bd-tln) :call EasyMotion#TL(-1,0,2)
onoremap <silent> <Plug>(easymotion-bd-tln) :call EasyMotion#TL(-1,0,2)
xnoremap <silent> <Plug>(easymotion-T) :call EasyMotion#T(1,1,1)
nnoremap <silent> <Plug>(easymotion-T) :call EasyMotion#T(1,0,1)
onoremap <silent> <Plug>(easymotion-T) :call EasyMotion#T(1,0,1)
xnoremap <silent> <Plug>(easymotion-bd-t) :call EasyMotion#T(1,1,2)
nnoremap <silent> <Plug>(easymotion-bd-t) :call EasyMotion#T(1,0,2)
onoremap <silent> <Plug>(easymotion-bd-t) :call EasyMotion#T(1,0,2)
xnoremap <silent> <Plug>(easymotion-Tn) :call EasyMotion#T(-1,1,1)
nnoremap <silent> <Plug>(easymotion-Tn) :call EasyMotion#T(-1,0,1)
onoremap <silent> <Plug>(easymotion-Tn) :call EasyMotion#T(-1,0,1)
xnoremap <silent> <Plug>(easymotion-s2) :call EasyMotion#S(2,1,2)
nnoremap <silent> <Plug>(easymotion-s2) :call EasyMotion#S(2,0,2)
onoremap <silent> <Plug>(easymotion-s2) :call EasyMotion#S(2,0,2)
xnoremap <silent> <Plug>(easymotion-Tl) :call EasyMotion#TL(1,1,1)
nnoremap <silent> <Plug>(easymotion-Tl) :call EasyMotion#TL(1,0,1)
onoremap <silent> <Plug>(easymotion-Tl) :call EasyMotion#TL(1,0,1)
xnoremap <silent> <Plug>(easymotion-sn) :call EasyMotion#S(-1,1,2)
nnoremap <silent> <Plug>(easymotion-sn) :call EasyMotion#S(-1,0,2)
onoremap <silent> <Plug>(easymotion-sn) :call EasyMotion#S(-1,0,2)
xnoremap <silent> <Plug>(easymotion-Fn) :call EasyMotion#S(-1,1,1)
nnoremap <silent> <Plug>(easymotion-Fn) :call EasyMotion#S(-1,0,1)
onoremap <silent> <Plug>(easymotion-Fn) :call EasyMotion#S(-1,0,1)
xnoremap <silent> <Plug>(easymotion-sl) :call EasyMotion#SL(1,1,2)
nnoremap <silent> <Plug>(easymotion-sl) :call EasyMotion#SL(1,0,2)
onoremap <silent> <Plug>(easymotion-sl) :call EasyMotion#SL(1,0,2)
xnoremap <silent> <Plug>(easymotion-Fl) :call EasyMotion#SL(1,1,1)
nnoremap <silent> <Plug>(easymotion-Fl) :call EasyMotion#SL(1,0,1)
onoremap <silent> <Plug>(easymotion-Fl) :call EasyMotion#SL(1,0,1)
xnoremap <silent> <Plug>(easymotion-sl2) :call EasyMotion#SL(2,1,2)
nnoremap <silent> <Plug>(easymotion-sl2) :call EasyMotion#SL(2,0,2)
onoremap <silent> <Plug>(easymotion-sl2) :call EasyMotion#SL(2,0,2)
xnoremap <silent> <Plug>(easymotion-bd-fln) :call EasyMotion#SL(-1,1,2)
nnoremap <silent> <Plug>(easymotion-bd-fln) :call EasyMotion#SL(-1,0,2)
onoremap <silent> <Plug>(easymotion-bd-fln) :call EasyMotion#SL(-1,0,2)
xnoremap <silent> <Plug>(easymotion-F) :call EasyMotion#S(1,1,1)
nnoremap <silent> <Plug>(easymotion-F) :call EasyMotion#S(1,0,1)
onoremap <silent> <Plug>(easymotion-F) :call EasyMotion#S(1,0,1)
xnoremap <silent> <Plug>(easymotion-bd-f) :call EasyMotion#S(1,1,2)
nnoremap <silent> <Plug>(easymotion-bd-f) :call EasyMotion#S(1,0,2)
onoremap <silent> <Plug>(easymotion-bd-f) :call EasyMotion#S(1,0,2)
xnoremap <silent> <Plug>(easymotion-F2) :call EasyMotion#S(2,1,1)
nnoremap <silent> <Plug>(easymotion-F2) :call EasyMotion#S(2,0,1)
onoremap <silent> <Plug>(easymotion-F2) :call EasyMotion#S(2,0,1)
xnoremap <silent> <Plug>(easymotion-bd-f2) :call EasyMotion#S(2,1,2)
nnoremap <silent> <Plug>(easymotion-bd-f2) :call EasyMotion#S(2,0,2)
onoremap <silent> <Plug>(easymotion-bd-f2) :call EasyMotion#S(2,0,2)
xnoremap <silent> <Plug>(easymotion-Tl2) :call EasyMotion#TL(2,1,1)
nnoremap <silent> <Plug>(easymotion-Tl2) :call EasyMotion#TL(2,0,1)
onoremap <silent> <Plug>(easymotion-Tl2) :call EasyMotion#TL(2,0,1)
xnoremap <silent> <Plug>(easymotion-fln) :call EasyMotion#SL(-1,1,0)
nnoremap <silent> <Plug>(easymotion-fln) :call EasyMotion#SL(-1,0,0)
onoremap <silent> <Plug>(easymotion-fln) :call EasyMotion#SL(-1,0,0)
nnoremap <silent> <Plug>SurroundRepeat .
nnoremap <S-CR> :!
xnoremap <S-CR> :!
onoremap <S-CR> :!
nmap <S-D-Up> K
xmap <S-D-Up> K
omap <S-D-Up> K
nmap <S-D-Right> L
xmap <S-D-Right> L
omap <S-D-Right> L
nmap <S-D-Down> J
xmap <S-D-Down> J
omap <S-D-Down> J
nmap <S-D-Left> H
xmap <S-D-Left> H
omap <S-D-Left> H
xnoremap <D-Up> <C-Home>
onoremap <D-Up> <C-Home>
xnoremap <D-Down> <C-End>
onoremap <D-Down> <C-End>
nnoremap <silent> <M-D-Right> :wincmd l 
nnoremap <silent> <M-D-Down> :wincmd j 
nnoremap <silent> <M-D-Up> :wincmd k 
nnoremap <silent> <M-D-Left> :wincmd h 
nnoremap <D-j> i
xmap <D-â>�� ]egv
xmap <D-Ë>� [egv
nmap <D-â>�� ]e
nmap <D-Ë>� [e
nnoremap <D-u> viw~
nnoremap <D-CR> :silent !open .
xnoremap <D-CR> :silent !open .
onoremap <D-CR> :silent !open .
xnoremap <D-J> J
nnoremap <D-J> vipJ
nnoremap <F11> :call PreviousCS()
nnoremap <D-Bslash> :UltiSnipsEdit
xnoremap <D-Bslash> :UltiSnipsEdit
onoremap <D-Bslash> :UltiSnipsEdit
nnoremap <F10> :Nyancat2
xnoremap <F10> :Nyancat2
onoremap <F10> :Nyancat2
noremap <D-Ï>� :CtrlPFunky 
nnoremap <D-P> :CtrlPCmdPalette 
xnoremap <D-P> :CtrlPCmdPalette 
onoremap <D-P> :CtrlPCmdPalette 
nnoremap <F12> :call NextCS()
nnoremap <D-9> :colorscheme zmrok
nnoremap <D-8> :colorscheme muzzl
nnoremap <D-7> :colorscheme harlequin
nnoremap <D-6> :colorscheme badwolf
nnoremap <D-5> :colorscheme twilight
nnoremap <D-4> :colorscheme solarized
nnoremap <D-3> :colorscheme molokai
nnoremap <D-2> :colorscheme nerv-ous
nnoremap <D-1> :colorscheme gruvbox:echo 'gruvbox'
nmap <BS> <Plug>(wildfire-water)
xmap <BS> <Plug>(wildfire-water)
omap <BS> <Plug>(wildfire-water)
imap S <Plug>ISurround
imap s <Plug>Isurround
inoremap <expr>  neocomplete#undo_completion()
inoremap <expr>  neocomplete#smart_close_popup()."\"
inoremap <silent> 	 =UltiSnips#ExpandSnippetOrJump()
inoremap  
imap  <Plug>yankstack_substitute_newer_paste
imap  <Plug>yankstack_substitute_older_paste
imap  <Plug>Isurround
inoremap <expr>  neocomplete#close_popup()
nmap  :wincmd w
xmap Ð <Plug>yankstack_substitute_newer_paste
nmap Ð <Plug>yankstack_substitute_newer_paste
xmap ð <Plug>yankstack_substitute_older_paste
nmap ð <Plug>yankstack_substitute_older_paste
inoremap jk 
cnoremap jj 
inoremap jj 
cmap w!! %!sudo tee > /dev/null %
inoreabbr lenght length
let &cpo=s:cpo_save
unlet s:cpo_save
set autochdir
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set backupdir=/tmp//
set balloonexpr=SyntasticBalloonsExprNotifier()
set cindent
set cinkeys=0{,0},0[,0]
set complete=.,w,b,u,t,i,k
set completefunc=neocomplete#complete#manual_complete
set completeopt=longest,menu,menuone,menuone,longest
set copyindent
set directory=/tmp//
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set fillchars=vert:|,fold:-,stl:\ ,stlnc:\\,vert:\ ,vert:\ 
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
set gdefault
set guicursor=a:blinkon0
set guifont=monaco\ for\ powerline:h12
set guioptions=g
set guitablabel=%M%t
set helplang=pt
set hidden
set hlsearch
set ignorecase
set incsearch
set infercase
set langmenu=none
set laststatus=2
set lazyredraw
set listchars=tab:»·,trail:⋅,nbsp:⋅
set matchtime=2
set omnifunc=syntaxcomplete#complete
set pastetoggle=<F6>
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error
set runtimepath=~/.vim,~/.vim/bundle/vundle,~/.vim/bundle/vim-angular,~/.vim/bundle/nextCS,~/.vim/bundle/gruvbox,~/.vim/bundle/badwolf,~/.vim/bundle/molokai,~/.vim/bundle/vim-colors-solarized,~/.vim/bundle/vim-twilight,~/.vim/bundle/vim-kolor,~/.vim/bundle/vim-colors-pencil,~/.vim/bundle/last256,~/.vim/bundle/vim-railscasts-theme,~/.vim/bundle/vim-surround,~/.vim/bundle/vim-seek,~/.vim/bundle/vim-easymotion,~/.vim/bundle/clever-f.vim,~/.vim/bundle/ctrlp.vim,~/.vim/bundle/ctrlp-smarttabs,~/.vim/bundle/LustyExplorer,~/.vim/bundle/ack.vim,~/.vim/bundle/nerdtree,~/.vim/bundle/nerdtree-execute,~/.vim/bundle/nerdtree-ack,~/.vim/bundle/nerdtree-wget.vim,~/.vim/bundle/mru.vim,~/.vim/bundle/neomru.vim,~/.vim/bundle/VimBookmarking,~/.vim/bundle/tagbar,~/.vim/bundle/vim-fugitive,~/.vim/bundle/vim-signify,~/.vim/bundle/Align,~/.vim/bundle/tablify,~/.vim/bundle/vim-js-beautify,~/.vim/bundle/sourcebeautify.vim,~/.vim/bundle/indentLine,~/.vim/bundle/vim-web-indent,~/.vim/bundle/vim-json,~/.vim/bundle/StripWhiteSpaces,~/.vim/bundle/syntast
set shell=bash\ -i
set shiftround
set shiftwidth=2
set showbreak=↪
set showmatch
set showtabline=2
set smartcase
set smartindent
set softtabstop=2
set splitbelow
set splitright
set noswapfile
set synmaxcol=800
set tabline=%!airline#extensions#tabline#get()
set tabstop=2
set tags=./tags,$home/.vim/tags/python.ctags,./tags,tags;/
set termencoding=utf-8
set title
set undodir=
set undofile
set undolevels=100
set updatetime=100
set virtualedit=all
set visualbell
set wildignore=*.swp,*.bak,*.pyc,*.class,tags,*.bak,*.swp,*.pyc,*.o,*.obj,*.dll,*.exe,*.gif,*.png,*.jpg,*.jpeg,*.o,*.obj,*.pyc,*.ds_store,*.db,*.swc
set wildmenu
set wildmode=list:longest,full
set nowritebackup
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dotfiles/vim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +11 ~/git/hugme-front/app/app/view/ajustes/automatizacao/ticket/list.html
badd +48 ~/git/hugme-front/app/app/routes/ajustes.js
badd +4 ~/git/hugme-front/app/app/controllers/ajustes/automatizacao/AutoTiqtViewController.js
badd +73 ~/git/hugme-front/app/app/routes/tiqt.js
badd +0 ~/git/hugme-front/app/app/model/API/AutoAPI.js
badd +113 ~/dotfiles/vim/pluginsrc
badd +2 ~/dotfiles/vim/\[Vundle]\ clean
argglobal
silent! argdel *
edit ~/dotfiles/vim/pluginsrc
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 30 + 32) / 64)
exe '2resize ' . ((&lines * 30 + 32) / 64)
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> î :call AutoPairsJump()a
inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
xnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
xnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "bW")
nnoremap <buffer> <silent> [] m':call search('^\s*endf*\%[unction]\>', "bW")
xnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "bW")
nnoremap <buffer> <silent> [[ m':call search('^\s*fu\%[nction]\>', "bW")
xnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
xnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "W")
nnoremap <buffer> <silent> ][ m':call search('^\s*endf*\%[unction]\>', "W")
xnoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "W")
nnoremap <buffer> <silent> ]] m':call search('^\s*fu\%[nction]\>', "W")
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
nnoremap <buffer> <silent> î :call AutoPairsJump()
xnoremap <buffer> <silent> î :call AutoPairsJump()
onoremap <buffer> <silent> î :call AutoPairsJump()
nnoremap <buffer> <silent> ð :call AutoPairsToggle()
xnoremap <buffer> <silent> ð :call AutoPairsToggle()
onoremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0[,0]
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=130
setlocal colorcolumn=130
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",:\"
setlocal commentstring=\"%s
setlocal complete=.,w,b,u,t,i,k
setlocal concealcursor=inc
setlocal conceallevel=2
setlocal completefunc=neocomplete#complete#manual_complete
setlocal copyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=99
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=syntax
setlocal foldminlines=1
set foldnestmax=10
setlocal foldnestmax=10
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,=end,=else,=cat,=fina,=END,0\\
setlocal infercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=syntaxcomplete#complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal smartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(1)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=800
if &syntax != 'vim'
setlocal syntax=vim
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=78
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
let s:l = 113 - ((14 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
113
normal! 0
wincmd w
argglobal
edit ~/git/hugme-front/app/app/model/API/AutoAPI.js
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
nmap <buffer> gf <Plug>AngularGfTabjump
nmap <buffer>  <Plug>AngularGfSplit
nmap <buffer> f <Plug>AngularGfSplit
nnoremap <buffer> <silent> ,rs :AngularRunSpec
inoremap <buffer> <silent> î :call AutoPairsJump()a
inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
nmap <buffer> gf <Plug>AngularGfJump
nnoremap <buffer> <D-f> :JSBeautify
xnoremap <buffer> <D-f> :JSBeautify
onoremap <buffer> <D-f> :JSBeautify
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
nnoremap <buffer> <silent> î :call AutoPairsJump()
xnoremap <buffer> <silent> î :call AutoPairsJump()
onoremap <buffer> <silent> î :call AutoPairsJump()
nnoremap <buffer> <silent> ð :call AutoPairsToggle()
xnoremap <buffer> <silent> ð :call AutoPairsToggle()
onoremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0[,0]
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=130
setlocal colorcolumn=130
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=//%s
setlocal complete=.,w,b,u,t,i,k
setlocal concealcursor=inc
setlocal conceallevel=2
setlocal completefunc=neocomplete#complete#manual_complete
setlocal copyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'javascript'
setlocal filetype=javascript
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=99
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=indent
setlocal foldminlines=1
set foldnestmax=10
setlocal foldnestmax=10
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetJavascriptIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e
setlocal infercase
setlocal iskeyword=@,48-57,_,192-255,$
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=javascriptcomplete#CompleteJS
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(2)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=800
if &syntax != 'javascript'
setlocal syntax=javascript
endif
setlocal tabstop=2
setlocal tags=~/git/hugme-front/.git/javascript.tags,~/git/hugme-front/.git/tags,./tags,$home/.vim/tags/python.ctags,./tags,tags;/
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
2
normal! zo
5
normal! zo
153
normal! zo
let s:l = 136 - ((13 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
136
normal! 07|
wincmd w
exe '1resize ' . ((&lines * 30 + 32) / 64)
exe '2resize ' . ((&lines * 30 + 32) / 64)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

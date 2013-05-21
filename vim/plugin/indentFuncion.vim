nmap <leader><leader>as :call ToggleIndentGuidesTabs()<cr>
nmap <leader><leader>sa :call ToggleIndentGuidesSpaces()<cr>

function! ToggleIndentGuidesTabs()
	if exists('b:iguides_tabs')
		setlocal nolist
		let &l:listchars = b:iguides_tabs
		unlet b:iguides_tabs
	else
		let b:iguides_tabs = &l:listchars
		setlocal listchars=tab:┆\ "protect the space
		setlocal list
	endif
endfunction

function! ToggleIndentGuidesSpaces()
	if exists('b:iguides_spaces')
		call matchdelete(b:iguides_spaces)
		unlet b:iguides_spaces
	else
		let pos = range(1, &l:textwidth, &l:shiftwidth)
		call map(pos, '"\\%" . v:val . "v"')
		let pat = '\%(\_^\s*\)\@<=\%(' . join(pos, '\|') . '\)\s'
		let b:iguides_spaces = matchadd('CursorLine', pat)
	endif
endfunction

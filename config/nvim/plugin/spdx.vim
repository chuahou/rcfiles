" autocommands for inserting spdx copyright notice etc at top of file

" inserts copyright notice at top of file
" SPDX-License-Identifier: ???
" Copyright (c) YEAR Chua Hou
function s:InsertCopyright()
	" insert current year
	:0r!date "+\%Y"

	norm gg0OSPDX-License-Identifier: ???
	norm ggj0iCopyright (c) 
	norm ggj$a Chua Hou
endfunction
command! InsertCopyright call s:InsertCopyright()

augroup spdxautocmd
	" clear existing
	autocmd!

	" wiki % title
	autocmd BufNewFile *.wiki norm gg0i%title

	" copyright notice except for vimwiki
	autocmd BufNewFile *[^{.wiki}] call s:InsertCopyright()

	" comment notice for each filetype
	autocmd BufNewFile *.c,*.cpp,*.rs,*.scala,*.java norm gg0i// 
	autocmd BufNewFile *.c,*.cpp,*.rs,*.scala,*.java norm ggj0i// 
	autocmd BufNewFile *.hs norm gg0i-- 
	autocmd BufNewFile *.hs norm ggj0i-- 
	autocmd BufNewFile *.py,*.sh,*.zsh norm gg0i# 
	autocmd BufNewFile *.py,*.sh,*.zsh norm ggj0i# 
	autocmd BufNewFile *.sh norm ggO#!/usr/bin/env bash
	autocmd BufNewFile *.zsh norm ggO#!/usr/bin/env zsh
augroup END

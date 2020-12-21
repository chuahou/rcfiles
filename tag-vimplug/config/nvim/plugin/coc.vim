" coc configuration
let g:coc_global_extensions = [
			\ 'coc-yaml',
			\ 'coc-json',
			\ ]

" original example at
" https://github.com/neoclide/coc.nvim#example-vim-configuration

" more space to display
set cmdheight=2

" trigger completion with <C-space>
inoremap <silent><expr> <C-space> coc#refresh()

" activate actions with <C-space>
nmap <C-space> :CocAction<CR>

" diagnostics navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

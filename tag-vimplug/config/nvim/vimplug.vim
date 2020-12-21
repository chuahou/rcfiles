" plugins using vim-plug

" get vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/0.10.0/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" list of vim-plug plugins
call plug#begin('~/.local/share/nvim/plugged')
	" language plugins
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}

	" alignment
	Plug 'godlygeek/tabular'

	" vimwiki
	Plug 'vimwiki/vimwiki'

	" vim-airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" RST Plugins
	Plug 'Rykka/InstantRst', {'do': 'pip3 install --user https://github.com/Rykka/instant-rst.py/archive/master.zip', 'for': 'rst'}
	Plug 'ossobv/vim-rst-tables-py3', {'do': 'pip3 install --user vim_bridge3', 'for': 'rst'}

	" git sign column
	Plug 'airblade/vim-gitgutter'
call plug#end()

" custom command for aligning by spaces
command! -range Align <line1>,<line2>s/\s\+/ /g | noh | <line1>,<line2>Tab/ /l0

" vimwiki configuration
let g:vimwiki_list = [{
			\ 'path'             : '~/dev/knowledge/wiki/',
			\ 'path_html'        : '~/dev/knowledge/docs/',
			\ 'template_path'    : '~/dev/knowledge/templates/',
			\ 'template_default' : 'template',
			\ 'template_ext'     : '.html',
			\ 'nested_syntaxes'  : {
				\ 'algorithm': 'plaintex',
				\ 'cpp': 'cpp',
				\ 'clang': 'c',
				\ 'scala': 'scala',
				\ 'haskell': 'haskell'},
			\ 'custom_wiki2html' : '~/dev/knowledge/wiki2html.sh',
			\ }]
let g:vimwiki_global_ext = 0
noremap <Leader>wo :VimwikiGoto<Space>
noremap <Leader>wb :Vimwiki2HTMLBrowse<CR>
let g:vimwiki_conceallevel = 0

" vimwiki autowrite
function s:VimwikiAutoTOCWrite()
	" update TOC if existant
	if match(getline(1), "= Contents =") >= 0
		exec 'VimwikiTOC'
	endif

	" write and convert if changed
	if &mod
		silent exec 'write'
		silent exec 'Vimwiki2HTML'
	endif
endfunction
augroup VimwikiCustom
	autocmd!
	autocmd BufLeave *.wiki call s:VimwikiAutoTOCWrite()
	autocmd BufWritePre *.wiki call s:VimwikiAutoTOCWrite()
augroup END

" vim-airline configuration
let g:airline_theme = 'angr'
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#checks = [
			\ 'indent', 'long', 'trailing', 'mixed-indent-file', 'conflicts' ]
let g:airline#extensions#whitespace#skip_indent_check_ft = {
			\ 'vim': ['trailing'],
			\ 'vimwiki': ['mixed-indent-file']
			\ }

" faster updates for coc/vim-gitgutter etc
set updatetime=100

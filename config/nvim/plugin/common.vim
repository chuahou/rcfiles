" common shared settings

" turn on undofiles
set undofile

" add indentation settings
set smartindent   " smart indentation
set noexpandtab   " use hard tabs
set tabstop=4     " hard tab width of 4
set softtabstop=4 " soft tab width of 4
set shiftwidth=0

" auto wrap after 80 columns
set textwidth=80

" ensure new line at EOF
set fixeol

" only save folds with mkview / loadview
set viewoptions=folds

" Create backup directory by default
if empty(glob('~/.local/share/nvim/backup'))
	silent !mkdir -p ~/.local/share/nvim/backup
endif

" backup directories
set backupdir=~/.local/share/nvim/backup//,.
set directory=~/.local/share/nvim/backup//,.
set undodir=~/.local/share/nvim/backup//,.

" remove empty lines at end of file
function s:TrimEndLines()
	let save_cursor = getpos(".")
	silent! %s#\($\n\s*\)\+\%$##
	call setpos('.', save_cursor)
endfunction

" runs make if Makefile exists in pwd
function s:MaybeMake()
	if executable("make")
		if filereadable("Makefile")
			!make
		endif
	endif
endfunction

" runs stylish-haskell on Haskell files
" based heavily on https://github.com/nbouscal/vim-stylish-haskell
function s:RunStylishHaskell()
	if executable("stylish-haskell")
		let output = system("stylish-haskell" . " " . bufname("%"))
		let errors = matchstr(output, '\(Language\.Haskell\.Stylish\.Parse\.parseModule:[^\x0]*\)')
		if v:shell_error != 0
			echom output
		elseif empty(errors)
			let winview = winsaveview()
			silent! undojoin
			normal! gg"_dG
			call append(0, split(output, '\v\n'))
			normal! G"_dd
			call winrestview(winview)
			write
		else
			echom errors
		endif
	endif
endfunction

augroup commonautocmd
	" clear existing
	autocmd!

	" remember last position when opening file
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
				\ exe "normal! g'\"" | endif

	" remove empty lines on write
	autocmd BufWritePre * call s:TrimEndLines()

	" run make upon LaTeX written silently
	autocmd BufWritePost *.tex silent exec "call s:MaybeMake()"

	" run stylish-haskell upon Haskell when written
	autocmd BufWritePost *.hs call s:RunStylishHaskell()

	" load and save folds automatically
	" https://vi.stackexchange.com/a/13874
	autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
	autocmd BufWinEnter ?* silent! loadview
augroup END

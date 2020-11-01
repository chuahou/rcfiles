" vi non-compatibility
set nocompatible

" nvim-specific behaviour
set inccommand=nosplit
set wildoptions=pum,tagfile
set lcs=tab:>\ \|,trail:+,nbsp:X,space:· " whitespace settings

" call vimplug
exec 'source ' stdpath('config') . '/vimplug.vim'

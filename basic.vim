" module for basic settings
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set notimeout
set t_Co=256
set nu
se cul
set autochdir
set ruler
set wrap
set wildmenu
set hidden    "this allow you jump to another file without save the curren buffer
set relativenumber
set hlsearch
set incsearch
set ignorecase
set scrolloff=5
set updatetime=100 "let your vim response faster"
set fileencoding=utf-8
set list
set listchars=tab:\|\ ,trail:▫
let &packpath = &runtimepath
set mouse=a
set noswapfile
set shiftwidth=4 "auto indent width for new line 
set tabstop=4 "设置tab显示宽度为4
set expandtab

" let the cursor stay last position while closing file,by default(without this),when
" you open a file the cursor will stay at the 1st line.
if has("autocmd")
	    autocmd BufRead *.txt set tw=78
	        autocmd BufReadPost *
		    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
		    \   exe "normal g'\"" |
		    \ endif
	endif

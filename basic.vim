" module for basic settings
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set notimeout
set showcmd
set t_Co=256
set nu
se cul
set autochdir
set ruler
set wrap
set wildmenu
set hidden    "this allow you jump to another file without save curren buffer
set relativenumber
set hlsearch
set incsearch
set ignorecase
set scrolloff=5
set updatetime=100 "let your vim response faster"
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
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

" 背景透明函数
func! s:transparent_background()
    highlight Normal guibg=None ctermbg=None
    highlight NonText guibg=None ctermbg=None
endf
autocmd ColorScheme * call s:transparent_background()

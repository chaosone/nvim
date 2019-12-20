" __  __        __     _____ __  __ ____   ____ 
"|  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| | | | |  \ \ / / | || |\/| | |_) | |    
"| |  | | |_| |   \ V /  | || |  | |  _ <| |___ 
"|_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"        |___/                                  

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let mapleader=" " "set the leader
let &t_ut=''
colorscheme default
syntax on
syntax enable
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set nu
se cul
set ruler
set wrap
set wildmenu
"set relativenumber
set hlsearch
set incsearch
set ignorecase
set scrolloff=5
noremap n nzz
noremap N Nzz
set fileencoding=utf-8
let &packpath = &runtimepath
set mouse=a
set noswapfile
if has("autocmd")
	    autocmd BufRead *.txt set tw=78
	        autocmd BufReadPost *
		    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
		    \   exe "normal g'\"" |
		    \ endif
	endif
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'scrooloose/nerdcommenter' " in <space>cn to comment a line
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdcommenter'
"Plug 'iamcco/markdown-preview.vim'
"Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown'}
Plug 'davidhalter/jedi-vim'  "python自动补全
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
"markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'theniceboy/bullets.vim'
call plug#end()

colorscheme snazzy
let g:SnazzyTransparent = 1
let g:mkdp_path_to_chrome = "chromium"
nmap <M-f> :FZF . <Cr>
nnoremap ; :
map Q :q<CR>
map R :source $MYVIMRC<CR>
map <M-,> :vsplit<CR>
noremap <LEADER><CR> :nohlsearch<CR>
map <LEADER>sc :set spell!<CR>
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>cx ! chmod +x %
map <LEADER>rc :edit $MYVIMRC<CR>  
map <LEADER>r :MarkdownPreview
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>
map to :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

map tt :NERDTreeToggle<CR>

"indent for python
set shiftwidth=4 "indent width for each line 
set tabstop=4 "设置tab显示宽度为4
set expandtab
autocmd FileType python set expandtab

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'


"markdown keymap for insert mode
autocmd FileType markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd FileType markdown inoremap ,b **** <++><Esc>F*hi
autocmd FileType markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd FileType markdown inoremap ,i ** <++><Esc>F*i
autocmd FileType markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd FileType markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd FileType markdown inoremap ,n ---<Enter><Enter>


set t_Co=256
" Python Interpreter
autocmd FileType python nnoremap <buffer> <C-i> :!python % <CR>










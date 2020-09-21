" __  __        __     _____ __  __ ____   ____ 
"|  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| | | | |  \ \ / / | || |\/| | |_) | |    
"| |  | | |_| |   \ V /  | || |  | |  _ <| |___ 
"|_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"        |___/                                  

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let mapleader=" " "set the leader
let &t_ut=''
"colorscheme solarized
"syntax on
"syntax enable
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set nu
se cul
set ruler
set wrap
set wildmenu
set relativenumber
set hlsearch
set incsearch
set ignorecase
set scrolloff=5
noremap n nzz
noremap N Nzz
set fileencoding=utf-8
let &packpath = &runtimepath
set mouse=a
set updatetime=100
set noswapfile
if has("autocmd")
	    autocmd BufRead *.txt set tw=78
	        autocmd BufReadPost *
		    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
		    \   exe "normal g'\"" |
		    \ endif
	endif
call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
"Plug 'bling/vim-buffer-line'
"status line && color
Plug 'theniceboy/vim-deus'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
Plug 'connorholyday/vim-snazzy'
Plug 'scrooloose/nerdcommenter' " in <space>cn to comment a line
" python completion
"Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2-jedi'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'

"Auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"file integration
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'junegunn/fzf'
"map tt :NERDTreeToggle<CR>

"Plug 'iamcco/markdown-preview.vim'
"Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown'}
"Plug 'davidhalter/jedi-vim'  "python自动补全
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
"markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'theniceboy/bullets.vim'
call plug#end()

color deus
let g:SnazzyTransparent = 1
let g:mkdp_path_to_chrome = "chromium"
let g:airline_theme='dracula'
"nmap <M-f> :FZF . <Cr>

"===
"===mapping
"===
nnoremap ; :
map Q :q<CR>
map R :source $MYVIMRC<CR>
map <M-,> :vsplit<CR>

nnoremap <silent> S 0
nnoremap <silent> D $
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
nmap <space>e :CocCommand explorer<CR>
"nnoremap <LEADER>y +Y
" popup
"""coc-translator
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)

"open startify
noremap <Leader>st :Startify<CR>
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

filetype plugin on
" ===
" === vim-instant_markdown
" ===
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
let g:instant_markdown_open_to_the_world = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autoscroll = 0
let g:instant_markdown_port = 8888
let g:instant_markdown_python = 1

" ===
"===markdown keymap for insert mode
" ===
autocmd FileType markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd FileType markdown inoremap ,b **** <++><Esc>F*hi
autocmd FileType markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd FileType markdown inoremap ,i ** <++><Esc>F*i
autocmd FileType markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd FileType markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd FileType markdown inoremap ,n ---<Enter><Enter>


set t_Co=256
" Python Interpreter
autocmd FileType python nnoremap <buffer> <C-i> :!python3 % <CR>

"===
"===coc
"===

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-o> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

"====
"==== quickly run
"====
"map <c-i> CompileRunGcc()<CR>
"func! CompileRunGcc()
    "exec "w"

"a simple and basic vim/nvim config file without coc.nvim,all setting is in this file.
"tabsize
se shiftwidth=4    "set tab width"
set tabstop=4
set expandtab
set softtabstop=4

nnoremap ; :
se nu
se wrap
se relativenumber
se to
se hidden
" key board seq input timeout
se timeoutlen=600
call plug#begin('~/.config/nvim/plugged')
Plug 'dracula/vim'
Plug 'mhinz/vim-startify'
Plug 'mg979/vim-xtabline'
Plug 'vim-airline/vim-airline'
"Plug 'chriskempson/base16-vim'
"Plug 'lambdalisue/battery.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'    "code commentter
Plug 'ryanoasis/vim-devicons'    "file devicons
Plug 'voldikss/vim-floaterm'
"Plug 'skywind3000/vim-auto-popmenu'
"Plug 'skywind3000/vim-dict'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'AndrewRadev/switch.vim'    "press gs to switch boolean variable between true/false
Plug 'puremourning/vimspector'    "debug tool
Plug 'tell-k/vim-autopep8'    "python code standard
Plug 'luochen1990/rainbow'    "colorzied bracket
Plug 'yianwillis/vimcdoc'    "vim chinese documentation
call plug#end()
colorscheme dracula
set rtp+=~/.fzf
let mapleader=" "
let g:airline_theme='simple'
"set tabline=...%{battery#component()}...
set t_Co=256
se encoding=UTF-8
set autochdir
set wildmenu
set wrap
set noswapfile
set mouse=a
set autoindent
set updatetime=100 "let your vim response faster"
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set list
" 设置 Backspace 键模式
set bs=eol,start,indent
"set notimeout
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
"set listchars=tab:\|\ ,trail:▫

"----------------------------------------------------------------------
" searching 
"----------------------------------------------------------------------
" 搜索时忽略大小写
set ignorecase
" 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
set smartcase
" highlight mathed
set hlsearch
" increment search
"----------------------------------------------------------------------
" Editing settings
"----------------------------------------------------------------------

set scrolloff=5
set list
set listchars=tab:>-,trail:-
set showcmd

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" let the cursor stay last position while closing file,by default(without this),when
" you open a file the cursor will stay at the 1st line.
if has("autocmd")
	    autocmd BufRead *.txt set tw=78
	        autocmd BufReadPost *
		    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
		    \   exe "normal g'\"" |
		    \ endif
	endif

" ===
"===markdown keymap for insert mode
" ===

autocmd FileType markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd FileType markdown inoremap ,b **** <++><Esc>F*hi
autocmd FileType markdown inoremap ,c ```<CR><CR>```<Esc>ki 
autocmd FileType markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd FileType markdown inoremap ,i ** <++><Esc>F*i
autocmd FileType markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd FileType markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd FileType markdown inoremap ,n ---<Enter><Enter>
"set signcolumn=yes
"" ===
" === coc.nvim
" ===
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
if has('nvim')
  inoremap <silent><expr> <c-i> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics(断点)
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
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

" Formatting selected code.
xmap <leader>fm  <Plug>(coc-format-selected)
nmap <leader>fm  <Plug>(coc-format-selected)

let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-prettier',
	\ 'coc-json',
    \ 'coc-pairs',
    \ 'coc-sh',
    \ 'coc-pyright']


"----------------------------------------------------------------------
" Mapping 
"----------------------------------------------------------------------
nnoremap <Leader>co "+yy
vnoremap Y "+y
"nnoremap <Leader>pa $"+P
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>
noremap <Leader>f :Files<CR>
nnoremap <Leader>ag :Ag<CR>
nnoremap <Leader>st :Startify<CR>
nmap <Leader>rc :edit $MYVIMRC
nmap <Leader>R :source $MYVIMRC<CR>
noremap n nzz
noremap N Nzz
noremap <Leader><CR> :nohlsearch<CR>
nmap <Leader>l <C-w>l
nmap <Leader>h <C-w>h
let g:mkdp_brower = "/usr/bin/chromium"
autocmd Filetype markdown noremap ,m :MarkdownPreview
autocmd Filetype markdown noremap ,ms :MarkdownPreviewStop
let g:floaterm_autoinsert='v:true'
let g:floaterm_keymap_new = '<Leader>fn'
let g:floaterm_keymap_toggle = '<Leader>ft'
let g:floaterm_keymap_kill = '<Leader>fc'
nnoremap <F5> :FloatermNew bash %
nnoremap <Leader>fnf :FloatermNew ranger<CR>
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

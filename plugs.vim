" this module is used to sourcing vim/nvim plugins
"install/loading plugins via vim-plug
call plug#begin('~/.config/nvim/plugged')
"Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
"status line && color
Plug 'theniceboy/vim-deus'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
Plug 'mg979/vim-xtabline'           "a status line on top show current path
Plug 'connorholyday/vim-snazzy'     "just a vim theme 
Plug 'scrooloose/nerdcommenter' " in <space>cn to comment a line
Plug 'roxma/nvim-yarp'

"Auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`

"file integration
Plug 'rbgrouleff/bclose.vim'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'junegunn/fzf'

"for python 
Plug 'Yggdroot/indentLine'     "缩进对齐辅助线
Plug 'tell-k/vim-autopep8'
Plug 'terryma/vim-multiple-cursors'
"Plug 'davidhalter/jedi-vim'  "python自动补全
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
"markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] } "generate a catalog for md file

Plug 'theniceboy/bullets.vim'
" go 主要插件
Plug 'fatih/vim-go', { 'tag': '*' }
" go 中的代码追踪，输入 gd 就可以自动跳转
Plug 'dgryski/vim-godef'
"Plug 'suda.vim'    "error at launch
" code format
Plug 'junegunn/vim-easy-align'
Plug 'voldikss/vim-floaterm'

call plug#end()

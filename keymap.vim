map R :source $MYVIMRC<CR>
map <LEADER>rc :edit $MYVIMRC<CR>
map <LEADER>cx !chmod +x %
map to :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>
noremap n nzz
noremap N Nzz
nmap <LEADER>f :FZF . <CR>
""===
""===mapping
""===
nnoremap ; :
map Q :q<CR>
map <M-,> :vsplit<CR>

nnoremap <silent> S 0
nnoremap <silent> D $
noremap <LEADER><CR> :nohlsearch<CR>
vnoremap Y:"+y 
map <LEADER>sc :set spell!<CR>
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>sudo :w !sudo tee %
map <LEADER>r :MarkdownPreview
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>
nmap <space>e :CocCommand explorer<CR>
"nnoremap <LEADER>y +Y

"""coc-translator
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)
"easy aligin mapping
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

"open startify
noremap <Leader>st :Startify<CR>


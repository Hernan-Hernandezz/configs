let mapleader=" "
nmap <Leader><Esc> :q!<cr> 
nmap <Leader>s <plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
"atajos de teclado
nmap <Leader>w :w<cr>
nmap <Leader>q :q<cr>
  "quitar seleccion de remplazo o busqueda
nmap <C-W> :noh<cr>
  "remplazo de palabras
nmap <C-s> :%s/
"desplazo de ventanas
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><


"code runner
nmap<silent><leader>B <plug>CodeRunner

nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

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
nmap <Leader>l :Bracey<cr>
nmap <Leader>lc :BraceyStop<cr>


function! OpenTerminal()
  " move to right most buffer
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else
    " open terminal
    execute "vsp term://zsh"

    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>


xmap s <Plug>VSurround

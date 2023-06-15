let mapleader=" "

" Mapeo para cerrar el archivo sin guardar
nmap <Leader><Esc> :q!<cr>

" Mapeo para activar EasyMotion
nmap <Leader>s <plug>(easymotion-s2)

" Mapeo para abrir NERDTree y resaltar el archivo actual
nmap <Leader>nt :NERDTreeFind<CR>

" Atajos de teclado
nmap <Leader>w :w<cr>
nmap <Leader>q :q<cr>

" Desactivar resaltado de búsqueda o reemplazo
nmap <Leader><C-W> :noh<cr>

" Reemplazar palabras
nmap <C-s> :%s/

" Desplazamiento de ventanas
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

" Code Runner
nmap<silent><leader>B <plug>CodeRunner

" Verificar y alternar el modo de Syntastic
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" Abrir Bracey para previsualizar el archivo HTML/CSS/JS
nmap <Leader>l :Bracey<cr>
nmap <Leader>lc :BraceyStop<cr>

" Función para abrir una terminal
function! OpenTerminal()
  " Mover al buffer más a la derecha
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " Cerrar la terminal existente
    execute "q"
  else
    " Abrir una terminal
    execute "vsp term://zsh"

    " Desactivar números de línea
    execute "set nonu"
    execute "set nornu"

    " Alternar el modo de inserción al entrar o salir
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " Establecer mapeos dentro del buffer de la terminal
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction

" Mapeo para abrir una terminal
nnoremap <C-t> :call OpenTerminal()<CR>

" Mapeo para usar el plugin VSurround en modo visual
xmap s <Plug>VSurround


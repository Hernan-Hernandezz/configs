set number relativenumber
set numberwidth=1
set number
set ruler
syntax on
set showcmd
set encoding=utf-8
"configuracion de tabulaciones
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
filetype indent on
set clipboard=unnamedplus
set splitright "Abrir ventanas a la derecha
set laststatus=2

highlight NonText ctermbg=none

so ~/configs/.vim/maps.vim
so ~/configs/.vim/plugins.vim
so ~/configs/.vim/plugins-config.vim
packloadall

"config de coc-prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

let g:airline_theme='simple'

"configuraciones de emmet
let g:user_emmet_mode='n'
let g:user_emmet_expandabbr_key='m'

"configuracion de indentLine
" No mostrar en ciertos tipos de buffers y archivos
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']


colorscheme molokai
set background=dark
"let g:molokai_original = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_aggregate_errors = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] } 
"prettier config


hi Normal ctermbg=none

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
set clipboard=unnamed
set splitright "Abrir ventanas a la derecha
set laststatus=2
call plug#begin('~/.vim/plugged')
"temas
Plug 'tomasr/molokai'
"IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-syntastic/syntastic'
Plug 'mattn/emmet-vim'
Plug 'mantoni/eslint_d.js'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'digitaltoad/vim-pug'
Plug 'digitaltoad/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
call plug#end()
"configuraciones de emmet
let g:user_emmet_mode='n'
let g:user_emmet_expandabbr_key='m'

"configuracion de vim-airline
let g:airline_theme='simple'

"configuracion de indentLine
" No mostrar en ciertos tipos de buffers y archivos
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']


colorscheme molokai
let g:molokai_original = 1
let mapleader=' '
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
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

"configuracion de coc
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"



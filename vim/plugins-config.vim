" Configuración de coc

set hidden
set nobackup
set nowritebackup

set cmdheight=2

set updatetime=300

set shortmess+=c

if has("patch-8.1.1564")
  " Fusionar la columna de signos con la columna de números
  set signcolumn=number
else
  set signcolumn=yes
endif

" Configuración de vim-closetag
let g:closetag_filenames = '*.xhtml,*.jsx,*js,*.astro'

let g:python3_host_prog = "/bin/python3"
let g:formatters_python = ['black', 'autopep8']
let g:run_all_formatters_python = 1

let g:python_highlight_all = 1

" Ejecutar Autoformat al guardar el archivo
" (descomenta si deseas habilitar esta función)
"au BufWrite * :Autoformat
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
"
let g:prettier#autoformat = 1

" Configuración básica de coc

" Iniciar coc
let g:coc_global_extensions = [
  \ 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json',
  \ 'coc-python', 'coc-snippets'
  \ ]

" Habilitar autocompletado
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Mapear el comando de activación de autocompletado
" según tus preferencias
nmap <silent> <Leader>ca :<C-u>CocList completions<CR>

" Mapear el comando de apertura de la lista de diagnósticos
nmap <silent> <Leader>cd :<C-u>CocList diagnostics<CR>

" Mapear el comando de apertura de la ventana de referencia
nmap <silent> <Leader>cr :<C-u>CocRefactor<CR>

" Mapear el comando de formato del documento
nmap <silent> <Leader>cf :<C-u>CocCommand format<CR>

" Configuración del tema
" Cambiar 'onedark' al tema de tu elección
" Ejemplo: 'coc-prettier', 'coc-pyright', 'coc-eslint', etc.
" Puedes verificar los nombres de los temas y extensiones disponibles
" ejecutando el comando :CocList marketplace en Vim.
let g:coc_global_config = {
  \ 'coc.preferences.formatOnSaveFiletypes': ['css', 'html', 'javascript', 'json', 'markdown', 'python', 'typescript', 'javascriptreact', 'typescriptreact'],
  \ 'coc.preferences.formatOnSaveEnable': 1,
  \ 'coc.preferences.completion.triggerCharacter': ['.', ':', '::'],
  \ 'coc.preferences.completion.autoTrigger': 'always',
  \ 'coc.preferences.diagnostic.enableSign': 1,
  \ 'coc.preferences.diagnostic.displayByAle': v:true,
  \ 'coc.preferences.diagnostic.displayVirtualText': v:true,
  \ 'coc.preferences.diagnostic.virtualTextSigns': [
    \ { "sign": "*", "highlight": "CocWarningSign" },
    \ { "sign": "*", "highlight": "CocErrorSign" },
    \ { "sign": "*", "highlight": "CocInfoSign" }
    \ ],
  \ 'coc.preferences.diagnostic.signOffset': 10000,
  \ 'coc.preferences.remappings': {
    \ 'workspace.symbol': 'gS',
    \ 'workspace.references': 'gR',
    \ 'extensions.toggle': 'gX'
    \ }
  \ }

"usar emmet en todo los modos
let g:user_emmet_mode='inv'

"configuracion para astro
" Agrega astro al archivo coc-settings.json
let g:coc_settings = {
  \ "languageserver": {
    \ "astro": {
      \ "command": "astro",
      \ "filetypes": ["astro"],
      \ "rootPatterns": ["astro.toml"],
      \ "initializationOptions": {}
    \ }
  \ },
\ }

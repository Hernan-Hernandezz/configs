call plug#begin('~/.vim/plugged')

" Temas
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-syntastic/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'

" Git
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'ryanoasis/vim-devicons'
Plug 'jmcantrell/vim-virtualenv'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'gregsexton/gitv'
Plug 'kurocode25/mdforvim'
Plug 'airblade/vim-gitgutter'
" Linters
Plug 'ap/vim-css-color'
Plug 'vim-scripts/django.vim'
Plug 'AndrewRadev/tagalong.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'honza/vim-snippets'

" JSX
Plug 'mxw/vim-jsx'

" Autoformatting
Plug 'tell-k/vim-autopep8'
Plug 'chiel92/vim-autoformat'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

" Syntax Highlighting
Plug 'vim-python/python-syntax'
Plug 'wuelnerdotexe/vim-astro'

" Airline (descomenta si lo necesitas)
"Plug 'digitaltoad/vim-airline'
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Otros plugins y configuraciones
Plug 'nvim-lualine/lualine.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'kurocode25/mdforvim'

" Fin de los plugins

call plug#end()

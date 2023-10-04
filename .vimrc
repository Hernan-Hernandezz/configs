set number relativenumber
set numberwidth=1
set ruler
syntax on
set showcmd
set encoding=utf-8

" Configuración de tabulaciones
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
filetype indent on

set clipboard=unnamedplus
set splitright "Abrir ventanas a la derecha
set laststatus=2
set foldmethod=syntax

highlight NonText ctermbg=none

" Cargar archivos de configuración adicionales
so ~/configs/vim/maps.vim
so ~/configs/vim/plugins.vim
so ~/configs/vim/plugins-config.vim
packloadall

" Configuración de coc-prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
let g:loaded_perl_provider = 0
let g:airline_theme='simple'

" Configuraciones de Emmet
let g:user_emmet_mode='n'
let g:user_emmet_expandabbr_key='m'

" Configuración de indentLine
" No mostrar en ciertos tipos de buffers y archivos
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

"colorscheme molokai
colorscheme gruvbox
set background=light

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

if exists("javaScript_fold")
  syn match javaScriptFunction "\<function\>"
  syn region javaScriptFunctionFold start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend
  syn sync match javaScriptSync grouphere javaScriptFunctionFold "\<function\>"
  syn sync match javaScriptSync grouphere NONE "^}" setlocal foldmethod=syntax setlocal foldtext=getline(v:foldstart)
else
  syn keyword javaScriptFunction function
  syn match javaScriptBraces "[{}\[\]]"
  syn match javaScriptParens "[()]"
endif

syn sync fromstart
syn sync maxlines=100

hi Normal ctermbg=none

lua << END
-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#fbf1c7',
  fg       = '#6a6e75',
  yellow   = '#d79921',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#458588',
  red      = '#cc241d',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme. So we
      -- are just setting default looks of statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- These are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- These are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at the left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at the right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.blue }, -- Sets highlighting of the component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- Mode component
  function()
    return ''
  end,
  color = function()
    -- Auto change color according to Neovim's mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  -- Filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in Neovim :)
-- For lualine, it's any number greater than 2
ins_left {
  function()
    return '%='
  end,
}


-- Add components to right sections
ins_right {
  'o:encoding', -- Option component, same as &encoding in VimL
  fmt = string.upper, -- I'm not sure why it's uppercase either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool, but Eviline doesn't have them. Sigh
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified is really weird
  symbols = { added = ' ', modified = '*', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)
END


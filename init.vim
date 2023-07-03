call plug#begin()
Plug 'neovim/nvim-lspconfig'                           " Required
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
Plug 'williamboman/mason-lspconfig.nvim'               " Optional

" Autocompletion
Plug 'hrsh7th/nvim-cmp'     " Required
Plug 'hrsh7th/cmp-nvim-lsp' " Required
Plug 'L3MON4D3/LuaSnip'     " Required

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}

Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'lunacookies/vim-plan9'
call plug#end()

set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set nohlsearch
set incsearch
set ignorecase
set lazyredraw
set termguicolors
colorscheme plan9

syntax off
set number
set relativenumber

set nocompatible
filetype plugin on
set hidden

set mouse=a
nnoremap <space> <nop>
let mapleader=" "
set backspace=indent,eol,start

nnoremap <leader>vv :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>vr :so ~/.config/nvim/init.vim<CR>

" fzf
let g:fzf_buffers_jump = 1
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>g :Rg<CR>

lua <<EOF
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
	'gopls'
})

lsp.setup()

local cmp = require('cmp')

cmp.setup({
	mapping = {
		['<CR>'] = cmp.mapping.confirm({select = false}),
	}
})
EOF

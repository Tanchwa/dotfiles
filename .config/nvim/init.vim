" general
set nocompatible
syntax on
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/site/plugged')

" Declare the list of plugins.
" Visual Settings
" Autocomplete/ Intelisense/ linting
Plug 'neovim/nvim-lspconfig'
Plug 'hashivim/vim-terraform'
Plug 'hashicorp/vscode-terraform'
"Plug 'neomake/neomake'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/trouble.nvim'
Plug 'github/copilot.vim'

" Color theme plugins
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

" UI/ Visual Plugins
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'folke/trouble.nvim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""
" Color Settings
"""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
" colorscheme elflord

"""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Settings
"""""""""""""""""""""""""""""""""""""""""""""""""
"for gruvbox
let g:gruvbox_contrast_light = 'hard'


"""""""""""""""""""""""""""""""""""""""""""""""""
" UI Settings
"""""""""""""""""""""""""""""""""""""""""""""""""
" Keep cursor in the middle of the page, useful for editing text
set so=999
set number
set tabstop=2
set expandtab
filetype on
filetype indent on
filetype plugin indent on
set autoindent
" to load init.lua defaults for nvim-tree, lualine
source ~/.config/nvim/myinit.lua
""""""""""""""""""""""""""""""""""
"""""""""""LUA SNIP SETTINGS """""""""""""""""""
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

""""""""""" LSP Plugin Config """""""" 
augroup terraform_filetype
        silent! autocmd! filetypedetect BufRead,BufNewFile *.tf
        autocmd BufRead,BufNewFile *.hcl set filetype=hcl
        autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl
        autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform
        autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json
        autocmd BufWritePre *.tfvars lua vim.lsp.buf.format()
        autocmd BufWritePre *.tf lua vim.lsp.buf.format()
augroup END
augroup json_filetype
        autocmd BufWritePre *.json :%! jq
augroup END
let g:terraform_fmt_on_save=1
let g:terraform_align=1

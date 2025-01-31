set nocompatible
filetype plugin indent on
syntax enable

" Basic settings
set number relativenumber
set cursorline expandtab
set tabstop=4 shiftwidth=4
set autoindent smartindent
set mouse=a clipboard=unnamedplus
set hidden updatetime=300
set signcolumn=yes termguicolors

" Install vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()
" Core plugins
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Development plugins
Plug 'vim-python/python-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-commentary'
call plug#end()

" Theme
autocmd VimEnter * ++nested colorscheme gruvbox
set background=dark

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['^node_modules$', '^.git$', '^__pycache__$']

" CoC extensions
let g:coc_global_extensions = [
    \ 'coc-pyright',
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-prettier',
    \ 'coc-eslint'
\]

" CoC Navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Tab completion
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Python settings
autocmd FileType python setlocal colorcolumn=88
let g:python_highlight_all = 1

" Frontend settings
autocmd FileType javascript,typescript,typescriptreact setlocal tabstop=2 shiftwidth=2
let g:user_emmet_leader_key='<C-Z>'

" Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" FZF
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>

" Key bindings
let mapleader = "\<Space>"
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>

" Python formatting
function! FormatPython()
    silent! execute '!black %'
    silent! execute '!isort %'
    edit!
endfunction
autocmd FileType python nnoremap <buffer> <F9> :call FormatPython()<CR>

" CoC settings file
if !filereadable(expand('~/.vim/coc-settings.json'))
    call system('mkdir -p ~/.vim')
    call writefile([
        \ '{',
        \ '  "python.linting.enabled": true,',
        \ '  "python.formatting.provider": "black",',
        \ '  "prettier.tabWidth": 2,',
        \ '  "prettier.singleQuote": true',
        \ '}'
    \ ], expand('~/.vim/coc-settings.json'))
endif
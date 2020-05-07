" Plugin installtions
call plug#begin('~/.local/share/nvim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'mileszs/ack.vim'
Plug 'rust-lang/rust.vim'
Plug 'tomtom/tcomment_vim'
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dag/vim-fish'
call plug#end()

" Use system clipboard provider
set clipboard+=unnamedplus

" Show line numbers
set number

" Show 80 char line
set textwidth=80
set colorcolumn=+1

" Automatic indentation on
set smartindent
set autoindent

" Use 2-space softtabs
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Enable block folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Keep backup and swap files in separate directory
set backup
set udf
set backupdir=~/.config/nvim/tmp/backup//
set directory=~/.config/nvim/tmp/swap//
set udir=~/.config/nvim/tmp/undo//

" Colorscheme theme management
set background = "light"
set termguicolors
set bg=light

function! ToggleLightDark()
  if &bg ==# "light"
    echom "set bg=dark"
    set bg=dark
    " colorscheme solarized8_dark
  else
    echom "set bg=light"
    set bg=light
    " colorscheme solarized8_dark
  endif
endfunction
nnoremap <C-c> :call ToggleLightDark()<CR>

" Hide current mode -- displayed by lightline plugin
set noshowmode
" Set lightline colorscheme
let g:lightline = { 'colorscheme': 'solarized' }

" Add directory change mapping to change dir to that of the current buffer
nnoremap <leader>cd :cd %:p:h<CR>

" Configure Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', { '_': ['ale']})

set hidden
" Configure ALE plugin
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_rust_cargo_use_clippy = 1
let g:ale_linters = {
\  'go': [ 'gofmt' ],
\  'python': [ 'pyls' ],
\  'ruby': [ 'solargraph' ],
\  'rust': [ 'cargo', 'rls' ],
\}
let g:ale_fixers = {
\  'go': [ 'gofmt', 'goimports' ],
\  'rust': [ 'rustfmt' ],
\}

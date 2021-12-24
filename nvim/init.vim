" ---------------- "
" >>> VIM PLUG <<< "

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" ------------------- "
" >>> VIM PLUGINS <<< "

call plug#begin('~/.vim/bundle/')

Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'

call  plug#end()

" --------------------------- "
" >>> VIM CUSTOM MAPPINGS <<< "

let mapleader=","

nnoremap ; :
vnoremap ; :

nmap <leader>j <ESC>
vmap <leader>j <ESC>
imap <leader>j <ESC>

nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>w :w<CR>
nmap <leader>W :wq<CR>
nmap <leader>q :q<CR>
nmap <leader>Q :q!<CR>

nmap <leader>d :bd<CR>
nmap <leader>n :bNext<CR>

" --------------------------- "
" >>> VIM PLUGIN'S CONFIG <<< "

" airline "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'

" ----------------------------- "
" >>> VIM  DEFAULT'S CONFIG <<< "

" reasonable defaults
autocmd vimenter * ++nested colorscheme gruvbox         " gruvbox theme
set background=dark                                     " dark background
set backspace=indent,eol,start                          " sensible backspacing
set conceallevel=2                                      " set this so we wont break indentation plugin
set emoji                                               " enable emojis
set encoding=utf-8                                      " text encoding
set expandtab smarttab                                  " tab key actions
set fillchars+=vert:\▏                                  " requires a patched nerd font (try FiraCode)
set foldlevel=0                                         " open all folds by default
set grepprg=rg\ --vimgrep                               " use rg as default grepper
set history=1000                                        " history limit
set inccommand=nosplit                                  " visual feedback while substituting
set incsearch ignorecase smartcase hlsearch             " highlight text while searching
set list listchars=trail:»,tab:»-                       " use tab to navigate in list mode
set mouse=a                                             " mouse scrolling
set noshowcmd                                           " to get rid of display of last command
set noshowmode                                          " dont show current mode below statusline
set number                                              " enable numbers on the left
set relativenumber                                      " current line is 0
set showtabline=0                                       " always show tabline
set so=8                                                " scrolloff
set spellang="pt_br"                                    " default language
set splitbelow                                          " open horizontal split to the bottom
set splitright                                          " open vertical split to the right
set tabstop=4 softtabstop=4 shiftwidth=4 autoindent     " tab width
set termguicolors                                       " opaque bg
set title                                               " tab title as file name
set tw=90                                               " auto wrap lines that are longer than that
set undodir=/tmp                                        " undo temp file directory
set undofile                                            " enable persistent undo
set wrap breakindent                                    " wrap long lines to the width set by tw

" performance tweaks
set lazyredraw
set nocursorcolumn
set nocursorline
set re=1
set redrawtime=10000
set scrolljump=0
set synmaxcol=180

" required by coc
set cmdheight=1
set hidden
set nobackup
set nowritebackup
set shortmess+=c
set signcolumn=yes
set updatetime=300

" looks and styling
highlight Comment cterm=italic

" -------------------------------------- "
" >>> VIM INSTALL PLUGINS ON STARTUP <<< "

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


" Init
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" Load vim-plug
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

call plug#begin('~/.vim/plugged')

"============================================================================
" Plugins from github repos (my favorites):

" Nerdtree/ browser
Plug 'scrooloose/nerdtree'
" Comment code
Plug 'scrooloose/nerdcommenter'
" Fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'
" Vim surround
Plug 'tpope/vim-surround'

" End of plugins
call plug#end()

"============================================================================
" Install plugins
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" Allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" Allow mouse in tmux
"set mouse=a

" Tabs and spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Insert line underneath by following mapping
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Select line w/ visual mode
nmap vv V

" Always show status bar
set ls=2

" Incremental search
set incsearch
" Highlighted search results
set hlsearch

" Syntax highlight on
syntax on

" Show line numbers
set nu
set relativenumber

" Cursor is 3 lines away from screen border
set scrolloff=3

" Autocompletion of files and commands behaves like shell
set wildmode=list:longest

" Set timeout
set ttimeoutlen=50

" NERDTree -----------------------------
" Toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" Open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" Ignore certain file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Fuzzy file finder mapping (recent)
nmap ,m :CtrlPMRUFiles<CR>

" Set breakpoint in python
nnoremap <leader>b oimport pdb;pdb.set_trace()<ESC>

" set colorscheme
colorscheme delek

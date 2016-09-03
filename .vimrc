" need to set up Vundle
" run following in terminal:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" load cscope setup
source ~/.vim/cscope_maps.vim

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Super Searching, press CTRL-P
Plugin 'kien/ctrlp.vim'
" GIT integration
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-scripts/indentpython.vim'
"Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
" <leader><leader>e go to forward motion
" <leaderl><leader>b go to backward motion
Plugin 'easymotion/vim-easymotion'
" For NERDcommenter using nested comments, use <leader>cc to comment selection
" and <leader>cu to uncomment selection
Plugin 'scrooloose/nerdcommenter'

" add cscope database to thing
cs a ~/aos-2016/cscope.out

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Colour Schemes
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    set background=dark
    colorscheme zenburn
endif

" Toggle bg with F5 button
call togglebg#map("<F5>")

" Set up file browsing
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Use System Clipboard
" cd aos-2016
set clipboard=unnamed

" Set utf-8 support
set encoding=utf-8

" Show line numbers
set nu

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Set up indentation for python
"au BufNewFile,BufRead *.py
"    \ set tabstop=4     |
"    \ set softtabstop=4 |
"    \ set shiftwidth=4  |
"    \ set textwidth=79  |
"    \ set expandtab     |
"    \ set autoindent    |
"    \ set fileformat=unix
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

" YouCompleteMe config
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" tells YCM to look in V_ENV packages
"python3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
"EOF

" Set up indentation for webdev
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2      |
    \ set softtabstop=2  |
    \ set shiftwidth=2

" Python highlighting
let python_highlight_all=1
syntax on

" set up cscope
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
        if filereadable("cscope.out")
                 cs add cscope.out
                         " else add database pointed to by environment
                             elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
endif

nmap <C-\>s :cs find s =expand("")
nmap <C-\>g :cs find g =expand("")
nmap <C-\>c :cs find c =expand("")
nmap <C-\>t :cs find t =expand("")
nmap <C-\>e :cs find e =expand("")
nmap <C-\>f :cs find f =expand("")
nmap <C-\>i :cs find i ^=expand("")$
nmap <C-\>d :cs find d =expand("")

set nohlsearch
set cursorline
cd ~/aos-2016

let NERDRPlace=""
let NERDLPlace="//"

syntax on


filetype on
filetype plugin on
filetype plugin indent on


set autoindent
set autoread
set backspace=2 
set cursorline
set directory=/tmp
set expandtab
set ignorecase 
set incsearch
set laststatus=2
set lcs=tab:\»\ 
set list
set nocompatible
set nonumber
set noswapfile
set nowrap
set pastetoggle=<F2>
set ruler
set scrolloff=3
set shiftwidth=4
set smartcase
set statusline=%{fugitive#statusline()}\:\ %F%m%=%y\ [%l-%L,%v]\ 
set tabstop=4
set tags+=$HOME/.vim/tags/python.ctags
set visualbell
set wildignore+=*.pyc,**/cache/**
set wildmode=list:longest


if has("gui_running")
    cd ~/Projects
    set guifont=Menlo\ Regular:h13
    set guioptions=egmrt
    set fuoptions=maxvert,maxhorz
    "highlight NonText ctermfg=bg guifg=bg " Hides ~ after EOF
endif


let mapleader = " "

let g:explVertical=1    " open vertical split window
let g:explSplitRight=1  " Put new window to the right of the explorer
let g:explStartRight=0  " new windows go to right of explorer window


" Disable <a> underline in html files
highlight link htmlLink NONE


" Pathogen
call pathogen#infect()


" BufExplorer
map <silent><leader>b <ESC>:BufExplorer<Enter>


" NERDTree
map <silent><leader>n <ESC>:NERDTreeToggle<Enter>

let g:NERDTreeChDirMode=2


" Command-T Options
let g:CommandTMaxHeight=15


" ConqueTerm
map <silent><leader>s <ESC>:ConqueTermSplit bash --init-file ~/.bash_profile<Enter>

let g:ConqueTerm_CloseOnEnd = 1

au! FileType conque_term set nocursorline


" Ack
nmap <leader>a <Esc>:Ack 

let g:path_to_search_app = "/usr/local/bin/ack"


" JSBeautifier
command! Jsbeautify call g:Jsbeautify()<cr>


" Windows
map <C-S-Left> <c-w>4<
map <C-S-Right> <c-w>4>
map <C-S-Up> <c-w>4-
map <C-S-Down> <c-w>4+


" Buffers
nnoremap <F5> :buffers<CR>:buffer<Space>


" Tabs
noremap <silent> ,t <ESC>:tabnew<CR>
noremap <silent> ,c <ESC>:tabclose<CR>
noremap <silent> <S-h> <ESC>:tabprevious<CR>
noremap <silent> <S-j> <ESC>:tabfirst<CR>
noremap <silent> <S-k> <ESC>:tablast<CR>
noremap <silent> <S-l> <ESC>:tabnext<CR>


au! BufRead,BufNewFile *.migration,*.wsgi   setfiletype python
au! BufRead,BufNewFile Capfile,Vagrantfile  setfiletype ruby
au! BufRead,BufNewFile *.scss               setfiletype scss.css
au! FileType python set omnifunc=syntaxcomplete#Complete
au! FileType css    set omnifunc=csscomplete#CompleteCSS

" Mappings to move lines up and down
nnoremap <C-Down> :m+<CR>==
nnoremap <C-Up> :m-2<CR>==
inoremap <C-Down> <Esc>:m+<CR>==gi
inoremap <C-Up> <Esc>:m-2<CR>==gi
vnoremap <C-Down> :m'>+<CR>gv=gv
vnoremap <C-Up> :m-2<CR>gv=gv

" Mappings to indent/unindent lines
nnoremap <C-Left> <<
nnoremap <C-Right> >>
vnoremap <C-Left> <gv
vnoremap <C-Right> >gv


" Clear highlights
nmap <silent> <ESC> :silent noh<CR>


python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF




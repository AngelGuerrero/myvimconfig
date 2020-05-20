"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"    -> Plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Set numbers
set number

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Add a bit extra margin to the left
set foldcolumn=1

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set termguicolors
let g:miramare_enable_italic = 1
let g:miramare_disable_italic_comment = 1
set background=dark
"colorscheme palenight
"let g:lightline = { 'colorscheme': 'palenight' }
"colorscheme miramare
"colorscheme Tomorrow-Night
colorscheme base16-dracula
"colorscheme base16-cupertino
"colorscheme base16-onedark
"colorscheme base16-seti
"colorscheme base16-github
"colorscheme base16-gruvbox-dark-hard
"colorscheme base16-chalk
"colorscheme atom-dark

syntax enable 

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nnoremap <silent><leader>w :w!<cr>:echo "Saved!"<cr>

" Exit
nnoremap <silent><leader>q :q!<cr>

" Saving and exit
nnoremap <silent><leader>x :wq!<cr>

" Clear highlinghting
nnoremap <silent><leader><space> :noh<cr>

" Install plugins
map <silent><F5> :w<cr>:so $MYVIMRC<cr>:PlugInstall<cr>

" Clean plugins
map <silent><F6> :w<cr>:PlugClean<cr>

" Save and reload source
map <silent><F4> :w<cr>:so $MYVIMRC<cr>

" Search for replace
nnoremap <F3> :%s/

" Select one word
nnoremap <C-D> viw

" White space after line
"nnoremap <C-Enter> o<esc>k
nnoremap gi <esc>o<esc>k

"Select one word and copy
inoremap <C-C> <esc>lbvey

"Select one word and copy
nnoremap <C-C> lbvey

" override 'x' key functionality, my 'x' key doesn't work :(
nnoremap <leader>d x

" Quck edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Clear the termial output
nnoremap <leader>e :! clear<cr>

" Execute programs
nnoremap <leader>r :!ruby %<cr>
nnoremap <leader>j :!node %<cr>

" surround a word with "
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" surround a paragraph with "
nnoremap <leader>c" v$di""<esc>hp<esc>

" Surround with ruby interpolation
nnoremap <leader># viw<esc>a}<esc>bi#{<esc>lel

" Escape from insert mode
inoremap jk <esc>
vnoremap jk <esc>

" Only javascript maps
autocmd FileType javascript nnoremap <buffer>ññ A;<esc>
autocmd FileType javascript inoremap <buffer>ññ <esc>A;<esc>

autocmd FileType javascript inoremap <buffer>ñv <esc>A,<cr>
autocmd FileType javascript nnoremap <buffer>ñv <esc>A,<cr>

autocmd FileType javascript inoremap <buffer>,e <esc>A {<esc>o}<esc>O

autocmd FileType javascript iabbrev conl console.log

" Writes test text
iabbrev lorem Vivamus vulputate tortor ut nunc rutrum, vel luctus augue molestie. Vestibulum lobortis eget quam sed luctus. Nunc posuere vehicula mauris, at semper nulla mattis in. Nullam quis molestie diam. Sed laoreet dui risus, ut vestibulum orci tincidunt mollis. Aliquam quam dui, viverra vitae dictum eget, bibendum mattis risus. Cras gravida sapien massa, ac maximus leo sollicitudin ac. In consequat sollicitudin purus, ac mattis nibh tempor at. Phasellus tristique risus ac lectus porttitor fermentum.


" Local commands examples
"autocmd FileType javascript nnoremap <buffer><localleader>c I// <esc>
"autocmd FileType python nnoremap <buffer><localleader>c I# <esc>


" :W sudo saves the file 
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null


" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

map <F2> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
" map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
" map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim colors brackets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" NERDTree
Plug 'preservim/nerdtree'

" Illuminate
Plug 'rrethy/vim-illuminate'

" Matchit
Plug 'vim-scripts/matchit.zip'

" Rainbow parentheses
Plug 'kien/rainbow_parentheses.vim'

" NERD Commenter
Plug 'scrooloose/nerdcommenter'

" Colorscheme themes
"Plug 'ParamagicDev/vim-medic_chalk'

"Colorscheme miramare
Plug 'franbach/miramare'

" Polyglot
Plug 'sheerun/vim-polyglot'

" Vim colors xcode
Plug 'arzg/vim-colors-xcode'

" Colors sonokai
Plug 'sainnhe/sonokai'

" Colors Base16
Plug 'chriskempson/base16-vim'

" Colors Base16
Plug 'drewtempelmeyer/palenight.vim'

" Autoclose 
Plug 'cohama/lexima.vim'

" Surround 
Plug 'tpope/vim-surround'

" vim rainbow 
Plug 'frazrepo/vim-rainbow'

call plug#end()
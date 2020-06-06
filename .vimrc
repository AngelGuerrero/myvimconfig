"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

set fenc=utf-8

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
"set so=7

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
set cmdheight=1

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
"set noerrorbells
"set novisualbell
set t_vb=
set tm=500


" Add a bit extra margin to the left
"set foldcolumn=1

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
    au!
    "autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set termguicolors

"Miramare settings
"colorscheme miramare
"let g:miramare_enable_italic = 1
"let g:miramare_disable_italic_comment = 1

" Set colorscheme before open editor
set background=light
"autocmd BufRead * :colorscheme miramare
"autocmd BufRead * :colorscheme nightfly
"autocmd BufRead * :colorscheme codedark
autocmd BufRead * :colorscheme one

syntax enable 

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

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

"Auto indent
set ai 
"Smart indent
set si 
"Wrap lines
set wrap 


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
let maplocalleader = "-"

" Fast saving
nnoremap <leader>w :w!<cr>:echo "Saved!"<cr>
inoremap <leader>w <esc>:w!<cr>:echo "Saved!"<cr>
vnoremap <leader>w :w!<cr>:echo "Saved!"<cr>

" Exit
nnoremap <silent><leader>q :q!<cr>

" Saving and exit
nnoremap <silent><leader>x :wq!<cr>


" Clear highlinghting
nnoremap <silent><leader><space> :noh<cr>

" Select one word using CONTROL-D
nnoremap <C-D> viw

" Add space below current line
nnoremap gi <esc>o<esc>k

" Add space above current line
nnoremap ga O<esc>j<esc>

" Add a space after a character
nnoremap gag a<space><esc>h

"Select one word and copy
inoremap <C-C> <esc>lbvey

"Select one word and copy
nnoremap <C-C> lbvey

" override 'x' key functionality, my 'x' key doesn't work :(
nnoremap <leader>d x

" Quck edit .vimrc
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>ve :vsplit $MYVIMRC<cr>

" Clear the termial output
nnoremap <F8> :! clear<cr>

" Search for replace
map <F3> :%s/

" surround a word with "
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Escape from insert mode
inoremap jk <esc>
vnoremap jk <esc>

" My snippets
"
" Vim
augroup filetype_vim
  autocmd!

  " Save and reload source
  map <F4> :w $MYVIMRC<cr>:so $MYVIMRC<cr>

  " Install plugins
  map <F5> <F4>:PlugInstall<cr>

  " Clean plugins
  map <F6> <F4>:PlugClean<cr>

  " Update plugins
  "map <F9> :PlugUpdate<cr>
augroup END

augroup fileType_erlang
  autocmd!
  "
  " Add a period at the end of the line
  autocmd FileType erlang nnoremap <buffer>ññ A.<esc>
  autocmd FileType erlang inoremap <buffer>ññ <esc>A.<esc>
  "
  " New line
  autocmd FileType erlang nnoremap <buffer>ñl A,o
  autocmd FileType erlang inoremap <buffer>ñl <esc>A,<esc>o
  "
  " Enter body function
  autocmd FileType erlang nnoremap <buffer><leader>e A-><cr>
  autocmd FileType erlang inoremap <buffer><leader>e <esc>A-><cr>
  "
  " Compile a erlang file
  " FIX: Fix the next line for compile and execute a erlang file
  "autocmd FileType erlang nnoremap <buffer><F10> :!erl -noshell -s :<c-u>normal! %
  "
  " Abbrevation
  autocmd FileType erlang iabbrev iofw io:fwrite
augroup END


" Ruby
augroup filetype_ruby
  autocmd!

  autocmd FileType ruby map <F9> :!clear && ruby %<cr>
  " 
  " Surround with ruby interpolation
  autocmd FileType ruby nnoremap <buffer><leader>se viw<esc>a}<esc>bi#{<esc>lel
  autocmd FileType ruby vnoremap <buffer><leader>se di#{<esc>pa}<esc>lel
  autocmd FileType ruby inoremap <buffer><leader>se #{}<esc>i
  "
  " Enter meanwhile user is writing
  autocmd FileType ruby inoremap <buffer><leader>e <esc>oend<esc>O
  autocmd FileType ruby nnoremap <buffer><leader>e <esc>oend<esc>O
augroup END


" Python
augroup filetype_python
  autocmd!

  autocmd FileType python map <F9> :!clear && python %<cr>
  autocmd FileType python inoremap <leader>e <esc>o
  autocmd FileType python nnoremap <leader>e <esc>o
augroup END

" Typescript
augroup filetype_typescript
  autocmd!

  autocmd FileType typescript map <F9> :!clear && tsc %<cr>
augroup END

" Javascript 
augroup filetype_javascript, fileType_vue
  autocmd!

  autocmd FileType javascript map <F9> :!clear && node %<cr>
  "
  " Snippets
  autocmd FileType javascript nnoremap <buffer>ññ A;<esc>
  autocmd FileType javascript inoremap <buffer>ññ <esc>A;<esc>

  autocmd FileType javascript inoremap <buffer>ñv <esc>A,<cr>
  autocmd FileType javascript nnoremap <buffer>ñv <esc>A,<cr>
  "
  " if statement
  autocmd FileType javascript inoremap <buffer>,e <esc>A {<esc>o}<esc>O
  "
  " console
  autocmd FileType javascript iabbrev conl console.log
augroup END

" Writes test text
iabbrev lorem Vivamus vulputate tortor ut nunc rutrum, vel luctus augue molestie. Vestibulum lobortis eget quam sed luctus. Nunc posuere vehicula mauris, at semper nulla mattis in. Nullam quis molestie diam. Sed laoreet dui risus, ut vestibulum orci tincidunt mollis. Aliquam quam dui, viverra vitae dictum eget, bibendum mattis risus. Cras gravida sapien massa, ac maximus leo sollicitudin ac. In consequat sollicitudin purus, ac mattis nibh tempor at. Phasellus tristique risus ac lectus porttitor fermentum.

" :W sudo saves the file 
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null


" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /

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
au BufReadPost * 
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \ exe "normal! g'\"" |
  \ endif 


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
"set statusline=\ File:\ %F\ -\ Line:\ %l\ -\ Column:\ %c\ -\ Total:\ %L

" Some funky status bar code its seems
" https://stackoverflow.com/questions/9065941/how-can-i-change-vim-status-line-colour
set laststatus=2            " set the bottom status bar
set noshowmode

function! ModifiedColor()
    if &mod == 1
        hi statusline guibg=OrangeRed4 ctermfg=8 guifg=White ctermbg=15
    else
        hi statusline guibg=Green ctermfg=8 guifg=DarkSlateGray ctermbg=15
    endif
endfunction

au InsertLeave,InsertEnter,BufWritePost   * call ModifiedColor()
" default the statusline when entering Vim
hi statusline guibg=White ctermfg=8 guifg=DarkSlateGray ctermbg=15

" Formats the statusline
set statusline=%f                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=[%{getbufvar(bufnr('%'),'&mod')?'modified':'saved'}]      
"modified flag

set statusline+=%r      "read only flag

set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim colors brackets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1

" Indent guide
"let g:indent_guides_enable_on_vim_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE Linters
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \}

let g:ale_fixers = {
      \ 'javascript': ['eslint']
      \}
let g:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
"let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --print-width=60 --semi=false'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ruby_autocomplete_solargraph = '$GEM_HOME/gems/solargraph-0.39.7/bin/'
"let g:completor_ruby_omni_trigger = '([$\w]{1,}|\.[\w]*|::[$\w]*)$'


let g:ycm_semantic_triggers = {
      \ 'elm' : ['.'],
      \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

Plug 'vim-ruby/vim-ruby'

" Lightline
Plug 'itchyny/lightline.vim'

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
"Plug 'franbach/miramare'

" Polyglot
Plug 'sheerun/vim-polyglot'

" Colorscheme xcode
"Plug 'arzg/vim-colors-xcode'

" Colorscheme sonokai
"Plug 'sainnhe/sonokai'

" Colorscheme Base16
"Plug 'chriskempson/base16-vim'

" Colorscheme Base16
"Plug 'drewtempelmeyer/palenight.vim'

" Autoclose 
Plug 'cohama/lexima.vim'

" Surround 
Plug 'tpope/vim-surround'

" vim rainbow 
Plug 'frazrepo/vim-rainbow'

" Colorscheme Eldar
"Plug 'agude/vim-eldar'

" Colorscheme Darkspace
"Plug 'yuqio/vim-darkspace'

" Colorscheme Wombat
"Plug 'gryf/wombat256grf'

" Colorscheme jummidark
" Colorscheme for JS
"Plug 'jcherven/jummidark.vim'

" Colorscheme pulumi dark
"Plug 'pgavlin/pulumi.vim'

"Colorscheme pencil
"Plug 'Mizux/vim-colorschemes'

"Plug 'eemed/sitruuna.vim'

" Colorscheme nebula for rust
"Plug 'stillwwater/vim-nebula'

" Colorshceme dogrun
" good theme for ruby
"Plug 'wadackel/vim-dogrun'

"Colorscheme
"Plug 'stulzer/mitormk-laser'
"Colorscheme
"Plug 'atahabaki/archman-vim'

"Colorscheme Awsome theme
Plug 'bluz71/vim-nightfly-guicolors'

"Colorscheme moonlight
" not for ruby
"Plug 'lewis6991/moonlight.vim'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'w0rp/ale'

Plug 'dense-analysis/ale'

Plug 'prettier/vim-prettier', {
      \ 'do': 'npm install',
      \ 'for': ['javascript', 'typescript', 'css', 'json']
      \}

Plug 'Shadowsith/vim-ruby-autocomplete'

Plug 'ycm-core/YouCompleteMe'

"Plug 'elmcast/elm-vim'

"Plug 'theJian/elm.vim'

"Plug 'mattn/emmet-vim'

" Visual studio color scheme
Plug 'tomasiser/vim-code-dark'

" Vue support
Plug 'posva/vim-vue'

" Colorscheme GitHub
"Plug 'cormacrelf/vim-colors-github'

" Colorscheme lucid
"
" Buen color para ruby, 
Plug 'cseelus/vim-colors-lucid'

" Colorscheme vim one
Plug 'rakr/vim-one'

" Colorscheme tender
"Plug 'jacoborus/tender.vim'

" Colorscheme afterglow
"Plug 'danilo-augusto/vim-afterglow'

call plug#end()

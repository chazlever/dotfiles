"------------------------------------------------------------------------------
" File: $HOME/.vimrc
" Author: Chaz Lever <https://github.com/chazlever>
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" STANDARD STUFF
"------------------------------------------------------------------------------

set nocompatible                  " Disable vi compatibility
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set number                        " Show line numbers.
set ruler                         " Show cursor position.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.
set title                         " Set the terminal's title
set visualbell                    " No beeping.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
set tabstop=3                     " Global tab width.
set shiftwidth=3                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set smarttab                      " Insert tabs according to tabstop, shiftwidth, and expandtab
set autoindent                    " Copy indentation from previous line
set laststatus=2                  " Show the status line all the time
filetype plugin indent on         " Turn on file type detection.
syntax enable                     " Turn on syntax highlighting.

" Define the characters to use for hidden characters
set nolist listchars=tab:>-,trail:.,nbsp:%,eol:$

"------------------------------------------------------------------------------
" ENABLE PLUGINS
"------------------------------------------------------------------------------

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

if empty(system('which ctags'))
  call add(g:pathogen_disabled, 'vim-taglist')
endif

if !has('gui_macvim')
  call add(g:pathogen_disabled, 'vim-peepopen')
endif

call pathogen#infect()

"------------------------------------------------------------------------------
" CONFIGURE COLOR SCHEME
"------------------------------------------------------------------------------

colorscheme topfunky-light
set background=dark

"------------------------------------------------------------------------------
" CONFIGURE PLUGIN OPTIONS
"------------------------------------------------------------------------------

let g:syntastic_check_on_open=1

"------------------------------------------------------------------------------
" SET KEY MAPPINGS
"------------------------------------------------------------------------------

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" NERDTree Mappings
map <C-n><C-n> <Esc>:NERDTreeToggle<CR>
map <C-n><C-h> <Esc>:help NERD_tree.txt<CR>

" Toggle search highlighting
map <Leader>h <Esc>:set hls!<CR>:echo "toggle search highlighting"<CR>

" Toggle paste option
if !has('gui_running')
  function TogglePaste()
    if &paste
      set nopaste
    else
      set paste
    endif
    set paste ?
  endfunction
  map <Leader>p <Esc>:call TogglePaste()<CR>
endif

" Add mappings to remove trailing whitespace
map <Leader>s <Esc>:% s/\s\+$//g<CR>:noh<CR>:echo "removed trailing whitespace"<CR>

" Toggle hidden characters
function ToggleHiddenChars()
  if &list
    set nolist
  else
    set list
  endif
endfunction
map <silent> <Leader>l <Esc>:call ToggleHiddenChars()<CR>

" Toggle line number
function ToggleLineNumber()
  if &number
    set nonumber
  else
    set number
  endif
endfunction
map <silent> <Leader>n <Esc>:call ToggleLineNumber()<CR>

" Toggle ctags plugin
if !empty(system('which ctags'))
   map <silent> <Leader>c <Esc>:TlistToggle<CR>
   let Tlist_WinWidth=50
endif

" Toggle word wrap
function ToggleWordWrap()
  if &wrap
    set nowrap
  else
    set wrap
  endif
endfunction
map <silent> <Leader>w <Esc>:call ToggleWordWrap()<CR>

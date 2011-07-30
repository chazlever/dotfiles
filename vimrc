" Copy or symlink to ~/.vimrc or ~/_vimrc.

" Must come first because it changes other options.
set nocompatible

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

if !has('gui_macvim')
  call add(g:pathogen_disabled, 'vim-peepopen')
endif

silent! call pathogen#runtime_append_all_bundles()


syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

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

set tabstop=3                    " Global tab width.
set shiftwidth=3                 " And again, related.
set expandtab                    " Use spaces instead of tabs
set smarttab
set autoindent

set laststatus=2                  " Show the status line all the time

" Define the characters to use for hidden characters
set list listchars=tab:>-,trail:⋅,nbsp:%,eol:$
set nolist

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Or use vividchalk
colorscheme topfunky-light

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

if !has('gui_running')
  " Toggle paste option
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
map <silent> <Leader>c <Esc>:TlistToggle<CR>
let Tlist_WinWidth=50

" Toggle word wrap
function ToggleWordWrap()
  if &wrap
    set nowrap
  else
    set wrap
  endif
endfunction
map <silent> <Leader>w <Esc>:call ToggleWordWrap()<CR>


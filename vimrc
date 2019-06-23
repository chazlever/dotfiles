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

" Enable mouse support if support available
if has('mouse')
   set mouse=a
endif

"------------------------------------------------------------------------------
" CUSTOM FILETYPES
"------------------------------------------------------------------------------

au! BufRead,BufNewFile *.tex setfiletype tex

"------------------------------------------------------------------------------
" CONFIGURE COLOR SCHEME
"------------------------------------------------------------------------------

colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark

"------------------------------------------------------------------------------
" CONFIGURE PLUGIN OPTIONS
"------------------------------------------------------------------------------

" Configure ALE
let g:ale_linters = {'tex': []}

" Configure vimtex plugin for use with Skim
let g:vimtex_view_method ='skim'
let g:vimtex_view_general_options = '@line @pdf @tex'
let g:vimtex_view_general_options_latexmk = '@line'
let g:vimtex_quickfix_open_on_warning = 0

let g:vimtex_quickfix_method = 'pplatex'
let g:tex_flavor = 'latex'

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

" Toggle search highlighting
map <Leader>h <Esc>:set hls!<CR>:echo "toggle search highlighting"<CR>

" Add mappings to remove trailing whitespace
map <Leader>s <Esc>:% s/\s\+$//g<CR>:noh<CR>:echo "removed trailing whitespace"<CR>

" Slimux Mappings
nnoremap <Leader>sl :SlimuxREPLSendLine<CR>
vnoremap <Leader>ss :SlimuxREPLSendSelection<CR>
nnoremap <leader>sb :SlimuxREPLSendBuffer<CR>

" Toggle taglist plugin
map <silent> <Leader>c <Esc>:TlistToggle<CR>
let Tlist_WinWidth=50

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

" Toggle word wrap
function ToggleWordWrap()
  if &wrap
    set nowrap
  else
    set wrap
  endif
endfunction
map <silent> <Leader>w <Esc>:call ToggleWordWrap()<CR>

" Quicker window movement
" url: https://github.com/thoughtbot/dotfiles/blob/master/vimrc
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"------------------------------------------------------------------------------
" File: $HOME/.gvimrc
" Author: Chaz Lever <https://github.com/chazlever>
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" STANDARD STUFF
"------------------------------------------------------------------------------

set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set background=dark               " Background.
set columns=100                   " Window dimensions.
set showtabline=2                 " Always show the tab bar
set guioptions-=r                 " Don't show right scrollbar

"------------------------------------------------------------------------------
" CONFIGURE COLOR SCHEME
"------------------------------------------------------------------------------

colorscheme vibrantink

"------------------------------------------------------------------------------
" MACVIM SPECIFIC
"------------------------------------------------------------------------------

if has('gui_macvim')
   set guifont=Inconsolata:h20       " Font family and font size.

   " Toggle fullscreen for MacVim
   set fuoptions=maxvert
   function ToggleFullscreen()
      if &fullscreen
         set nofullscreen columns=100 lines=80
      else
         set fullscreen
      endif
   endfunction
   map <silent> <Leader>f <Esc>:call ToggleFullscreen()<CR>
endif

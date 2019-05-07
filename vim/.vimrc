call plug#begin('~/.vim/plugged')

Plug 'jartigag/vim-logbook'

call plug#end()

" `jj` quits Insert mode
:imap jj <Esc>

" `right` and `l` wrap to the beginning of the next line, the same with `left` and `h`:
:set whichwrap+=>,l
:set whichwrap+=<,h

" mouse support
set mouse=a

" don't allow broken words at the end of the line
set linebreak

" set tab = 4 spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4

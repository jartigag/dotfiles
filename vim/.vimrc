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

" Different config for each filetype 
filetype plugin on 
 
" Show trailing spaces 
highlight ExtraWhitespace ctermbg=red guibg=red 
match ExtraWhitespace /\s\+$/ 
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/ 
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/ 
autocmd InsertLeave * match ExtraWhitespace /\s\+$/ 
autocmd BufWinLeave * call clearmatches() 
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red 
 
" Clear trailing spaces on <F2> 
function TrimWhiteSpace() "TODO: apply just on visual selection
  %s/\s*$// 
  '' 
:endfunction 
command! -nargs=0 Tr call TrimWhiteSpace()
 
" HighLight search and map CarrierReturn to remove highlight 
set hlsearch 
map <Space> :noh<CR>

" Fold
set foldmethod=indent 
set foldlevelstart=99 

let $unrol=1
function UnrolMe()
if $unrol==0
    :exe "normal zR"
    let $unrol=1
else
    :exe "normal zM"
    let $unrol=0
endif
endfunction

noremap zA :call UnrolMe()<CR>

set tabpagemax=100

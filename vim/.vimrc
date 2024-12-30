set encoding=utf-8
set clipboard=unnamedplus " sudo apt install vim-gtk3

" `jj` quits Insert mode
:imap jj <Esc>

" `right` and `l` wrap to the beginning of the next line, the same with `left` and `h`:
:set whichwrap+=>,l
:set whichwrap+=<,h

" mouse support
set mouse=a

" don't allow broken words at the end of the line
set linebreak

" set tab = 2 spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2

" Different config for each filetype
filetype plugin on
"
" Show trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Clear trailing spaces on <F2>
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction
command! -nargs=0 Tr call TrimWhiteSpace()

" HighLight search and map CarrierReturn to remove highlight
set hlsearch
map <Space> :noh<CR>

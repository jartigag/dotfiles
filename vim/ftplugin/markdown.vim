setlocal syntax=markdown

" Textwidth for automatic wrap `gq` is formatting operation
setlocal textwidth=149
setlocal formatoptions+=t
setlocal formatoptions-=l

" Highlight where the lines are more than 80 characters wide
setlocal colorcolumn=150
highlight ColorColumn ctermbg=LightGreen

" Tabs to 2 spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2
set autoindent

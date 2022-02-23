source $VIMRUNTIME/defaults.vim
"no visual mode
set mouse-=a
"tab size 2 and space instead tabs
set tabstop=2
:set shiftwidth=2
:set expandtab
"color scheme
:color elflord
" it's vim not vi
set nocompatible

" next function allows you to do completion of words by pressing <Tab>
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

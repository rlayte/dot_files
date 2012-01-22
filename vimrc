filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Forget being compatible with good ol' vi
set nocompatible

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

set showmode
set wildmenu
set hidden
set vb

" Solarized colorscheme
syntax enable
set background=dark
set t_Co=256
colorscheme solarized

set ts=4 sts=4 sw=4 expandtab

" use two space tabs for ruby                                                                                                                                        
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2 et

set autoindent
set smartindent

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
  
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

if has("gui_running")
    set guioptions=egmrt
endif

" Textmate style text indentation
map <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Curly brace fixes
:map [[ ?{<CR>w99[{
:map ][ /}<CR>b99]}
:map ]] j0[[%/{<CR>
:map [] k$][%?}<CR>

" Backspace fix
set backspace=indent,eol,start

" mode switching
imap jj <Esc>
nmap <Space> i

nnoremap : ;
nnoremap ; :


" Toggle buffer
nmap <leader>b :b#<cr>

map <C-H> <C-W>h<C-W>
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>
map <C-L> <C-W>l<C-W>

" SuperTab stuff
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Hide files in NERDTree
let NERDTreeIgnore=['\.pyc', '.*.swp']

" HTML mappings
imap ,/ </<C-X><C-O>

autocmd VimEnter * NERDTree

" close autocomplete scratch buffer
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif 
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Toggle gundo graph
nnoremap <F5> :GundoToggle<CR>

command! RunPythonShell :!ipython % <CR>

au BufRead,BufNewFile *.clj set filetype=clojure

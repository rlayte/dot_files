call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" sparkup
let g:sparkupExecuteMapping='<c-e>'
let g:sparkupNextMapping='<c-n>'

" Forget being compatible with good ol' vi
set nocompatible

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

set showmode
set wildmenu
set number
set hidden
set vb
colorscheme railscasts

set ts=4 sts=4 sw=4 expandtab
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

" Edit/reload vimrc
nmap <silent> ,ev :e $MYVIMRC<cr>
nmap <silent> ,sv :so $MYVIMRC<cr>

" Toggle buffer
nmap <silent> ,b :b#<cr>

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

" Save mappings
nmap <silent> ,w :w<cr>
nmap <silent> ,q :q<cr>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" ------------------------------------------------------------------------------
" NERDTree Settings
" ------------------------------------------------------------------------------
" Hide files in NERDTree
let NERDTreeIgnore=['\.pyc', '.*.swp']

" ------------------------------------------------------------------------------
" HTML mappings
" ------------------------------------------------------------------------------

imap ,/ </<C-X><C-O>

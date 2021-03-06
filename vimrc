execute pathogen#infect()

" use two spaces for indents, and make them actual spaces
set backspace=2
set shiftwidth=2
set tabstop=2
set autoindent
set expandtab

set number
syntax enable
set background=light
colorscheme solarized
set nobackup
filetype indent on

" Keep space around the cursor when scrolling
set scrolloff=8

" change split opening to bottom and right instead of top and left
set splitbelow
set splitright

" remap windowswap to a ctrl-w command
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <C-W>y :call WindowSwap#EasyWindowSwap()<CR>

" ctrlP
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir'] "add extention for line searching

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" simple session saving
set ssop-=options    " do not store global and local values in a session
command SS execute "mksession! ~/vim_session"
command LS execute "source ~/vim_session"

set laststatus=2

set statusline=%f       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator

set statusline+=%#warningmsg#									"syntastic warning
set statusline+=%{SyntasticStatuslineFlag()}	"syntastic flag
set statusline+=%*

set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" default syntastic options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 2 " don't automatically open the loc list

let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_coffeescript_checkers = ['coffeelint']

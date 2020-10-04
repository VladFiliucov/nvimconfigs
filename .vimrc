syntax on
filetype plugin indent on

let mapleader = " "
syntax enable

set nocompatible
set smartindent
set wrap
set ignorecase
set hlsearch
set autoindent
set fileencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set ts=2 sts=2 sw=2 expandtab
set smartcase
set gdefault
set incsearch
set showmatch
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules

"set runtimepath+=~/.vim/ultisnips_rep

set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

" Linting errors indicator
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '>>'

" Change cursor shape based on current mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set list
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:•
set noswapfile
set cursorline
set relativenumber
set matchpairs+=<:>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The Silver Searcher integration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ackprg = 'ag --nogroup --nocolor --column'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easymotion config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <Leader>f <Plug>(easymotion-overwin-f)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scrolling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

"let g:airline_powerline_fonts = 1
"let g:airline_detect_paste=1
"let g:airline_left_sep='>'
"let g:airline_theme='molokai'
"set laststatus=2

"if !exists('g:airline_symbols')
  "let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0 " Allow JSX in normal JS files


" NERD TREE
nnoremap <leader>n :NERDTreeToggle<CR>

let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\~$', '\.db$', 'node_modules', '\.log']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.db

" FZF plugin
set rtp+=/usr/local/opt/fzf
"set rtp+=~/.fzf
nmap <C-b> :Buffers<CR>
nmap <C-p> :Files<CR>
nmap <C-s> :Snippets<CR>
nmap <C-g> :BCommits<CR>
nmap <C-a> :Ag<CR>

"""""""""""""""""""""""""
"""  RSpec 
"""""""""""""""""""""""""

"map <Leader>a :call RunAllSpecs()<CR>
"map <Leader>c :call RunCurrentSpecFile()<CR>

"""""""""""""""""""""""""
""  Mappings
"""""""""""""""""""""""""

map <Leader>s :w <CR>
map <Leader>q :q <CR>
map <F2> i<CR><ESC>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>ga :Git! add %<CR>
nmap <Leader>gvs :Gvsplit<CR>
nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <RIGHT><RIGHT> :cnfile<CR><C-G>
nmap <silent> <LEFT> :sprev<CR>
nmap <silent> <LEFT><LEFT> :cpfile<CR><C-G>
nnoremap <silent> <Leader><UP> :resize +10<CR>
nnoremap <silent> <Leader><DOWN> :resize -10<CR>
nnoremap <silent> <Leader><LEFT> :vertical resize -10<CR>
nnoremap <silent> <Leader><RIGHT> :vertical resize +10<CR>
nmap <leader>gr "*gr


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Free edit mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! FreeEditMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
endfunction

command! FreeEditMode call FreeEditMode()
nmap <C-e> :FreeEditMode<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" RENAME CURRENT FILE
"" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>r :call RenameFile()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" RUN CURRENT SPEC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RunCurrentSpec()
  let filename = expand('%')

  if &filetype == 'javascript.jsx'
    exec ':vs | term yarn test ' . filename
  endif

  if &filetype == 'ruby'
    exec ':vs | term bundle exec rspec ' . filename
  endif
endfunction
map <leader>c :call RunCurrentSpec()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" RUN ALL SPECS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RunAllSpecs()
  if &filetype == 'javascript.jsx'
    exec ':vs | term yarn run test'
  endif

  if &filetype == 'ruby'
    exec ':vs | term bundle exec rspec spec/'
  endif
endfunction
map <leader>a :call RunAllSpecs()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Expands "book = book, author: author" to " let(:book) = { crete(:book, author: author) }"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Lettify()
  :normal! F=wicreate(:
  :normal! A)
  :normal! dd
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! Lettify :call Lettify()
:map <leader>tl :Lettify<cr>

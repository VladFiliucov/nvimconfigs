set runtimepath^=~/.vim runtimepath+=/.vim/after runtimepath+=$VIMCONFIG
let &packpath = &runtimepath
source ~/.vimrc

function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('mhartington/oceanic-next')
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('scrooloose/nerdtree')
  call minpac#add('junegunn/fzf')
  call minpac#add('w0rp/ale')
  call minpac#add('vimwiki/vimwiki')
  call minpac#add('ap/vim-css-color')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('mileszs/ack.vim')
  call minpac#add('SirVer/ultisnips')
  call minpac#add('honza/vim-snippets')
  call minpac#add('VladFiliucov/vim-react-snippets')
  call minpac#add('Quramy/vim-js-pretty-template')
  call minpac#add('jparise/vim-graphql')
  call minpac#add('mattn/emmet-vim')
  call minpac#add('vim-ruby/vim-ruby')
  call minpac#add('fatih/vim-go')
  call minpac#add('HerringtonDarkholme/yats.vim')
  call minpac#add('mhartington/nvim-typescript', {'build': './install.sh'})
  call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
  call minpac#add('Shougo/denite.nvim')
  call minpac#add('prettier/vim-prettier')
  call minpac#add('machakann/vim-highlightedyank')
  call minpac#add('pangloss/vim-javascript')
  call minpac#add('junegunn/goyo.vim')
  call minpac#add('mxw/vim-jsx')
  call minpac#add('easymotion/vim-easymotion')
endfunction

command! PackUpdate call PackInit() | call minpac#update()
command! PackClean call minpac#clean()

if (has("termguicolors"))
 set termguicolors
endif

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-[> <Esc>
  tnoremap <a-h> <c-\><c-n><c-w>h
  tnoremap <a-j> <c-\><c-n><c-w>j
  tnoremap <a-k> <c-\><c-n><c-w>k
  tnoremap <a-l> <c-\><c-n><c-w>l
  nnoremap <a-h> <c-w>h
  nnoremap <a-j> <c-w>j
  nnoremap <a-k> <c-w>k
  nnoremap <a-l> <c-w>l
endif

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete = 1

let g:airline_theme='deus'

" Register tag name associated the filetype
autocmd FileType javascript JsPreTmpl
autocmd FileType javascript.jsx JsPreTmpl
autocmd FileType typescript JsPreTmpl

":set inccommand=split

" Theme
syntax enable
colorscheme OceanicNext

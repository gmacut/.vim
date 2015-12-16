execute pathogen#infect()

set nocompatible

if has("syntax")
  syntax on
endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
  filetype plugin indent on
endif

syntax enable
set background=light
colorscheme solarized

set showmatch
set showcmd
set ignorecase
set smartcase
set hlsearch

" use * to higlight all occurences of the word, without jumping
noremap * *N

set hid

set ru

set mouse=a

set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

set number

set wildmenu
set wildmode=list:longest,full

set ruler       " show the line number on the bar
set more        " use more prompt
set autoread

set noerrorbells
set novisualbell
set t_vb=
set tm=500
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set encoding=utf8

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Copy-paste
" vnoremap <C-c> "+y
" noremap <C-v> "+p
" inoremap <C-v> <C-R>+


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" CTAGS
set tags=tags;/

" CTAGS mappings
map <C-i> <C-]>
map <C-o> <C-T>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Always show the status line
set laststatus=2
set noshowmode

" Airline theme
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1

" NERDTree
let g:NERDTreeDirArrows=0
let g:nerdtree_tabs_open_on_gui_startup=0
" NERDTree mappings
map <F2> :NERDTreeToggle<Enter>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'results:100' " overcome limit imposed by max height

" When F3 is pressed, a numbered list of file names is printed, and the user needs to type a
" single number based on the menu and press enter. The menu disappears after choosing the
" number so it appears only when you need it.
nnoremap <F3> :buffers<CR>:buffer<Space>
nnoremap :bc :Bdelete<CR>

" Easy commenting
" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType fpl              let b:comment_leader = '// '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

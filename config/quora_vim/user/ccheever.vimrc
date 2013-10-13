"Pathogen http://nvie.com/posts/how-i-boosted-my-vim/
set nocompatible
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set textwidth=80
set fo+=t

source $ANS_ROOT/etc/vim/vimrc
"source $ANS_ROOT/etc/vim/scala.vim

"Vim Addon Manager
fun SetupVAM()
    set runtimepath+=$ANS_ROOT/etc/vim/user/kahseng.vim-addons/vim-addon-manager
    "call vam#ActivateAddons(['snipMate', 'vim-addon-async', 'vim-addon-completion', 'vim-addon-json-encoding', 'ensime'], {'auto_install' : 0})
    " (ccheever) Diabling snipMate because it breaks my tab completion
    call vam#ActivateAddons(['vim-addon-async', 'vim-addon-completion', 'vim-addon-json-encoding', 'ensime'], {'auto_install' : 0})
endf
call SetupVAM()
let g:ensime_map_leader = ','
let g:async_implementation = 'native'

" Ctags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
map <F8> :!/usr/bin/ctags -R .<CR>
set pastetoggle=<F2>

let Tlist_Auto_Highlight_tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_update = 1
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Show_One_File = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
set updatetime=1000

"PageUp and PageDown
nnoremap <silent> <PageUp> <C-U><C-U>
vnoremap <silent> <PageUp> <C-U><C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>

nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageDown> <C-D><C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>

"Command-T
"replace default selection to tab
let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<Up>', '<C-Up>', '<']
let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<Down>', '<C-Down>', '>']
let g:CommandTAcceptSelectionMap = '<C-CR>'
let g:CommandTAcceptSelectionSplitMap = '<C-s>'
let g:CommandTAcceptSelectionTabMap = ['<CR>', '<C-t>']
map <F3> :CommandTFlush<cr>

"Needed for using vim in screen
set term=xterm
  
syntax on

set tabstop=4
set shiftwidth=4
set shiftround
"set expandtab
set autoindent
set copyindent
set nowrap
set hidden
set title
set ignorecase
set smartcase
set scrolloff=3

set history=1000
set undolevels=1000
"set smarttab
set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class

set noswapfile "no swap file

" text prompts instead of scrolling windows in macvim
set guioptions+=c

filetype on

autocmd BufRead *.as set filetype=actionscript
autocmd BufRead *.mxml set filetype=mxml
autocmd BufRead *.html set filetype=htmldjango

"vnoremap < <gv
"vnoremap > >gv
"nnoremap < <<
"nnoremap > >>

nnoremap ' `
nnoremap ` '
nnoremap <C-e> <C-e><C-e><C-e>
nnoremap <C-y> <C-y><C-y><C-y>
nnoremap ; :

"let mapleader = "," (keep mapleader as \)

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" Clear search highlighting by doing ,/
nmap <silent> <leader>/ :let @/=""<CR>

" Switch tabs (Gvim)
" Ctrl Left/Right to switch tabs
" Alt Left/Right to move tabs
"nnoremap <C-Left> :tabprevious<CR>
"nnoremap <C-Right> :tabnext<CR>
"nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

"Allow w!! if forgot to sudo
cmap w!! w !sudo tee % >/dev/null
cmap W w

"NERDTree (replaced with Command-T plugin)
"nmap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
"nmap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
"nmap <leader>N :NERDTreeClose<CR>

" Store the bookmarks file
"let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

" Don't display these kinds of files
"let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
"            \ '\.o$', '\.so$', '\.egg$', '^\.git$' ]

"let NERDTreeShowBookmarks=1       " Show the bookmarks table on startup
"let NERDTreeShowFiles=1           " Show hidden files, too
"let NERDTreeShowHidden=1
"let NERDTreeQuitOnOpen=1          " Quit on opening files from the tree
"let NERDTreeHighlightCursorline=1 " Highlight the selected entry in the tree
"let NERDTreeMouseMode=2           " Use a single click to fold/unfold directories
"                                  " and a double click to open files



if has("gui_running")
  colorscheme ir_black
  set lines=200
else
  colorscheme default
endif

let Tlist_Sort_Type = "name"

set nobackup
"set number
set nonumber


:let no_lookupfile_map=1

set ruler
set mousemodel=extend

"autocmd BufEnter * lcd %:p:h

set showmatch
set noerrorbells
set novisualbell

set backup
set backupdir=~/.vim/backups
set directory=~/.vim/tmp

set hlsearch

set incsearch
"set backspace=2
set backspace=indent,eol,start

nmap <C-N><C-N> :set invnumber<CR>
nmap t% :tabedit %<CR>
nmap td :tabclose<CR>

set guioptions-=T

:nmap <C-Left> :bp<CR>
:nmap <C-Right> :bn<CR>
:nmap <S-D-Left> :tabp<CR>
:nmap <S-D-Right> :tabn<CR>

filetype plugin on
filetype indent on

let Grep_Skip_Dirs = '.svn .metadata'
let Grep_Skip_Files = '*~ *,v s.* *.svn* *.swp* *.log*'
let Grep_Xargs_Options = '-0'

:map <D-r> :FuzzyFinderTextMate<CR> 
:map <C-h> :Rfgrep<CR>

" actionscript language
let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'

function! SwapFilesTest(filename)
   if a:filename !~ 'Test.as$'
     let filename = substitute(a:filename,'\v\.as$','Test.as','')
     let filename = substitute(filename, '\vplayer_[^/]+', 'player_test', '')
     return filename
   else
     return a:filename
endfunction

nmap gst :execute ":e " SwapFilesTest(expand('%'))<CR>

set listchars=tab:>-,trail:Â,eol:$
nmap <silent> <leader>s :set nolist!<CR>

set shortmess=atI

set guifont=DejaVu\ Sans\ Mono\ Bold:h12
"set guifont=Monaco:h12

autocmd BufNewFile,BufRead *.rb,*.mxml,*.as,*.vimrc,*.c,*.cc,*.h,*.java,*.py,*.js,*.tpl,*.szl,*.script match Error /\%<2000000v.\%>111v/

highlight ExtraWhitespace ctermbg=darkblue guibg=darkblue   
highlight Search guibg=lightblue
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWritePre *.js normal m`:%s/\s\+$//e ``

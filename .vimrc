set lazyredraw
set smarttab  "Improves tabbing

set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
set incsearch
set hlsearch
set wildignore=*/node_modules/*
set wildmenu
set ttyfast
"set autoindent  "If you're indented, new lines will also be indented
set smartindent  "Automatically indents lines after opening a bracket in programming languages
set number  "Enables line numbering
set showcmd
let loaded_matchparen = 1 " to turn off match parenthesis
"folding settings
set foldmethod=manual   "fold based on indent
set foldnestmax=1      "deepest fold is 10 levels
    " manual – folds must be defined by entering commands (such as zf)
    " indent – groups of lines with the same indent form a fold
    " syntax – folds are defined by syntax highlighting
    " expr – folds are defined by a user-defined expression
    " marker – special characters can be manually or automatically added to your text to flag the start and end of folds
    " diff – used to fold unchanged text when viewing differences (automatically set in diff mode)
set laststatus=2
set statusline=%F
set number relativenumber
map <F5> :set hlsearch!<CR>
nnoremap <tab> <C-W>w


  " Autoinstall
  if empty(glob("~/.vim/autoload/plug.vim"))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    auto VimEnter * PlugInstall
  endif

call plug#begin('~/.vim/plugged')

  " Syntax & coloring
  Plug 'https://github.com/othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'jsx'] }
  Plug 'https://github.com/sheerun/vim-polyglot'
  Plug 'https://github.com/kchmck/vim-coffee-script.git'
  Plug 'https://github.com/lchi/vim-coffee-script.git'

  " GUI and related stuff
  " a new start screen +
  Plug 'mhinz/vim-startify'
  " a statusline +
  Plug 'vim-airline/vim-airline'
  let g:airline_powerline_fonts = 1


"indenter for standalone and embedded JavaScript and TypeScript.
Plug 'jason0x43/vim-js-indent'
"Plug 'https://github.com/ciaranm/detectindent'

" todo in the code
Plug 'https://github.com/Dimercel/todo-vim', { 'on': 'TODOToggle' }
nmap <F6> :TODOToggle<CR>

" Async linting and other tasks
Plug 'https://github.com/w0rp/ale.git'
"Plug 'https://github.com/maralla/validator.vim'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'

Plug 'flowtype/vim-flow', { 'for': ['javascript', 'jsx'] }

" autocomlpete using deoplete +
if !has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'
else
  Plug 'https://github.com/Shougo/neocomplete.vim'
endif

" git support
Plug 'airblade/vim-gitgutter'

" . command after a plugin map
Plug 'https://github.com/tpope/vim-repeat'


"let g:neomake_javascript_jshint_maker = {
"\ 'args': ['--verbose'],
"\ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
"\ }
"let g:neomake_javascript_enabled_makers = ['jshint']






"auto quotes, parens, brackets, etc. +
Plug 'https://github.com/Raimondi/delimitMate'

" a file browser instead nerdtree +
map <F3> :e .<CR>

" nerd commenter +
Plug 'scrooloose/nerdcommenter'
" tagbar (functions, methods etc)
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>


Plug 'szw/vim-ctrlspace'
set hidden
nmap <F4> :CtrlSpace<CR>


" Underlines the word under the cursor +
Plug 'https://github.com/itchyny/vim-cursorword'
 
  " Motions
  " fast search aka vim motion +
  Plug   'easymotion/vim-easymotion'
  " s [two letters] to quickly jump
  Plug 'justinmk/vim-sneak'
  " http://vimawesome.com/plugin/quick-scope#character-motions +
  Plug 'https://github.com/unblevable/quick-scope'

  " plugin allows toggling bookmarks per line. A quickfix window gives access to
  " all bookmarks. Annotations can be added as well. These are special bookmarks
  " with a comment attached. +
  Plug 'MattesGroeger/vim-bookmarks'
  "Add/remove bookmark at current line	mm	:BookmarkToggle
  "Add/edit/remove annotation at current line	mi	:BookmarkAnnotate <TEXT>
  "Jump to next bookmark in buffer	mn	:BookmarkNext
  "Jump to previous bookmark in buffer	mp	:BookmarkPrev
  "Show all bookmarks (toggle)	ma	:BookmarkShowAll
  "Clear bookmarks in current buffer only	mc	:BookmarkClear
  "Clear bookmarks in all buffers	mx	:BookmarkClearAll
  "Move up bookmark at current line	mkk	:BookmarkMoveUp
  "Move down bookmark at current line	mjj	:BookmarkMoveDown
  "Save all bookmarks to a file		:BookmarkSave <FILE_PATH>
  "Load bookmarks from a file		:BookmarkLoad <FILE_PATH>

" Tab for autocomplete +
Plug 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = "<c-n>"
"Plug 'ajh17/VimCompletesMe.git'

" It has "file/include" source and extends tag sources in neocomplete/deoplete. ??
Plug 'https://github.com/Shougo/neoinclude.vim'

  " snippets support
  " https://www.gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
  "Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#functions.javascript = [
        \ 'tern#Complete',
        \ 'jspc#omni'
        \]
  set completeopt=longest,menuone,preview
  let g:deoplete#sources = {}
  let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
  let g:tern#command = ['tern']
  let g:tern#arguments = ['--persistent']


" to enable opening a file in a given line. vim index.html:20
Plug 'bogado/file-line'

  " Selections (visual mode)
  "Quickly identyfying and selecting pairs of brackets or htmx /xml tags
  Plug 'https://github.com/gorkunov/smartpairs.vim.git'
  " With Wildfire you can quickly select the closest text object  +
  Plug 'https://github.com/gcmt/wildfire.vim'
  " Press <ENTER> in normal mode to select the closest text object.

"A thumbnail-style buffer selector for Vim +
Plug 'https://github.com/itchyny/thumbnail.vim'
nmap <F2> :Thumbnail<CR>

" some teretically useful keys remappings ???
"Plug 'https://github.com/tpope/vim-unimpaired'

" Emmet style for html? ??
Plug 'mattn/emmet-vim'

  "Format code with one button press.
  Plug 'Chiel92/vim-autoformat'
  noremap <F1> :Autoformat<CR>
  "let g:autoformat_verbosemode=1
  "let g:autoformat_retab = 0
  "let g:autoformat_autoindent = 0
  let g:formatters_javascript_jsx = ['pyjsbeautify_javascript']
  let g:formatters_jsx = ['pyjsbeautify_javascript']
  " use :NextFormatter to find a right one for current filetype
  "let g:formatdef_fmt_custom_xml = '"tidy -xml -q --show-errors 0 --show-warnings 0 --indent-attributes 1"'
  "let g:formatters_xml = ['fmt_custom_xml']


Plug 'NLKNguyen/papercolor-theme'


" Initialize Plugin system
call plug#end()

syntax enable
set t_Co=256
colorscheme PaperColor


let g:airline#extensions#tabline#enabled = 1

" -------- character motions
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" -------------------

" Send more characters to the terminal at once.
" Makes things smoother, will probably be enabled by my terminal anyway.

hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey

let g:deoplete#enable_at_startup = 1
set nobackup
set noswapfile
set ruler






" ### Tab controls
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Up> :tabnew<CR>
nnoremap <silent> <C-Down> :tabclose<CR>
silent! helptags ALL
nnoremap QQ :q!<CR>
filetype plugin indent on
nnoremap <leader>b :ls<cr>:b<space>


" HJKL craziness
nnoremap H ^
nnoremap L g_
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
inoremap <expr> <tab> ((pumvisible())?("\<Cr>"):("<Cr>"))
nnoremap J :tabprev<CR>
nnoremap K :tabnext<CR>


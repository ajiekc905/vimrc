set lazyredraw
set smarttab  "Improves tabbing
set mouse=a
set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
set incsearch
set hlsearch
set path+=**
set wildignore=*/node_modules/*
set wildmenu
set smartindent
set number  "Enables line numbering
"set showcmd
let loaded_matchparen = 1 " to turn off match parenthesis
set foldmethod=manual   "fold based on indent
set foldnestmax=1      "deepest fold is 10 levels
set laststatus=2
set number relativenumber
set backspace=indent,eol,start
let g:netrw_list_hide= netrw_gitignore#Hide()" Hide files listed in gitignore
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
set fillchars=vert:│                  " Vertical sep between windows (unicode)
set textwidth=80
" the line will be right after column 80, &tw+3
set colorcolumn=+3


"let g:netrw_liststyle = 3 " filetree mode for netrw
map <F5> :set hlsearch!<CR>
nnoremap <tab> <C-W>w
"set wildmode=list:longest 
set guifont=Source\ Code\ Pro\ Light:h18 " font for Macvim
" use gui colors instead term ones ?? 
" https://www.reddit.com/r/vim/comments/2ozwe4/24_bit_vim_in_osx_iterm2_a_reality/     ????
" The "^[" is a single character. You enter it by pressing Ctrl+v and then ESC.
" https://www.linuxquestions.org/questions/slackware-14/tip-24-bit-true-color-terminal-tmux-vim-4175582631/





  " Autoinstall
  if empty(glob("~/.vim/autoload/plug.vim"))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    auto VimEnter * PlugInstall
  endif

call plug#begin('~/.vim/plugged')

  " Syntax & coloring
  Plug 'https://github.com/othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'jsx'] }
  Plug 'https://github.com/sheerun/vim-polyglot'
  "Plug 'https://github.com/kchmck/vim-coffee-script.git'
  "Plug 'https://github.com/lchi/vim-coffee-script.git'

	"Plug 'bigfish/vim-js-context-coloring', { 'do': 'npm install --update' }" Context coloring (functions / variables

" Rainbow parenthesis. Need some config to work
  Plug 'luochen1990/rainbow'
  let g:rainbow_active = 1
  " GUI and related stuff
  " statusline haks
  set statusline=
  set statusline+=%#error#
  set statusline+=%m                                  "modified
  set statusline+=%r                                  "read only
  set statusline+=%*
  set statusline+=[%n]                                  "buffernr
  "display a warning if fileformat isnt unix
  set statusline+=%#warningmsg#
  set statusline+=%{&ff!='unix'?'['.&ff.']':''}
  set statusline+=%*

  "display a warning if file encoding isnt utf-8
  set statusline+=%#warningmsg#
  set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
  set statusline+=%*

  set statusline+=%t
  set statusline+=:%l
  
  set statusline+=%=\ 
  set statusline+=%{fugitive#statusline()}
  set statusline+=c:%c\                            "Colnr
  set statusline+=%y

" cursor color mode
" mode aware cursors gui only https://github.com/blaenk/dots/blob/9843177fa6155e843eb9e84225f458cd0205c969/vim/vimrc.ln#L49-L64
  set gcr=a:block
  set gcr+=o:hor50-Cursor
  set gcr+=n:Cursor
  set gcr+=i-ci-sm:InsertCursor
  set gcr+=r-cr:ReplaceCursor-hor20
  set gcr+=c:CommandCursor
  set gcr+=v-ve:VisualCursor
  set gcr+=a:blinkon0

" " the same cursor shape in nvim and vim under urxvt, st, xterm, gnome-terminal`
" "http://ass.kameli.org/cursor_tricks.html
if exists('$ITERM_SESSION_ID') && !exists('$TMUX')
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
else
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
end
"" http://vim.wikia.com/wiki/Configuring_the_cursor
"if &term =~ "xterm\\|rxvt"
  "" use an orange cursor in insert mode
  "let &t_SI = "\<Esc>]12;orange\x7"
  "" use a red cursor otherwise
  "let &t_EI = "\<Esc>]12;red\x7"
  "silent !echo -ne "\033]12;red\007"
  "" reset cursor when vim exits
  "autocmd VimLeave * silent !echo -ne "\033]112\007"
  "" use \003]12;gray\007 for gnome-terminal
"endif


" makes it easier to find and replace text through multiple files. It's inspired by fancy IDEs, like IntelliJ and Eclipse, that provide cozy tools for such tasks.
"Plug 'brooth/far.vim'
" coverage indication for wallaby test framework
"Plug 'ruanyl/coverage.vim'

" interactive programmers calculator :Codi  ; Codi!! [filetype] toggles Codi for the current buffer
"Plug 'metakirby5/codi.vim'
"indenter for standalone and embedded JavaScript and TypeScript.
" Plug 'jason0x43/vim-js-indent'

" todo in the code
Plug 'https://github.com/Dimercel/todo-vim', { 'on': 'TODOToggle' }
nmap <F6> :TODOToggle<CR>

" auto sets project folder +
Plug 'https://github.com/airblade/vim-rooter'

" auto generating jsdoc comments
" Move cursor on function keyword line.
" Type :JsDoc to insert JSDoc.
" Insert JSDoc above the function keyword line.
Plug 'heavenshell/vim-jsdoc'



" Async linting and other tasks
Plug 'https://github.com/w0rp/ale.git'
"Plug 'https://github.com/maralla/validator.vim'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_linters = {
\   'javascript': ['standard'],
\}

"Plug 'flowtype/vim-flow', { 'for': ['javascript', 'jsx'] }
Plug '1995eaton/vim-better-javascript-completion'
Plug 'honza/vim-snippets'
" autocomlpete using deoplete +
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_ignore_case=1
  let g:deoplete#enable_smart_case=1
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
else
  Plug 'https://github.com/Shougo/neocomplete.vim'
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  "let g:neocomplete#sources#omni#functions.javascript = [
        "\   'jspc#omni',
        "\   'tern#Complete',
        "\ ]
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
endif
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
  " Enable snipMate compatibility feature.
 let g:neosnippet#enable_snipmate_compatibility = 1
" " Tell Neosnippet about the other snippets
 let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" deoplete.vim
set omnifunc=syntaxcomplete#Complete
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
let g:deoplete#enable_ignore_case = 'ignorecase'
" https://github.com/Shougo/neocomplete.vim/blob/master/autoload/neocomplete/sources/omni.vim
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.html = '<[^>]*'
let g:deoplete#omni_patterns.xml  = '<[^>]*'
let g:deoplete#omni_patterns.md   = '<[^>]*'
let g:deoplete#omni_patterns.css   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni_patterns.scss   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni_patterns.sass   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
let g:deoplete#omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:deoplete#omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:deoplete#omni_patterns.go = '[^.[:digit:] *\t]\.\w*'
let g:deoplete#omni_patterns.ruby = ['[^. *\t]\.\w*', '\h\w*::']
" let g:deoplete#omni_patterns.python = '[^. \t]\.\w*'
let g:deoplete#omni_patterns.python = ['[^. *\t]\.\h\w*\','\h\w*::']
let g:deoplete#omni_patterns.python3 = ['[^. *\t]\.\h\w*\','\h\w*::']
"autocmd CmdwinEnter * let b:deoplete_sources = ['buffer']

let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'neosnippet', 'ternjs']



" It has "file/include" source and extends tag sources in neocomplete/deoplete. ??
Plug 'https://github.com/Shougo/neoinclude.vim'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

  " snippets support
  " https://www.gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/
  " Plug 'SirVer/ultisnips'
  " let g:deoplete#omni#functions = {}
  " let g:deoplete#omni#functions.javascript = [
  "       \ 'tern#Complete',
  "       \ 'jspc#omni'
  "       \]
  " set completeopt=longest,menuone,preview
  " let g:deoplete#sources = {}
  " let g:deoplete#sources['javascript.jsx'] = ['file', 'neosnippet', 'ternjs']
  " let g:tern#command = ['tern']
  " let g:tern#arguments = ['--persistent']





" git support
Plug 'airblade/vim-gitgutter'
nnoremap <!> :GitGutterLineHighlightsToggle
" git interaction tool
Plug 'tpope/vim-fugitive'
" async git support
Plug 'https://github.com/lambdalisue/gina.vim'


" . command after a plugin map +
Plug 'https://github.com/tpope/vim-repeat'
"auto quotes, parens, brackets, etc. +
Plug 'https://github.com/Raimondi/delimitMate'

" a file browser instead nerdtree +
map <F3> :e .<CR>

" nerd commenter +
Plug 'scrooloose/nerdcommenter'
"vim-commentary: gc is an operator to toggle comments; gcc linewise
Plug 'tpope/vim-commentary'
" gc to comment out the target of a motion (for example, gcap to comment out a paragraph), 
" gc in visual mode to comment out the selection, 
" gc in operator pending mode to target a comment


" tagbar (functions, methods etc)
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>


Plug 'szw/vim-ctrlspace'
set hidden
nmap <F4> :CtrlSpace<CR>

"a file finder with fuzzy alg
Plug 'ctrlpvim/ctrlp.vim'

  " Underlines the word under the cursor +
  Plug 'https://github.com/itchyny/vim-cursorword'
 
  " Motions
  " fast search aka vim motion +
  Plug   'easymotion/vim-easymotion'
  " s [two letters] to quickly jump
  Plug 'justinmk/vim-sneak'
  " http://vimawesome.com/plugin/quick-scope#character-motions +
  Plug 'https://github.com/unblevable/quick-scope'

  " plugin allows toggling bookmarks per line. +
  Plug 'MattesGroeger/vim-bookmarks'
  " mm	:BookmarkToggle
  "	mi	:BookmarkAnnotate <TEXT>
  "	mn	:BookmarkNext
  "	mp	:BookmarkPrev
  "	ma	:BookmarkShowAll
  "	mc	:BookmarkClear
  "	mx	:BookmarkClearAll
  "	mkk	:BookmarkMoveUp
  "	mjj	:BookmarkMoveDown
  "	 	  :BookmarkSave <FILE_PATH>
  "		  :BookmarkLoad <FILE_PATH>

" Tab for autocomplete +
 Plug 'ervandew/supertab'
     let g:SuperTabDefaultCompletionType = "<c-n>"



" to enable opening a file in a given line. vim index.html:20
 Plug 'bogado/file-line'

  " Selections (visual mode)
  "Quickly selecting pairs of brackets or htmx /xml tags
  " vv as usual keybinding
" vi* -> viv
" va* -> vav
" ci* -> civ
" ca* -> cav
" di* -> div
" da* -> dav
" yi* -> yiv
" ya* -> yav
" Where * is in <, >, ", ', `, (, ), [, ], {, } or t as tag
  " Plug 'https://github.com/gorkunov/smartpairs.vim.git'
  " quickly select the closest text object  +
  " Plug 'https://github.com/gcmt/wildfire.vim'
  " Press <ENTER> in normal mode to select the closest text object.

" indented lines as a text object
Plug 'michaeljsmith/vim-indent-object'


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

" Emmet style for html? ??
Plug 'mattn/emmet-vim'

" color schemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'https://github.com/morhetz/gruvbox'

" Initialize Plugin system
call plug#end()

syntax enable
" colorscheme PaperColor
colorscheme gruvbox

let g:gruvbox_contrast_light='soft'
"Possible values are soft, medium and hard.


" This is what sets vim to use 24-bit colors. It will also work for any version of neovim
" newer than 0.1.4.

if has('nvim')
 set termguicolors
endif



let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'js': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'sh': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \   }
    \}

let g:deoplete#enable_at_startup = 1
set nobackup
set noswapfile
"set ruler
" ### Tab controls
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Up> :tabnew<CR>
nnoremap <silent> <C-Down> :tabclose<CR>
silent! helptags ALL
nnoremap QQ :q!<CR>
filetype plugin indent on


" HJKL craziness
nnoremap H ^
nnoremap L g_
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
inoremap <expr> <tab> ((pumvisible())?("\<Cr>"):("<Cr>"))
nnoremap J :tabprev<CR>
nnoremap K :tabnext<CR>


inoremap <DOWN><DOWN> <ESC>
imap <UP><UP> <ESC>
nmap я q
nmap ЯЯ :q!
nmap шя wq
nmap и i
nmap п p
nmap в v

" source $MYVIMRC reloads the saved $MYVIMRC
:nmap <Leader>s :source $MYVIMRC

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
:nmap <Leader>v :e $MYVIMRC






hi InsertCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=37  guibg=#2aa198
hi VisualCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=125 guibg=#d33682
hi ReplaceCursor ctermfg=15 guifg=#fdf6e3 ctermbg=65  guibg=#dc322f
hi CommandCursor ctermfg=15 guifg=#fdf6e3 ctermbg=166 guibg=#cb4b16

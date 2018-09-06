" MAIN CUSTOMIZATION FILE

" Enable loading filetype and indentation plugins
filetype plugin on
filetype indent on

" Turn syntax highlighting on
syntax on

"
" GLOBAL SETTINGS
"

" show line number
set number

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Allow backspacing over everything
set backspace=indent,eol,start

" Insert mode completion options
set completeopt=menu,longest,preview

" Use UTF-8 as the default buffer encoding
set enc=utf-8
set ambiwidth=double
set fencs=utf-8,gbk,gb2312


" Remember up to 100 'colon' commmands and search patterns
set history=100

" Enable incremental search
set incsearch

" Always show status line, even for one window
set laststatus=2

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

" Don't highlight results of a search
 set hlsearch

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Use F10 to toggle 'paste' mode
set pastetoggle=<F10>

" Show line, column number, and relative position within a file in the status line
set ruler

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Use 4 spaces for (auto)indent
set shiftwidth=4

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Don't request terminal version string (for xterm)
set t_RV=

" Use 4 spaces for <Tab> and :retab
set tabstop=4

" Write swap file to disk after every 50 characters
set updatecount=50

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.viminfo

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Avoid loading MatchParen plugin
let loaded_matchparen = 1

" netRW: Open files in a split window
let g:netrw_browse_split = 1

" hybird color scheme configs
set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

set colorcolumn=121
set cursorline

"
" MAPPINGS
"

" switch to upper/lower window quickly
map <C-J> <C-W>j
map <C-K> <C-W>k
" use CTRL-F for omni completion
imap <C-F> 
" map ,f to display all lines with keyword under cursor and ask which one to
" jump to
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" use <F6> to toggle line numbers
nmap <silent> <F6> :set number!<CR>
" open filename under cursor in a new window (use current file's working
" directory)
nmap gf :new %:p:h/<cfile><CR>
" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" map cc cx comlents //
map cc <Leader>cl
map cx <Leader>cu

" Generic highlight changes
" highlight Comment cterm=none ctermfg=Gray
" highlight IncSearch cterm=none ctermfg=Black ctermbg=DarkYellow
" highlight Search cterm=none ctermfg=White ctermbg=4
" highlight String cterm=none ctermfg=DarkGreen
" highlight treeDir cterm=none ctermfg=Cyan
" highlight treeUp cterm=none ctermfg=DarkYellow
" highlight treeCWD cterm=none ctermfg=DarkYellow
" highlight netrwDir cterm=none ctermfg=Cyan

map fe :set fileencoding<CR>

set list
set lcs=tab:>-,trail:-

" del space
nmap <silent> <F11> :%s/\s\+$//g<CR>

" PHP syntax check
function! PHP_CheckSyntax()
    setlocal makeprg=php\ -l\ -n\ -d\ html_errors=off
    setlocal shellpipe=>
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    make %
endfunction

" Perform :PHP_CheckSyntax()
map <F5> :call PHP_CheckSyntax()<CR><CR>

" use space instead of tab
set expandtab

:map 11 :tabnext 1<CR>
:map 22 :tabnext 2<CR>
:map 33 :tabnext 3<CR>
:map 44 :tabnext 4<CR>
:map 55 :tabnext 5<CR>
:map 66 :tabnext 6<CR>
:map 77 :tabnext 7<CR>
:map 88 :tabnext 8<CR>

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'mhinz/vim-signify'
Plug 'terryma/vim-expand-region'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'itchyny/calendar.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/taglist.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Konfekt/FastFold'
Plug 'w0rp/ale'
call plug#end()

" vim-airline/vim-airline configs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1

" pangloss/vim-javascript configs
let g:javascript_plugin_jsdoc = 1
"set foldmethod=syntax

" mhinz/vim-signify configs
let g:signify_vcs_list = [ 'git', 'svn' ]
highlight SignifySignAdd    cterm=bold ctermbg=0  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=0  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=0  ctermfg=227

" junegunn/fzf configs
let g:fzf_action = {
  \ 'enter': 'tab split',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
map fzf :FZF<CR>
map FZF :FZF<CR>

" itchyny/calendar.vim configs
map ca :Calendar<cr>

" scrooloose/nerdtree
let NERDTreeWinSize=35
nmap <silent> <F7> :NERDTreeToggle<CR>

" vim-scripts/taglist.vim configs
map <silent> <F8> :TlistToogle<CR>

" Konfekt/FastFold configs
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1

" scrooloose/nerdcommenter configs
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 0
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 0
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 0
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" w0rp/ale configs
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
highlight clear ALEErrorSign
highlight clear ALEWarningSign


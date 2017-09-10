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
" set encoding=cp936
" set fileencodings=ucs-bom,utf-8,cp936
" set fileencoding=chinese
" set fileencodings=ucs-bom,utf-8,chinese
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
"set buftype=''
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

" Fix my <Backspace> key (in Mac OS X Terminal)
" set t_kb=
" fixdel

" Avoid loading MatchParen plugin
let loaded_matchparen = 1

" netRW: Open files in a split window
let g:netrw_browse_split = 1

"
" MAPPINGS
"

" save changes
map ,s :w<CR>
" exit vim without saving any changes
map ,q :q!<CR>
" exit vim saving changes
map ,w :x<CR>
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
" page down with <Space>
"nmap <Space> <PageDown>
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
function! PHP_comments()
    :s/^/\/\//g
endfunction
map cc :call PHP_comments()<CR>

function! PHP_remove_comments()
    :s/^\/\///g
endfunction
map cx :call PHP_remove_comments()<CR>

map ca :Calendar<cr>

" Generic highlight changes
highlight Comment cterm=none ctermfg=Gray
highlight IncSearch cterm=none ctermfg=Black ctermbg=DarkYellow
highlight Search cterm=none ctermfg=White ctermbg=4
highlight String cterm=none ctermfg=DarkGreen
highlight treeDir cterm=none ctermfg=Cyan
highlight treeUp cterm=none ctermfg=DarkYellow
highlight treeCWD cterm=none ctermfg=DarkYellow
highlight netrwDir cterm=none ctermfg=Cyan

" NERDTree configuration
let NERDTreeWinSize=35
nmap <silent> <F7> :NERDTreeToggle<CR>

map fe :set fileencoding<CR>

if has("autocmd")
    autocmd FileType python set complete+=k/home/shirui/.vim/pydiction-0.5/pydiction isk+=.,(
endif

" map <F12> to toggle NERDTree window
nmap <silent> <F12> :set list!<CR>
set list
set lcs=tab:>-,trail:-

"" del space
" map ds delete space
nmap <silent> <F11> :%s/\s\+$//g<CR>
"map  ds v:%s/\s\+$//g<CR>
"vmap ds  :%s/\s\+$//g<CR>

" PHP syntax check
function! PHP_CheckSyntax()
	setlocal makeprg=/usr/local/bin/php\ -l\ -n\ -d\ html_errors=off
	setlocal shellpipe=>
	" Use error format for parsing PHP error output
	setlocal errorformat=%m\ in\ %f\ on\ line\ %l
	make %
endfunction
" Perform :PHP_CheckSyntax()
map <F5> :call PHP_CheckSyntax()<CR><CR>

" taglist
map <silent> <F8> :TlistToogle<CR>

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
call plug#end()

" vim-airline/vim-airline configs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1

" pangloss/vim-javascript configs
let g:javascript_plugin_jsdoc = 1
set foldmethod=syntax

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

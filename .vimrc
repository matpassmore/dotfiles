" ============================================================================
" LOAD PLUGINS
" ============================================================================

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wincent/terminus'

Plug 'chriskempson/base16-vim'
" Plug 'blueyed/vim-diminactive'
Plug 'sheerun/vim-polyglot'
Plug 'adelarsq/vim-matchit'
" Plug 'vimwiki/vimwiki'
Plug 'moll/vim-bbye'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'niftylettuce/vim-jinja'
Plug 'jiangmiao/auto-pairs'
" Plug 'michal-h21/vim-zettel'
Plug 'SidOfc/mkdx'
Plug 'reedes/vim-pencil'
" Plug '2072/PHP-Indenting-for-VIm'
" Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'dense-analysis/ale'
" Plug 'itchyny/lightline.vim'

" Initialize plugin system
call plug#end()


" ============================================================================
" BASIC SETTINGS
" ============================================================================

let mapleader="\<Space>"

" Allow motions and back-spacing over line-endings etc
set backspace=indent,eol,start
set whichwrap=h,l,b,<,>,~,[,]

" UTF encoding
set encoding=utf-8
set fileencoding=utf-8

" Netrw config
let g:netrw_preview   = 1
let g:netrw_banner=0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
autocmd FileType netrw set nolist

" Allow mouse scrolling in iTerm2
set mouse=a

" Hide buffers with unsaved changes without being prompted
set hidden

" Always show status line
set laststatus=2

" Ignore annoying swapfile messages
set shortmess+=A

" Disable swap file creation
set noswapfile

" File-read message overwrites previous
set shortmess+=O

" Truncate non-file messages in middle
set shortmess+=T

" Don't echo '[w]'/'[written]' when writing
set shortmess+=W

" Overwrite file-written messages
set shortmess+=o

" Truncate file messages at start
set shortmess+=t

" Try to reuse windows/tabs when switching buffers
set switchbuf=usetab

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undo

" Set filetypes for appropriate syntax highlighting et al
au BufRead,BufNewFile *.md,*.txt,*.TXT set filetype=markdown
au BufRead,BufNewFile *.njk,*.nunjucks,*.nunjuck set filetype=jinja.html
au BufRead,BufNewFile *.php set ft=php.html
au BufRead,BufNewFile *.twig set ft=twig.html
au BufRead,BufNewFile *.blade.php set ft=blade.html

" Open splits to the right or below; more natural than the default
set splitright
set splitbelow

" Show file options above the command line
set wildmenu

" Don't offer to open certain files
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd

" Interpret numbers with leading zeroes as decimal, not octal
set nrformats=

" Auto-format comments
set formatoptions+=roq

" Start scrolling slightly before the cursor reaches an edge
set scrolloff=3
set sidescrolloff=5

" Scroll sideways a character at a time, rather than a screen at a time
set sidescroll=1

" Don't redraw the screen unless we need to
set lazyredraw

" Underscores denote words
set iskeyword-=_

" Show current line and column position in file
set ruler

" Show file title in terminal tab
set title

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Display line numbers
" set number
set numberwidth=6

" ----------------------------------------------------------------------------
" Tabs, indentation and lines
" ----------------------------------------------------------------------------
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType blade setlocal ts=2 sts=2 sw=2 expandtab

" Round indent to nearest multiple of 4
set shiftround

" No line-wrapping
set nowrap

" No extra spaces when joining lines
set nojoinspaces

" ----------------------------------------------------------------------------
" Visuals
" ----------------------------------------------------------------------------
set t_Co=256

set background=light

"Use Base 16 colour scheme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

if has('gui_running')
 " set background=light
 set guifont=IBMPlexMono:h17
 set linespace=14

 " remove right scroll bar
 set go-=r

 " remove left scroll bar
 set go-=L
endif

" Colour the 73rd column so that we don't type over our limit
if exists("+colorcolumn")
    " set colorcolumn=+1
endif

" Italicised comments and attributes
highlight Comment cterm=italic
highlight htmlArg cterm=italic

" Force transparent background for line-numbers' columns
highlight LineNr term=bold cterm=NONE ctermfg=08 ctermbg=NONE gui=NONE guifg=#4e4e4e guibg=NONE
highlight SignColumn term=bold cterm=NONE ctermfg=08 ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight StatusLine ctermbg=NONE guibg=NONE

" Fake a custom left padding for each window.
highlight foldcolumn ctermbg=NONE guibg=NONE
set foldcolumn=3

" Style splits
highlight VertSplit guibg=NONE guifg=Orange ctermbg=NONE ctermfg=6

set cursorline

" ----------------------------------------------------------------------------
" Search
" ----------------------------------------------------------------------------

" Don’t keep results highlighted after searching
set nohlsearch

" Just highlight as we type
set incsearch

" Ignore case when searching
set ignorecase

" Except if we input a capital letter
set smartcase


" ============================================================================
" MAPPINGS
" ============================================================================

" Make it easy to edit the Vimrc file
nmap <leader>ev :edit ~/.vimrc<cr>
nmap <Leader>es :e ~/.vim/snippets/

" Open netrw
nmap - :Explore<CR>

" Find-in-project search
nnoremap <Leader>a :Rg<space>

" Move lines up or down
" Symbols correspond to OSx <A-j> and <A-k>
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" New note
nnoremap <Leader>no :e new <bar> se ft=markdown <bar> :WP<CR>

" Tab through buffer files
nnoremap <Leader>b :b<Space>

" Source .vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" 'jk' to throw you into normal mode from insert mode
inoremap jk <esc>

" Make ; do the same thing as : for one less key press
nnoremap ; :

" Disable arrow keys (hardcore)
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>

" Faster window navigation for splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Faster cycling through buffers
nnoremap <tab> :bnext<CR>
nnoremap <s-tab> :bprevious<CR>
nnoremap <Leader>ba :vertical 2ba<CR>
nnoremap <Leader>bs :2ba<CR>

nnoremap <leader>c :silent! !ctags -R<cr>:redraw!<cr>
nnoremap <Leader>w :w<CR>
nmap <Leader><Leader> V
nnoremap <BS> gg

" Make `Y` behave like `C` and `D`
nnoremap Y y$

" Make `n`/`N` bring next search result to middle line
nnoremap n nzz
nnoremap N Nzz

" `vv` to highlight just the text (i.e. no indents) in a line
nnoremap vv ^vg_

" `G` skips to bottom of file and places line in middle of screen
nnoremap G :norm! Gzz<CR>

" Switch to previous window
nnoremap <leader>` <C-w><C-p>

" Copying and pasting to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P


" ============================================================================
" FUNCTIONS & COMMANDS
" ============================================================================

" ----------------------------------------------------------------------------
" Automatically source the Vimrc file on save.
" ----------------------------------------------------------------------------
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

" ----------------------------------------------------------------------------
" Force cursor onto new line in Git commit messages after 72 characters
" ----------------------------------------------------------------------------
autocmd FileType gitcommit set textwidth=72

" ----------------------------------------------------------------------------
" vp doesn't replace paste buffer
" ----------------------------------------------------------------------------
function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction
function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" ----------------------------------------------------------------------------
" Search for selected text, forwards or backwards.
" ----------------------------------------------------------------------------
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" ----------------------------------------------------------------------------
" Word Processor Mode
" ----------------------------------------------------------------------------
augroup word_processor_mode
    autocmd!

    function! WordProcessorMode()
        setlocal formatoptions=t1
        map j gj
        map k gk
        setlocal smartindent
        " setlocal spell spelllang=en_uk
        setlocal noexpandtab
        setlocal wrap
        setlocal linebreak
        Goyo 80
    endfunction

    com! WP call WordProcessorMode()
augroup END

" ----------------------------------------------------------------------------
" Prevent comment chars been added on new line creation
" ----------------------------------------------------------------------------
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" ============================================================================
" PLUGINS
" ============================================================================

" ----------------------------------------------------------------------------
" FZF
" ----------------------------------------------------------------------------
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>l :Buffers<CR>

" Enable passing of arguments to ripgrep
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --sortr=modified '.shellescape(<q-args>), 1,
    \   {'options': '--layout=reverse --delimiter : --nth 4..'}, <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {
    \ 'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)

" ----------------------------------------------------------------------------
" Emmet
" ----------------------------------------------------------------------------
let g:user_emmet_leader_key='<C-e>'

" ----------------------------------------------------------------------------
" UltiSnips
" ----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger = "<nop>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

if exists('&pythonthreedll')
  set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/Current/Python
endif

" ----------------------------------------------------------------------------
" Vimwiki
" ----------------------------------------------------------------------------
" let g:vimwiki_list = [{'path': '~/Dropbox/Notes/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
nmap <Leader>d <Plug>VimwikiToggleListItem

" ----------------------------------------------------------------------------
" Vim-zettel
" ----------------------------------------------------------------------------
let g:zettel_format = "%Y%m%d%H%M"
let g:zettel_link_format="[[%link]]"
let g:zettel_fzf_command = "rg --column --line-number --smart-case --no-heading --color=always --sortr=modified"
" let g:zettel_options = [{"template" :  "~/Dropbox/zettelkasten/template.tpl", "disable_front_matter": 1}]
let g:zettel_fzf_options = ['--reverse']
nnoremap <leader>zn :ZettelNew<space>
nnoremap <leader>za :ZettelOpen<CR>

" ----------------------------------------------------------------------------
" MKDX
" ----------------------------------------------------------------------------
let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'enter': { 'shift': 1 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                        \ 'fold': { 'enable': 1 } }

fun! s:MkdxGoToHeader(header)
    " given a line: '  84: # Header'
    " this will match the number 84 and move the cursor to the start of that line
    call cursor(str2nr(get(matchlist(a:header, ' *\([0-9]\+\)'), 1, '')), 1)
endfun

fun! s:MkdxFormatHeader(key, val)
    let text = get(a:val, 'text', '')
    let lnum = get(a:val, 'lnum', '')

    " if the text is empty or no lnum is present, return the empty string
    if (empty(text) || empty(lnum)) | return text | endif

    " We can't jump to it if we dont know the line number so that must be present in the outpt line.
    " We also add extra padding up to 4 digits, so I hope your markdown files don't grow beyond 99.9k lines ;)
    return repeat(' ', 4 - strlen(lnum)) . lnum . ': ' . text
endfun

fun! s:MkdxFzfQuickfixHeaders()
    " passing 0 to mkdx#QuickfixHeaders causes it to return the list instead of opening the quickfix list
    " this allows you to create a 'source' for fzf.
    " first we map each item (formatted for quickfix use) using the function MkdxFormatHeader()
    " then, we strip out any remaining empty headers.
    let headers = filter(map(mkdx#QuickfixHeaders(0), function('<SID>MkdxFormatHeader')), 'v:val != ""')

    " run the fzf function with the formatted data and as a 'sink' (action to execute on selected entry)
    " supply the MkdxGoToHeader() function which will parse the line, extract the line number and move the cursor to it.
    call fzf#run(fzf#wrap({
      \ 'source': headers,
      \ 'sink': function('<SID>MkdxGoToHeader'),
      \ 'options': '--layout=reverse'
      \ }))
endfun

" finally, map it -- in this case, I mapped it to overwrite the default action for toggling quickfix (<PREFIX>I)
nnoremap <silent> <Leader>i :call <SID>MkdxFzfQuickfixHeaders()<Cr>

" ----------------------------------------------------------------------------
" Vim-polyglot
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Buffer Bye
" ----------------------------------------------------------------------------
nnoremap <Leader>bd :Bdelete<CR>
nnoremap <Leader>bc :bufdo :Bdelete<CR>

" ----------------------------------------------------------------------------
" Conquer of Completion (COC)
" ----------------------------------------------------------------------------

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " Disable autocomplete on Git Commits
  autocmd FileType gitcommit let b:coc_suggest_disable = 1
augroup end

" augroup ReduceNoise
"     autocmd!
"     " Automatically resize active split to 85 width
"     autocmd WinEnter * :call ResizeSplits()
" augroup END

" function! ResizeSplits()
"     set winwidth=85
"     wincmd =
" endfunction

let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

let g:mkdx#settings = { 'tab': { 'enable': 0 } }

" " This is only availale in the quickfix window, owing to the filetype
" " restriction on the autocmd (see below).
" function! <SID>OpenQuickfix(new_split_cmd)
"   " 1. the current line is the result idx as we are in the quickfix
"   let l:qf_idx = line('.')
"   " 2. jump to the previous window
"   wincmd p
"   " 3. switch to a new split (the new_split_cmd will be 'vnew' or 'split')
"   execute a:new_split_cmd
"   " 4. open the 'current' item of the quickfix list in the newly created buffer
"   "    (the current means, the one focused before switching to the new buffer)
"   execute l:qf_idx . 'cc'
" endfunction

" autocmd FileType qf nnoremap <buffer> <C-v> :call <SID>OpenQuickfix("vnew")<CR>
" autocmd FileType qf nnoremap <buffer> <C-x> :call <SID>OpenQuickfix("split")<CR>

" CTRL-A CTRL-Q to select all and build quickfix list

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" ----------------------------------------------------------------------------
" Fern
" ----------------------------------------------------------------------------

noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

let g:fern#drawer_width = 35
let g:fern#default_hidden = 1
let g:fern#disable_drawer_auto_quit = 1

"noremap <silent> <A-f> :Fern . -drawer -toggle <CR>

function! s:init_fern() abort
  nmap <buffer> H <Plug>(fern-action-open:split)
  nmap <buffer> V <Plug>(fern-action-open:vsplit)
  nmap <buffer> R <Plug>(fern-action-rename)
	nmap <buffer> M <Plug>(fern-action-move)
	nmap <buffer> C <Plug>(fern-action-copy)
	nmap <buffer> N <Plug>(fern-action-new-path)
	nmap <buffer> T <Plug>(fern-action-new-file)
	nmap <buffer> D <Plug>(fern-action-new-dir)
	nmap <buffer> S <Plug>(fern-action-hidden-toggle)
	nmap <buffer> dd <Plug>(fern-action-trash)
  nmap <buffer> <leader> <Plug>(fern-action-mark)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

let g:fern#renderer = "nerdfont"

" ----------------------------------------------------------------------------
" ALE
" ----------------------------------------------------------------------------

let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css': ['prettier'],
\   'javascript': ['prettier', 'eslint'],
\   'json': ['prettier'],
\   'scss': ['prettier'],
\   'yaml': ['prettier'],
\   'php': ['php_cs_fixer', 'phpcbf'],
\}

" let g:ale_fix_on_save = 1

let g:ale_disable_lsp = 1

let g:ale_set_highlights = 0

" highlight clear ALEErrorSign
highlight ALEErrorSign ctermbg=NONE ctermfg=131
highlight ALEWarningSign ctermbg=NONE ctermfg=100

" ----------------------------------------------------------------------------
" Lighline status bar
" ----------------------------------------------------------------------------

set noshowmode

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

set nocompatible              						"We want the latest Vim settings/options.

" filetype off                              "Required for Vundle

"Set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

call plug#begin('~/.vim/plugged')

" Plug 'VundleVim/Vundle.vim'             "Let Vundle manage Vundle, required
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'cakebaker/scss-syntax.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
" Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
" Plug 'rking/ag.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wincent/terminus'
Plug 'chriskempson/base16-vim'
" Plug 'jwalton512/vim-blade'
" Plug 'lumiliet/vim-twig'
Plug 'blueyed/vim-diminactive'
Plug 'sheerun/vim-polyglot'
" Plug 'tpope/vim-vinegar'
Plug 'adelarsq/vim-matchit'
" Plug 'itchyny/lightline.vim'
Plug 'vimwiki/vimwiki'
Plug 'moll/vim-bbye'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rakr/vim-one'
" Plug 'altercation/vim-colors-solarized'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/limelight.vim'
Plug 'niftylettuce/vim-jinja'

call plug#end() 
" call vundle#end() 

" filetype plugin on                        "Detect filetype



let mapleader="\<Space>"                  "Space as Leader
" syntax enable                             "Enable syntax highighting
" set synmaxcol=120

" Allow motions and back-spacing over line-endings etc
set backspace=indent,eol,start
set whichwrap=h,l,b,<,>,~,[,]
                           
"UTF encoding
set encoding=utf-8
set fileencoding=utf-8

let g:netrw_banner=0                      "Hide netrw banner
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
autocmd FileType netrw set nolist



"-------------Visuals--------------"
set t_Co=256                              "256 colours

set background=light
" let g:one_allow_italics = 1
" colorscheme one
" let g:solarized_termtrans = 1
" colorscheme solarized
" call togglebg#map("<F5>")

"Use Base 16 colour scheme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

if has('gui_running')
 set background=light
 colorscheme one
endif

"Italicised comments and attributes
highlight Comment cterm=italic
highlight htmlArg cterm=italic

" force transparent background for line-numbers' columns
highlight LineNr term=bold cterm=NONE ctermfg=08 ctermbg=NONE gui=NONE guifg=#4e4e4e guibg=NONE
highlight SignColumn term=bold cterm=NONE ctermfg=08 ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight StatusLine ctermbg=bg guibg=bg

"We'll fake a custom left padding for each window.
hi LineNr ctermbg=bg
hi foldcolumn ctermbg=bg
set foldcolumn=2



"-------------Search--------------"

set nohlsearch                            "Don’t keep results highlighted after searching
set incsearch                             "just highlight as we type
set ignorecase                            "Ignore case when searching
set smartcase                             "except if we input a capital letter



"-------------Split Management--------------"


"-------------Mappings--------------"

"Make it easy to edit the Vimrc file
nmap <leader>ev :edit ~/.vimrc<cr>
nmap <Leader>es :e ~/.vim/snippets/

"Open netrw
nmap - :Explore<CR>

"Find-in-project search
nnoremap <Leader>a :Rg<Space>

"Move lines up or down
"Symbols correspond to OSx <A-j> and <A-k>
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv




"-------------Plugins--------------"

"/
"/ Nerdtree
"/
let g:NERDTreeShowHidden = 1              "Show hidden files
let g:NERDTreeMinimalUI = 1               "Strip out the fluff
"Enable Nerdtree with CTRL + N           "map <C-n> :NERDTreeToggle<CR>

"Close Vim if only NERDTree is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



"/
"/ Lightline.vim
"/
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }
set noshowmode



"/
"/ FZF
"/
"Remap triggers
nnoremap <Leader>o :Files<CR>
let g:fzf_preview_window = ''



"/
"/ CtrlP.vim
"/
"Remap triggers
" nnoremap <Leader>o :CtrlP<CR>
" nnoremap <leader>i :CtrlPTag<cr>

" let g:ctrlp_working_path_mode = ''        "Disable Working Path feature
" let g:ctrlp_by_filename = 1               "Make CTRL+P only look for filenames by default
" let g:ctrlp_switch_buffer = 0             "Open already-open file in new window
" let g:ctrlp_show_hidden = 1               "Show hidden files

"Don't offer to open certain files/directories
" set wildignore+=*/wp-admin/*,*/wp-includes/*,*/plugins/*,*/uploads/*,*/twentyfifteen/*,*/twentysixteen/*,*/twentyseventeen/*,*/twentyeighteen/*,*/dist/*,*/vendor/*,.tmp/*,*/tmp/*,*.so,*.swp,*.zip
" set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
" set wildignore+=*.pdf,*.psd
" " set wildignore+=style.css
" set wildignore+=*/node_modules/*,*/bower_components/*
" " let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'



"/
"/ Emmet-vim
"/
let g:user_emmet_leader_key='<C-e>'       "Set leader



"/
"/ Vim-bufferline
"/
let g:bufferline_show_bufnr = 0           "Disable display of buffer number



"/
"/ Ultisnips
"/
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsExpandTrigger = "<nop>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']



"/
"/ vim-devicons
"/
" Display folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1



"/
"/ Vimwiki
"/
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
nmap <Leader>d <Plug>VimwikiToggleListItem



"/
"/ Buffer Bye
"/
nnoremap <Leader>bd :Bdelete<CR>
nnoremap <Leader>bc :bufdo :Bdelete<CR>

"-------------Auto-Commands--------------"

"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END



"-------------Tips and Reminders--------------"
" - Press 'zz' to instantly center the line where the cursor is located.
" - Press 'ctrl + ]' to jump to definition of function where cursor is located. 










" Allow mouse scrolling in iTerm2
set mouse=a

" allows you to hide buffers with unsaved changes without being prompted
set hidden

" make current line number stand out a little
" set highlight+=N:DiffText

" blend vertical separators with line numbers
" set highlight+=c:LineNr

" always show status line
set laststatus=2

" ignore annoying swapfile messages
set shortmess+=A

" disable swap file creation
set noswapfile

" no splash screen
" set shortmess+=I

" file-read message overwrites previous
set shortmess+=O

" truncate non-file messages in middle
set shortmess+=T

" don't echo '[w]'/'[written]' when writing
set shortmess+=W

" use abbreviations in messages eg. '[RO]' instead of '[readonly]'
set shortmess+=a

" overwrite file-written messages
set shortmess+=o

" truncate file messages at start
set shortmess+=t

" try to reuse windows/tabs when switching buffers
set switchbuf=usetab

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undo



" vim-closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php"









" Set filetypes for appropriate syntax highlighting et al
au BufRead,BufNewFile *.md,*.txt,*.TXT set filetype=markdown
au BufRead,BufNewFile *.njk,*.nunjucks,*.nunjuck set filetype=jinja.html
au BufRead,BufNewFile *.php set ft=php.html
au BufRead,BufNewFile *.twig set ft=twig.html
" au BufRead,BufNewFile *.blade.php set ft=html

" Open splits to the right or below; more natural than the default
set splitright
set splitbelow

" Show file options above the command line
set wildmenu

" Don't offer to open certain files
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd

" Tabs, indentation and lines
" filetype plugin indent on

" 2 spaces please
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

" Show what mode you’re currently in
" set showmode

" Show what commands you’re typing
" set showcmd

" Allow modelines
" set modeline

" Show current line and column position in file
set ruler

" Show file title in terminal tab
set title

" Set relative line numbers if we can...
" if exists("+relativenumber")
"     " Due to a problem with relative line numbers not persisting across new
"     " tabs and splits, set no line numbers at all...
"     set number
"     " ..then set relative ones.
"     set relativenumber
" " ...otherwise let’s just have regular ones.
" else
"     set number
" endif

" Force cursor onto new line in Git commit messages after 72 characters
autocmd FileType gitcommit set textwidth=72

" Colour the 73rd column so that we don't type over our limit
if exists("+colorcolumn")
    set colorcolumn=+1
endif

" Highlight current line
" set cursorline


" New note
nnoremap <Leader>no :e new <bar> se ft=markdown <bar> :WP<CR>

" Tab through buffer files
nnoremap <Leader>b :b<Space>

" source .vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" 'jk' to throw you into normal mode from insert mode
inoremap jk <esc>

" make ; do the same thing as : for one less key press
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
" nnoremap <Leader>bc :%bd<CR>
" nnoremap <Leader>bd :bd<CR>
" nnoremap <Leader>bd :bp\|bd #<CR>

" Productivity boosts
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

" vp doesn't replace paste buffer
function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction
function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Protect large files from sourcing and other overhead; files become read only
" if !exists("my_auto_commands_loaded")
"     let my_auto_commands_loaded = 1
    " Large files are > 10M
    " Set options:
    " eventignore+=FileType (no syntax highlighting etc
    " assumes FileType always on)
    " noswapfile (save copy of file)
    " bufhidden=unload (save memory when other file is viewed)
    " buftype=nowritefile (is read-only)
    " undolevels=-1 (no undo possible)
    " let g:LargeFile = 1024 * 1024 * 10
    " augroup LargeFile
    "     autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
    " augroup END
" endif

" Search for selected text, forwards or backwards.
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

" Set default gui font
if has('gui_running')

    set guifont=FiraCode-Light:h16
    " set guifont=InputMono\ Light:h16
    " set guifont=InputMono\ Light:h14
    " set guifont=InputMono\ ExLight:h14
    " set guifont=InputMono\ ExLight\ Nerd\ Font:h14
    " set guifont=InputMono\ Nerd\ Font:h14
    " set guifont=Inconsolata\ for\ Powerline:h14
    " set guifont=Fura\ Mono\ for\ Powerline:h14
    set linespace=14

    " se fu

    " remove right scroll bar
    set go-=r

    " remove left scroll bar
    set go-=L
endif

" Word Processor Mode
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


" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

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
augroup end

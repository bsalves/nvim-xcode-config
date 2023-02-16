call plug#begin()

" Swift-LSP
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'vim-syntastic/syntastic'

Plug 'ctrlpvim/ctrlp.vim'

"GIT
Plug 'kdheepak/lazygit.nvim'
Plug 'APZelos/blamer.nvim'

" Themes
Plug 'sainnhe/sonokai'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'keith/swift.vim'

Plug 'hkrish/vimxcode'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

Plug 'Shougo/deoplete.nvim'
Plug 'mitsuse/autocomplete-swift'
Plug 'landaire/deoplete-swift'
Plug 'kballard/vim-swift'
Plug 'aciidb0mb3r/SwiftDoc.vim'
" Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-dispatch'


Plug 'neovim/nvim-lspconfig'
Plug 'xbase-lab/xbase'




if (has("nvim"))
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
endif
call plug#end()


" map leader
let mapleader=" "
nnoremap <SPACE> <Nop>


" ctags for swift -------------------------- {{{
let g:tagbar_type_swift = {
  \ 'ctagstype': 'swift',
  \ 'kinds' : [
    \ 'e:Enums',
    \ 't:Typealiases',
    \ 'p:Protocols',
    \ 's:Structs',
    \ 'c:Classes',
    \ 'f:Functions',
    \ 'v:Variables',
    \ 'E:Extensions',
    \ 'l:Constants',
  \ ],
  \ 'sort' : 0
  \ }
" }}}

" swiftformat ---------------------------- {{{
  nnoremap <leader>F :!swiftformat %<cr>
" }}}

" autocomplete for swift ------------------- {{{
autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)
" }}}

" CLighter Xcode --------------------------- {{{
" Config for CLighter
if has('nvim')
    let g:clamp_autostart = 1
    let g:clamp_libclang_file = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
else
    let g:clighter8_autostart = 1
    let g:clighter8_libclang_file = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
  endif
" }}}



" Custom settings
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']

" Global Sets """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on            " Enable syntax highlight
set nu               " Enable line numbers
set relativenumber   " Enable relative line numbers
set tabstop=4        " Show existing tab with 4 spaces width
set softtabstop=4    " Show existing tab with 4 spaces width
set shiftwidth=4     " When indenting with '>', use 4 spaces width
set expandtab        " On pressing tab, insert 4 spaces
set smarttab         " insert tabs on the start of a line according to shiftwidth
set smartindent      " Automatically inserts one extra level of indentation in some cases
set hidden           " Hides the current buffer when a new file is openned
set incsearch        " Incremental search
set ignorecase       " Ingore case in search
set smartcase        " Consider case if there is a upper case character
set scrolloff=8      " Minimum number of lines to keep above and below the cursor
set colorcolumn=150  " Draws a line at the given line to keep aware of the line size
set signcolumn=yes   " Add a column on the left. Useful for linting
set cmdheight=2      " Give more space for displaying messages
set updatetime=100   " Time in miliseconds to consider the changes
set encoding=utf-8   " The encoding should be utf-8 to activate the font icons
set nobackup         " No backup files
set nowritebackup    " No backup files
set splitright       " Create the vertical splits to the right
set splitbelow       " Create the horizontal splits below
set autoread         " Update vim after file update from outside
" set mouse=a          " Enable mouse support
filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
filetype indent on   " Load the indent file for the file type, if any

" remapping
" Shortcuts for split navigation
nmap <leader>e :NERDTreeToggle<CR>
nmap <C-.> :ALEToggle<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>


" GIT
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

let g:lazygit_use_custom_config_file_path = 0 " config file path is evaluated if this value is 1
let g:lazygit_config_file_path = '' " custom config file path
nnoremap <silent> <leader>gg :LazyGit<CR>

let g:blamer_enabled = 1
let g:blamer_delay = 100
nnoremap <silent> <leader>gb :BlamerToggle<CR>



" Themes 
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Sonokay
let g:sonokai_style = 'maia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_current_word = 'bold'

colorscheme sonokai
let g:airline_theme = 'sonokai'



" AirLine """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1



" ALE """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'swift': ['swiftlint']
\}

" let g:ale_fixers = {
" \   '*': ['trim_whitespace'],
" \}

" let g:ale_fix_on_save = 1


" Coc config
let g:coc_global_extensions = []

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)


if (has("nvim"))
    " Telescope """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
endif

" NERDTree
let g:NERDTreeGitStatusConcealBrackets = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }



" Autocomplete remapping
inoremap <silent><expr> <return> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<return>"


" SourceKit-LSP configuration
if executable('sourcekit-lsp')
        au User lsp_setup call lsp#register_server({
        \ 'name': 'sourcekit-lsp',
        \ 'cmd': {server_info->['sourcekit-lsp']},
        \ 'whitelist': ['swift'],
        \ })
endif


augroup filetype
  au! BufRead,BufNewFile *.swift set ft=swift
augroup END

autocmd FileType swift setlocal omnifunc=lsp#complete

autocmd FileType swift nnoremap <C-]> :LspDefinition<CR>


" terminal
" vim-powered terminal in split window
map <F6> :let $VIM_DIR=expand('%:p:h')<CR>:10split term://zsh<CR>cd $VIM_DIR<CR>


" Clipboard
set clipboard=unnamed

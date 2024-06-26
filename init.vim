call plug#begin()

" Swift-LSP
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'vim-syntastic/syntastic'

" Plug 'ctrlpvim/ctrlp.vim'

"GIT
Plug 'kdheepak/lazygit.nvim'
Plug 'APZelos/blamer.nvim'
Plug 'airblade/vim-gitgutter'

" AI Autocomplete/Helpers
Plug 'github/copilot.vim'
" Plug 'madox2/vim-ai'

" Themes
Plug 'sainnhe/sonokai'
Plug 'sainnhe/everforest'
Plug 'sainnhe/edge'
Plug 'projekt0n/github-nvim-theme'
Plug 'shaunsingh/nord.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
" Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'keith/swift.vim'

Plug 'hkrish/vimxcode'

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'mitsuse/autocomplete-swift'
" Plug 'landaire/deoplete-swift'
Plug 'kballard/vim-swift'
" Plug 'aciidb0mb3r/SwiftDoc.vim'
" Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-dispatch'


" Plug 'neovim/nvim-lspconfig'
" Plug 'xbase-lab/xbase', { 'do': 'make install' }

if (has("nvim"))
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
endif

Plug 'bsalves/friendly-snippets'

call plug#end()



" map leader
let mapleader=" "
nnoremap <SPACE> <Nop>

" remap metakey
let g:meta_key = 1

" Deoplate
" let g:deoplete#enable_at_startup = 1


" NERDTree commenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


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
" autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)
" }}}

" CLighter Xcode --------------------------- {{{
" Config for CLighter
if has('nvim')
    let g:clamp_autostart = 1
    let g:clamp_libclang_file = '/Applications/Xcode15.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
else
    let g:clighter8_autostart = 1
    let g:clighter8_libclang_file = '/Applications/Xcode15.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
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

nnoremap <silent> <C-0> :bn<CR>
nnoremap <silent> <C-9> :bp<CR>
nnoremap <silent> <C-x> :bd<CR>

map <silent> <leader>n :noh<CR>
map <C-s> :w<CR>
map <C-q> :q<CR>


" Map to run ruby command line current file
map <leader>r : w <bar> !ruby % <CR>

" GIT
let g:lazygit_floating_window_winblend = 1 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1 " scaling factor for floating window
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

let g:lazygit_use_custom_config_file_path = 0 " config file path is evaluated if this value is 1
let g:lazygit_config_file_path = '' " custom config file path
nnoremap <silent> <leader>gg :LazyGit<CR>

let g:blamer_enabled = 0
let g:blamer_delay = 0
let g:blamer_show_in_visual_modes = 1
nnoremap <silent> <leader>gb :BlamerToggle<CR>



" Themes 
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Sonokai
let g:sonokai_style = 'default'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_current_word = 'bold'

" Everforest
let g:everforest_ui_contrast = 'high'
let g:everforest_background = 'soft'

" Edge
let g:edge_style = 'neon'
let g:edge_better_performance = 1

" GitHub Themes

" Nord theme

set cursorline

set background=dark
" colorscheme everforest
" colorscheme catppuccin
" colorscheme nord
" colorscheme edge
" colorscheme github_dark_high_contrast
" colorscheme github_dark
colorscheme sonokai
let g:airline_theme = 'sonokai'
" let g:airline_ = 'github_dark'
" let g:airline_ = 'github_dark_high_contrast'
" let g:airline_theme = 'github_dark_high_contrast'
" let g:airline_theme = 'catppuccin'



" AirLine """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1



" ALE """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'swift': ['swiftlint']
\}

let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\}

" It fix the file on save
" let g:ale_fix_on_save = 1


" Coc config
let g:coc_global_extensions = []

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
let g:coc_global_extensions = ['coc-solargraph']

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
let g:NERDTreeWinSize=60

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
" map <F6> :let $VIM_DIR=expand('%:p:h')<CR>:10split term://zsh<CR>cd $VIM_DIR<CR>


" Clipboard
set clipboard=unnamed


" ChatGPT
let chat_engine_config = {
\  "engine": "chat",
\  "options": {
\    "model": "gpt-3.5-turbo",
\    "endpoint_url": "https://api.openai.com/v1/chat/completions",
\    "max_tokens": 1000,
\    "temperature": 0.1,
\    "request_timeout": 20,
\    "selection_boundary": ""
\  },
\}

" Spliting...

nnoremap <silent> + :res +1 %<cr>
nnoremap <silent> _ :res -1 %<cr>

nnoremap <silent> = :vertical res +5 %<cr>
nnoremap <silent> - :vertical res -5 %<cr>

nnoremap <silent> s :split<cr>
nnoremap <silent> S :vsplit<cr>


" CocSnippets

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

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Quickfix remapping

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

nnoremap <silent> <Leader>q :call ToggleQuickFix()<cr>

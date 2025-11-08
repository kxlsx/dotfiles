" "  General
"  Show line numbers
set number
"  Highlight matching brace
set showmatch
"  Set syntax highlighting
syntax on

"  Highlight all search results
set hlsearch
"  Enable smart-case search
set smartcase
"  Always case-insensitive
set ignorecase
"  Searches for strings incrementally
set incsearch

"  Auto-indent new lines
set autoindent
"  Number of auto-indent spaces
set shiftwidth=4
"  Enable smart-indent
set smartindent
"  Enable smart-tabs
set smarttab
"  Number of spaces per Tab
set softtabstop=4
 
" "  Advanced
"  Show row and column ruler information
set ruler

"  Number of undo levels
set undolevels=1000
"  Backspace behaviour
set backspace=indent,eol,start

" " Splits
" more natural splits
set splitbelow
set splitright
" split keymaps
nnoremap <C-Left> <C-W><Left>
nnoremap <C-Up> <C-W><Up>
nnoremap <C-Down> <C-W><Down>
nnoremap <C-Right> <C-W><Right>


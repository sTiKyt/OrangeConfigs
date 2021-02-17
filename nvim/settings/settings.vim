syntax enable             " Enables syntax highlighting
set autoread              " Updates file if it was changed in other editor
set hidden                " Allows you to have multiple buffers open
set nowrap                " Display long lines as one line instead of wrapping around them
set encoding=UTF-8        " Default encoding for neovim and other modern software, required by some plugins
set fileencoding=utf-8    " Encoding written to a file
set pumheight=10          " Makes popup menu smaller
set ruler                 " Show the cursor position
set cmdheight=2           " Gives more space to display messages at the bottom
set iskeyword+=_          " Treats _ as regular character instead of separator
set mouse=a               " Enables your mouse
set splitbelow            " Horizontal splits are going to be on the bottom
set splitright            " Vertical splits are going to be on the right
set conceallevel=0        " Allows to see `` in markdown files
set tabstop=2             " Makes tab 2 spaces long
set shiftwidth=2          " Changes inserter spaces amount for indentation
set expandtab             " Replaces tab with spaces
set smarttab              " Makes tabbing smarter
set autoindent            " Tells Vim to apply the indentation of current line to next
set smartindent           " Reacts to the syntax/style of the code you are editing
set laststatus=0          " Always displays the status line
set number                " Adds number to the left of every line
set cursorline            " Adds highlighting of the current line
set background=dark       " Tells the Vim what background looks like
set showtabline=2         " Makes Vim always show tabs
set noshowmode            " Hides things like --INSERT--
set nobackup              " Req. by coc. Makes sure backup file isn't stored after successful save
set nowritebackup         " Req. by coc. Makes sure backup file doesn't get created at all
set updatetime=250        " Makes sure swap file is written faster, req. for fast autocompletion
set timeoutlen=500        " Makes mapped sequences complete faster
set clipboard=unnamedplus " Makes sure system clipboard is being used

" Autosource when writing to init.vm
au! BufWritePost $MYVIMRC source %

" Tries to write as sudo when w!! used
cmap w!! w !sudo tee %

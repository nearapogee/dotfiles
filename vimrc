set nocompatible  " vim settings

set history=50
set ruler
set showcmd
set incsearch
set hidden

" syntax
if (has("gui_running") && !exists("syntax_on"))
  syntax on " note not enable
  set hlsearch
endif

if has("autocmd")
  filetype plugin indent on  " enable file type detection
else
  set autoindent             " always set auto indenting
endif

" softtabs
set tabstop=2
set shiftwidth=2
set expandtab

" display status
set laststatus=2

" map autocomplete to tab
imap <Tab <C-N>

" color scheme

" numbers
set number
set numberwidth=5

" tab completion
set completeopt=longest,menu
set wildmode=list:longest,list:full

" case options
set ignorecase
set smartcase

" tab mappings
map <leader>tt :tabnew<cr>
map <leader>te :tabedit<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove<cr>

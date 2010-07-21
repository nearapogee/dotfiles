set nocompatible  " vim settings

set history=50
set ruler
set showcmd
set incsearch
set hidden

" syntax
if (&t_Co < 2 || has("gui_running")) && !exists("syntax_on")
  syntax on " note not enable
  set hlsearch
endif

if has("autocmd")
  filetype plugin indent on  " enable file type detection

  autocmd FileType text setlocal textwidth=78  " text files limited to 78 characters wide

  autocmd BufReadPost *
    \ if line("'\'") > 1 && line("'\'") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " source vimrc after saving
  autocmd bufwritepost .vimrc source $MYVIMRC  

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

" irb vim
let g:LustyExplorerSuppressRubyWarning = 1

"snipmate setup
source ~/.vim/snippets/support_functions.vim
autocmd vimenter * call s:SetupSnippets()
function! s:SetupSnippets()

    "if we're in a rails env then read in the rails snippets
    if filereadable("./config/environment.rb")
        call ExtractSnips("~/.vim/snippets/ruby-rails", "ruby")
        call ExtractSnips("~/.vim/snippets/eruby-rails", "eruby")
    endif

    call ExtractSnips("~/.vim/snippets/html", "eruby")
    call ExtractSnips("~/.vim/snippets/html", "xhtml")
    call ExtractSnips("~/.vim/snippets/html", "php")
endfunction

" vjde
"let g:vjde_completion_key='<c-space>' 

" edit vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>


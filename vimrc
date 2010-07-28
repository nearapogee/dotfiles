set nocompatible                                    " vim mode

silent! call pathogen#runtime_append_all_bundles()  " load plugins with pathogen

set history=50
set ruler
set showcmd
set incsearch
set hidden
filetype on

" syntax
if (&t_Co < 2 || has("gui_running")) && !exists("syntax_on")
  syntax on " note not enable
  set hlsearch
endif

" Simple Text FileType
au BufNewFile,BufRead *.txt,*.text   setf text

if has("autocmd")
  filetype plugin indent on  " enable file type detection

  autocmd FileType txt,text call s:textConfig()
  function! s:textConfig()
    setlocal textwidth=78   " text files limited to 78 characters wide
    setlocal wrap           " long lines should be split
    setlocal linebreak      " words should not be split
    setlocal nolist         " breaks linebreak
  endfunction

  autocmd FileType java,ant call s:javaTabConfig()
  function! s:javaTabConfig()
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal expandtab
  endfunction

  autocmd BufReadPost *
    \ if line("'\'") > 1 && line("'\'") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " source vimrc after saving
  autocmd BufWritePost .vimrc source $MYVIMRC  

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

" edit vimrc with <leader>v
nmap <leader>v :tabedit $MYVIMRC<CR>

" spell check toggle
function! ToggleSpell()
  if !exists("b:spell")
    setlocal spell spelllang=en_us
    let b:spell = 1
    echo "spell on"
  else
    setlocal nospell
    unlet b:spell
    echo "spell off"
  endif
endfunction
nmap <C-s> :call ToggleSpell()<CR>
imap <C-s> <ESC>:call ToggleSpell()<CR>a 

" toggle folding
nnoremap <space> za

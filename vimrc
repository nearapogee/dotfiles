set nocompatible                                    " vim mode

"silent! call pathogen#runtime_append_all_bundles()  " load plugins with pathogen
call pathogen#infect()

set history=50
set ruler
set showcmd
set incsearch
set hidden
filetype on
filetype plugin on "for gocode

let mapleader="\\"

" make delete/backspace consistent on all systems
set backspace=indent,eol,start

" syntax
if (&t_Co < 2 || has("gui_running")) && !exists("syntax_on")
  syntax on " note not enable
  set hlsearch
endif

syntax on
colorscheme fnaqevan
"colorscheme vividchalk
"colorscheme blacksea

au BufRead,BufNewFile *.jst.ejs setfiletype html

" move .swp files to /tmp
set directory=/tmp

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

" remappings
"imap <Tab <C-N>           | " map autocomplete to tab
"nmap <C-x> :nohl<CR>

" color scheme

" numbers
set number
set numberwidth=5

" long lines
set colorcolumn=80
highlight ColorColumn ctermbg=Black guibg=Cyan

"match OverLength /\%81v.*/
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929

" trailing white space
match Todo /\s\+$/

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
        "call ExtractSnips("~/.vim/snippets/ruby-rails", "ruby")
        "call ExtractSnips("~/.vim/snippets/eruby-rails", "eruby")
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
imap <C-s> <ESC>:call ToggleSpell()<CR>

nnoremap <space> za | " toggle folding

" status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" taglist config
let g:Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
map <leader>lt :TlistToggle<cr>
let g:Tlist_GainFocus_On_ToggleOpen = 1
let g:Tlist_Use_Right_Window = 1

" eclim completion
imap <C-space> <C-X><C-U>

" ruby omnicompletion
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" ctags
let g:ctags_path='/usr/local/bin/ctags'

" align function
function! AlignAssignments()
  "Patterns needed to locate assignment operators...
  let ASSIGN_OP   = '[-+*/%|&]\?=\@<!=[=~]\@!'
  let ASSIGN_LINE = '^\(.\{-}\)\s*\(' . ASSIGN_OP . '\)'

  "Locate block of code to be considered (same indentation, no blanks)
  let indent_pat  = '^' . matchstr(getline('.'), '^\s*') . '\S'
  let firstline   = search('^\%(' . indent_pat . '\)\@!','bnW') + 1
  let lastline    = search('^\%(' . indent_pat . '\)\@!', 'nW') - 1
  if lastline < 0
    let lastline = line('$')
  endif

  "Find the column at with the operators should be aligned...
  let max_align_col = 0
  let max_op_width  = 0
  for linetext in getline(firstline, lastline)
    "Does this line have an assignment in it?
    let left_width = match(linetext, '\s*' . ASSIGN_OP)

    "If so, track the minimal assignment column and operator width...
    if left_width >= 0
      let max_align_col = max([max_align_col,left_width])
      let op_width      = strlen(matchstr(linetext, ASSIGN_OP))
      let max_op_width  = max([max_op_width, op_width+1])
    endif
  endfor

  "Code needed to reformat lines as as to align operators...
  let FORMATTER = '\=printf("%-*s%*s", max_align_col, submatch(1),
  \                                    max_op_width,  submatch(2))'

  " Reformat lines with operators aligned in the appropriate column...
  for linenum in range(firstline,lastline)
    let oldline = getline(linenum)
    let newline = substitute(oldline, ASSIGN_LINE, FORMATTER, "")
    call setline(linenum, newline)
  endfor

endfunction
nmap <silent> ;= :call AlignAssignments()<CR>

" Javascript
let javascript_enable_domhtmlcss = 1
let g:jsx_ext_required = 0

" CoffeeScript
"au BufWritePost *.coffee silent CoffeeMake! | cwindow 3
"au BufNewFile,BufReadPost *.coffee setl foldmethod=indent "nofoldenable
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
au BufNewFile,BufReadPost *.coffee setl ai

" Fabrication Gem
autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()

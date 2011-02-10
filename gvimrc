set guioptions-=T " hide toolbar
set lines=32 columns=124

set guifont=Monaco:h14

colorscheme fnaqevan
"colorscheme vividchalk
"colorscheme blacksea
"colorscheme tirblack

function! ToggleFullscreen()
  if !exists("w:fullscreen")
    let w:fullscreen = 1
    setlocal fuoptions=maxvert,maxhorz
    setlocal fullscreen
    echo "fullscreen on"
  else
    unlet w:fullscreen
    setlocal nofullscreen
    echo "fullscreen off"
  endif
endfunction
nmap <C-a> :call ToggleFullscreen()<CR>
"imap <C-m> <ESC>:call ToggleFullscreen()<CR>

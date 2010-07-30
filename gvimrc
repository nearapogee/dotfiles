set guioptions-=T " hide toolbar
set lines=40 columns=124

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
nmap <C-m> :call ToggleFullscreen()<CR>
imap <C-m> <ESC>:call ToggleFullscreen()<CR>

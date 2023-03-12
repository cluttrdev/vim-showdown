augroup showdown
    if g:showdown_autorun
        au! BufWinEnter <buffer> ShowdownStart
    endif

    au! VimLeave <buffer> ShowdownStop
augroup END

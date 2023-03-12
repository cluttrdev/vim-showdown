" Title: Showdown
" Description: A Vim plugin for Showdown
" Author: Andreas Kunze <https://github.com/cluttrdev>

" Prevent the plugin from being loaded multiple times
if exists('g:loaded_showdown')
    finish
endif
let g:loaded_showdown = 1


command! ShowdownStart :call s:ShowdownStart()
command! ShowdownStop :call s:ShowdownStop()
command! ShowdownToggle :call s:ShowdownToggle()


if !exists('g:showdown_command')
    let g:showdown_command = 'showdown'
    if !executable(g:showdown_command)
        echoerr 'showdown executable not found'
    endif
endif

" automatically show preview when opening markdown buffer
if !exists('g:showdown_autorun')
    let g:showdown_autorun = 0
endif

" the port showdown will listen on
if !exists('g:showdown_port')
    let g:showdown_port = 1337
endif


function! s:ShowdownRun(command)
    let l:platform_command = has('win32') ?
                \ "start /b " . a:command :
                \ a:command . "&"

    let l:func = has('nvim') ?
                \ function('jobstart') :
                \ function('system')

    silent! call l:func(l:platform_command)
endfunction

function! s:ShowdownStart()
    let l:command = g:showdown_command . "\"" . expand('%:p') . "\"" .
                \ " --port " . g:showdown_port

    call s:ShowdownRun(command)
endfunction

function! s:ShowdownStop()
    let l:command = g:showdown_command . " --stop " .
                \ " --port " . g:showdown_port

    call s:ShowdownRun(command)
endfunction

function! s:ShowdownToggle()
    if !exists('s:showdownRunningFlag')
        call s:ShowdownStart() | let s:showdownRunningFlag = 1
    else
        call s:ShowdownStop() | unlet! s:showdownRunningFlag
    endif
endfunction

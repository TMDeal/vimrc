" Make sure Vim returns to the same line when you reopen a file.
function! functions#LineReturn()
    if line("'\"") > 0 && line("'\"") <= line("$") |
        execute 'normal! g`"zvzz' |
    endif
endfunction

function! functions#StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

function! functions#AutoCDtoProjectRoot()
    try
        if &ft != 'help'
            ProjectRootCD
        endif
    catch
        "silently ignore invalid buffers
    endtry
endfun

function! functions#LocNext()
    try
        lnext
    catch
        try | lfirst | catch | endtry
    endtry
endfunction

function! functions#LocPrev()
    try
        lprev
    catch
        try | llast | catch | endtry
    endtry
endfunction

function! functions#ExecuteWithInput(command, prompt, ...) abort
    call inputsave()
    if a:0 == 1
        let l:arg = input(a:prompt . ': ', "", a:1)
    else
        let l:arg = input(a:prompt . ': ')
    endif
    call inputrestore()

    let l:command = '' . a:command . ' ' . l:arg

    execute 'silent! ' .  l:command
    execute 'silent! redraw!'
endfunction

function! functions#InitLeaderModeMap()
    let g:leader_map.m = {'name': '[mode]'}
endfunction

function! functions#ClearLeaderModeMap()
    if has_key(g:leader_map, 'm')
        call remove(g:leader_map, 'm')
    endif
endfunction

function! functions#InitLeaderMap()
    let g:leader_map     = {}
    let g:leader_map.f   = {'name': '[filesystem]'}
    let g:leader_map.F   = {'name': '[Format]'}
    let g:leader_map.o   = {'name': '[open]'}
    let g:leader_map.g   = {'name': '[git]'}
    let g:leader_map.w   = {'name': '[window]'}
    let g:leader_map.T   = {'name': '[tabs]'}
    let g:leader_map.t   = {'name': '[tags]'}
    let g:leader_map.p   = {'name': '[fzf]'}
    let g:leader_map.y   = {'name': '[yankring]'}
endfunction

function! functions#AddDirLocal()
        let l:var = input('var: ')
        let l:value = input('value: ')
        let l:line_to_append ='let ' . l:var . '=' . l:value
        let l:lvimrc = expand(projectroot#guess() . '/.lvimrc')

        if !filereadable(l:lvimrc)
            execute 'write ' . l:lvimrc
        endif

        call writefile([l:line_to_append], l:lvimrc, 'a')
        execute 'LocalVimRC'
endfunction

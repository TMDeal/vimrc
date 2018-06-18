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

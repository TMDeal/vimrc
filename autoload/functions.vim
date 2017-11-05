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

" function! functions#InitLeaderModeMap()
"     let g:leader_map.m = {'name': '[mode]'}
" endfunction
"
" function! functions#ClearLeaderModeMap()
"     if has_key(g:leader_map, 'm')
"         call remove(g:leader_map, 'm')
"     endif
" endfunction
"
" function! functions#InitLeaderMap()
"     let g:leader_map     = {}
"     let g:leader_map.f   = {'name': '[filesystem]'}
"     let g:leader_map.F   = {'name': '[Format]'}
"     let g:leader_map.o   = {'name': '[open]'}
"     let g:leader_map.g   = {'name': '[git]'}
"     let g:leader_map.w   = {'name': '[window]'}
"     let g:leader_map.T   = {'name': '[tabs]'}
"     let g:leader_map.t   = {'name': '[tags]'}
"     let g:leader_map.p   = {'name': '[fzf]'}
"     let g:leader_map.y   = {'name': '[yankring]'}
" endfunction
"
" function! functions#SetupLSPMappings()
"     let g:leader_map.m.l = {'name': '[lsp]'}
"     let g:leader_map.m.l.r = ['call LanguageClient_textDocument_rename()', 'rename']
"     let g:leader_map.m.l.d = ['call LanguageClient_textDocument_definition()', 'goto definition']
"     let g:leader_map.m.l.t = ['call LanguageClient_textDocument_rename()', 'show type']
"     let g:leader_map.m.l.s = ['call LanguageClient_textDocument_documentSymbol()', 'show symbols']
"     let g:leader_map.m.l.R = ['call LanguageClient_textDocument_references()', 'show references']
"     let g:leader_map.m.l.f = ['call LanguageClient_textDocument_rangeFormatting()', 'format']
"     let g:leader_map.m.l.s = ['LanguageClientStart', 'start lsp']
"     let g:leader_map.m.l.S = ['LanguageClientStop', 'stop lsp']
" endfunction

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

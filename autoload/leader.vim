function! leader#SetupMode()
    let g:leader_map.m = {'name': '[mode]'}
endfunction

function! leader#ClearMode()
    if has_key(g:leader_map, 'm')
        call remove(g:leader_map, 'm')
    endif
endfunction

function! leader#Init()
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

    let g:leader_map.u   = ['UndotreeToggle', 'undotree']
endfunction

function! leader#SetupLSP()
    let g:leader_map.m.l = {'name': '[lsp]'}
    let g:leader_map.m.l.r = ['call LanguageClient_textDocument_rename()', 'rename']
    let g:leader_map.m.l.d = ['call LanguageClient_textDocument_definition()', 'goto definition']
    let g:leader_map.m.l.t = ['call LanguageClient_textDocument_hover()', 'symbol info']
    let g:leader_map.m.l.s = ['call LanguageClient_textDocument_documentSymbol()', 'show buffer symbols']
    let g:leader_map.m.l.S = ['call LanguageClient_workspace_symbol()', 'show project symbols']
    let g:leader_map.m.l.R = ['call LanguageClient_textDocument_references()', 'show references']
    let g:leader_map.m.l.f = ['call LanguageClient_textDocument_formatting()', 'format buffer']
    let g:leader_map.m.l.U = ['LanguageClientStart', 'start lsp']
    let g:leader_map.m.l.X = ['LanguageClientStop', 'stop lsp']
endfunction

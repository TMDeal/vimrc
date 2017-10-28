function! s:SetLeaderGuideMappings()
    call functions#InitLeaderModeMap()

    if dein#tap('leader-guide')
        if dein#tap('DoxygenToolkit')
            let g:leader_map.m.D = ['Dox', 'Doxygen']
        endif
        if dein#tap('headerguard')
            let g:leader_map.m.g = ['HeaderguardAdd', 'make headerguard']
        endif
        if dein#tap('fswitch')
            let g:leader_map.m.f = {'name': '[FSwitch]'}
            let g:leader_map.m.f.h = ['FSHere', 'switch here']
            let g:leader_map.m.f.r = ['FSSplitRight', 'switch right split']
            let g:leader_map.m.f.l = ['FSSplitLeft', 'switch left split']
        endif
    endif
endfunction

augroup my_autocmds
    au BufEnter * if &ft ==# 'cpp' || &ft ==# 'c' | call s:SetLeaderGuideMappings() | endif
augroup END

let s:flags=clang#Config()

if dein#tap('neoinclude')
    call dein#source('neoinclude')
    call neoinclude#initialize()
    call neoinclude#set_filetype_paths('%', neoinclude#util#get_context_filetype())
    if !empty(s:flags['dirs'])
        let g:neoinclude#paths.cpp.=','.join(s:flags.dirs, ',')
    endif
endif

if dein#tap('ale')
    if !empty(s:flags['all'])
        let g:ale_cpp_clang_options=join(s:flags.all, ' ')
        let g:ale_c_gcc_options=join(s:flags.all, ' ')
    endif
endif

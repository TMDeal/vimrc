function! s:SetLeaderGuideMappings()
    call leader#SetupMode()

    if dein#tap('leader-guide')
        if dein#tap('neoformat')
            let g:leader_map.m.f = ['Neoformat', 'format']
        endif
    endif
endfunction

augroup my_autocmds
    au BufEnter * if &ft ==# 'elixir' | call s:SetLeaderGuideMappings() | endif
augroup END

setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2

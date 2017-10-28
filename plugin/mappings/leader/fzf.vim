if dein#tap('leader-guide')
    if dein#tap('fzf')
        let g:leader_map.p.r = ['FzfRipgrep', 'ripgrep']
        let g:leader_map.p.a = ['FzfAg', 'ag']
        let g:leader_map.p.f = ['FzfFiles', 'files']
        let g:leader_map.p.b = ['FzfBuffers', 'buffers']
        let g:leader_map.p.t = ['FzfTags', 'tags']
        let g:leader_map.p.m = ['FzfMarks', 'marks']
        let g:leader_map.p.M = ['FzfMaps', 'mappings']
        let g:leader_map.p.F = ['FzfFiletypes', 'filetypes']
    endif
endif

if dein#tap('leader-guide')
    if dein#tap('fzf')
        let g:leader_map.f.r = ['FzfRipgrep', 'ripgrep']
        let g:leader_map.f.a = ['FzfAg', 'ag']
        let g:leader_map.f.f = ['FzfFiles', 'files']
        let g:leader_map.f.b = ['FzfBuffers', 'buffers']
        let g:leader_map.f.t = ['FzfTags', 'tags']
        let g:leader_map.f.m = ['FzfMarks', 'marks']
        let g:leader_map.f.w = ['FzfWindows', 'windows']
        let g:leader_map.f.M = ['FzfMaps', 'mappings']
        let g:leader_map.f.F = ['FzfFiletypes', 'filetypes']
    endif
endif

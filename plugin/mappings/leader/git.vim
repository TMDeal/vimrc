if dein#tap('fugitive')
    if dein#tap('leader-guide')
        let g:leader_map.g.a = ['Git add %:p', 'add file']
        let g:leader_map.g.s = ['Gstatus', 'status']
        let g:leader_map.g.c = ['Gcommit -v -q', 'commit']
        let g:leader_map.g.t = ['Gcommit -v -q %:p', 'commit file']
        let g:leader_map.g.d = ['Gdiff', 'diff']
        let g:leader_map.g.e = ['Gedit', 'edit']
        let g:leader_map.g.r = ['Gread', 'read']
        let g:leader_map.g.w = ['Gwrite', 'write']
        let g:leader_map.g.l = ['Glog', 'log']
        let g:leader_map.g.p = ['call functions#ExecuteWithInput("Ggrep", "grep")', 'grep']
        let g:leader_map.g.m = ['call functions#ExecuteWithInput("Gmove", "move")', 'move']
        let g:leader_map.g.b = ['call functions#ExecuteWithInput("Git branch", "switch branch")', 'branch']
        let g:leader_map.g.o = ['call functions#ExecuteWithInput("Git checkout", "checkout")', 'checkout']
    endif
endif

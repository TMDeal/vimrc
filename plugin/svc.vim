if dein#tap('fugitive')
    if dein#tap('leader-guide')
        let g:leader_map.g.g = ['call functions#ExecuteWithInput("Git", "Git", "customlist,complete#fugitive#Git")', 'call git']
        let g:leader_map.g.a = ['Git add %:p', 'Git add file']
        let g:leader_map.g.s = ['Gstatus', 'Git status']
        let g:leader_map.g.c = ['Gcommit -v -q', 'Git commit']
        let g:leader_map.g.t = ['Gcommit -v -q %:p', 'Git commit file']
        let g:leader_map.g.d = ['Gdiff', 'Git diff']
        let g:leader_map.g.e = ['Gedit', 'Git edit']
        let g:leader_map.g.r = ['Gread', 'Git read']
        let g:leader_map.g.w = ['Gwrite', 'Git write']
        let g:leader_map.g.l = ['Glog', 'Git log']
        let g:leader_map.g.p = ['call functions#ExecuteWithInput("Ggrep", "grep", "customlist,complete#fugitive#Edit")', 'Git grep']
        let g:leader_map.g.m = ['call functions#ExecuteWithInput("Gmove", "move", "customlist,complete#fugitive#Move")', 'Git move']
        let g:leader_map.g.b = ['call functions#ExecuteWithInput("Git branch", "switch branch")', 'Git branch']
        let g:leader_map.g.o = ['call functions#ExecuteWithInput("Git checkout", "checkout")', 'Git checkout']
    endif
endif

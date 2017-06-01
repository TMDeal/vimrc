if dein#tap('eunuch')
    if dein#tap('leader-guide')
        let g:leader_map.f.W = ['SudoWrite', 'sudo write']
        let g:leader_map.f.d = ['Remove', 'delete buffer']
        let g:leader_map.f.E = ['call functions#ExecuteWithInput("SudoEdit", "sudo edit", "file")', 'sudo edit']
        let g:leader_map.f.r = ['call functions#ExecuteWithInput("Rename", "rename", "file")', 'rename']
        let g:leader_map.f.m = ['call functions#ExecuteWithInput("Move", "move", "file")', 'move']
        let g:leader_map.f.c = ['call functions#ExecuteWithInput("Chmod", "chmod")', 'chmod']
        let g:leader_map.f.M = ['call functions#ExecuteWithInput("Mkdir!", "mkdir", "file")', 'mkdir']
        let g:leader_map.f.f = ['call functions#ExecuteWithInput("Find!", "find")', 'find']
        let g:leader_map.f.l = ['call functions#ExecuteWithInput("Locate!", "locate")', 'locate']
    endif
endif

if dein#tap('leader-guide')
    let g:leader_map.f.e = {'name': '[edit]'}
    let g:leader_map.f.e.v = ['e $MYVIMRC', 'edit vimrc']
    let g:leader_map.f.e.b = ['e ~/.bashrc', 'edit bashrc']
    let g:leader_map.f.e.t = ['e ~/.tmux.conf', 'edit tmux.conf']

    let g:leader_map.f.s = {'name': '[source]'}
    let g:leader_map.f.s.s = ['so %', 'source current file']
    let g:leader_map.f.s.v = ['so $MYVIMRC', 'source vimrc']

    if dein#tap('nerdtree')
        let g:leader_map.f.t = ['ProjectRootExe NERDTreeToggle', 'NERDTree']
    endif

    if dein#tap('ultisnips')
        let g:leader_map.f.e.s = ['UltiSnipsEdit', 'edit snippets']
    endif

    if dein#tap('eunuch')
        let g:leader_map.f.W = ['SudoWrite', 'sudo write']
        let g:leader_map.f.d = ['Remove', 'delete buffer']
        let g:leader_map.f.E = ['call feedkeys(":SudoEdit ")', 'sudo edit']
        let g:leader_map.f.r = ['call feedkeys(":Rename ")', 'rename']
        let g:leader_map.f.m = ['call feedkeys(":Move ")', 'move']
        let g:leader_map.f.c = ['call feedkeys(":Chmod ")', 'chmod']
        let g:leader_map.f.M = ['call feedkeys(":Mkdir! ")', 'mkdir']
        let g:leader_map.f.f = ['call feedkeys(":Find! ")', 'find']
        let g:leader_map.f.l = ['call feedkeys(":Locate! ")', 'locate']
    endif
endif

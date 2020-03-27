if dein#tap('nerdtree')
    let g:NERDTreeHijackNetrw=1
    let g:NERDTreeMouseMode=2
    let g:NERDTreeRespectWildIgnore=1
    let g:NERDTreeCreatePrefix='silent keepalt keepjumps'
    let g:NERDTreeWinPos="left"
    let g:NERDTreeMinimalUI=1
    let g:NERDTreeAutoDeleteBuffer=1
    let g:NERDTreeIgnore=[
                \   '.git',
                \   '.cache', 'bundle',
                \   '_build', 'deps',
                \   'node_modules'
                \]

    let g:NERDTreeIndicatorMapCustom = {
                \ 'Modified':  '·',
                \ 'Staged':    '‧',
                \ 'Untracked': '?',
                \ 'Renamed':   '≫',
                \ 'Unmerged':  '≠',
                \ 'Deleted':   '✃',
                \ 'Dirty':     '⁖',
                \ 'Clean':     '✓',
                \ 'Unknown':   '⁇'
                \ }
endif

if dein#tap('nerdtree')
    let g:NERDTreeHijackNetrw=1
    let g:NERDTreeMouseMode=2
    let g:NERDTreeRespectWildIgnore=1
    let g:NERDTreeCreatePrefix='silent keepalt keepjumps'
    let g:NERDTreeWinPos="left"
    let g:NERDTreeMinimalUI=1
    let g:NERDTreeAutoDeleteBuffer=1
    " let g:NERDTreeQuitOnOpen=1
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

if dein#tap('fzf')
    let g:fzf_command_prefix='Fzf'
    let g:fzf_history_dir = '~/.local/share/fzf-history'
    let g:fzf_action = {
                \ 'ctrl-t': 'tab split',
                \ 'ctrl-s': 'split',
                \ 'ctrl-v': 'vsplit' }

    let g:fzf_layout = { 'down': '~40%' }

    let g:fzf_layout = { 'window': 'enew' }
    let g:fzf_layout = { 'window': '-tabnew' }
    let g:fzf_layout = { 'window': '10split enew' }

    let g:fzf_colors = {
                \ 'fg':      ['fg', 'Normal'],
                \ 'bg':      ['bg', 'Normal'],
                \ 'hl':      ['fg', 'Comment'],
                \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
                \ 'hl+':     ['fg', 'Statement'],
                \ 'info':    ['fg', 'PreProc'],
                \ 'border':  ['fg', 'Ignore'],
                \ 'prompt':  ['fg', 'Conditional'],
                \ 'pointer': ['fg', 'Exception'],
                \ 'marker':  ['fg', 'Keyword'],
                \ 'spinner': ['fg', 'Label'],
                \ 'header':  ['fg', 'Comment']
                \ }

    let g:rg_command_grep = '
                \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
                \ -g "!*.{a,lock,png,jpg,jpeg,ico,svg}"
                \ -g "!{.git,.cache,node_modules,bundle,build,pkg,vendor,third_party,bin,dist}/*" '
    command! -bang -nargs=* FzfRipgrep call fzf#vim#grep(g:rg_command_grep .shellescape(<q-args>), 1, <bang>0)
endif

if dein#tap('list-toggle')
    let g:lt_height=5
    let g:lt_location_list_toggle_map = '<leader>ol'
    let g:lt_quickfix_list_toggle_map = '<leader>oq'
endif

if dein#tap('nerdtree')
    let g:NERDTreeHijackNetrw=1
    let g:NERDTreeMouseMode=2
    let g:NERDTreeRespectWildIgnore=1
    let g:NERDTreeCreatePrefix='silent keepalt keepjumps'
    let g:NERDTreeWinPos="left"
    let g:NERDTreeMinimalUI=1
    let g:NERDTreeAutoDeleteBuffer=1
    let g:NERDTreeIgnore=['_build', 'deps']
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

" if dein#tap('fzf')
"     let g:fzf_command_prefix='Fzf'
"     let g:fzf_history_dir = '~/.local/share/fzf-history'
"     let g:fzf_action = {
"                 \ 'ctrl-t': 'tab split',
"                 \ 'ctrl-s': 'split',
"                 \ 'ctrl-v': 'vsplit' }
"
"     let g:fzf_layout = { 'down': '~40%' }
"
"     let g:fzf_layout = { 'window': 'enew' }
"     let g:fzf_layout = { 'window': '-tabnew' }
"     let g:fzf_layout = { 'window': '10split enew' }
"
"     let g:fzf_colors = {
"                 \ 'fg':      ['fg', 'Normal'],
"                 \ 'bg':      ['bg', 'Normal'],
"                 \ 'hl':      ['fg', 'Comment'],
"                 \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"                 \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"                 \ 'hl+':     ['fg', 'Statement'],
"                 \ 'info':    ['fg', 'PreProc'],
"                 \ 'border':  ['fg', 'Ignore'],
"                 \ 'prompt':  ['fg', 'Conditional'],
"                 \ 'pointer': ['fg', 'Exception'],
"                 \ 'marker':  ['fg', 'Keyword'],
"                 \ 'spinner': ['fg', 'Label'],
"                 \ 'header':  ['fg', 'Comment']
"                 \ }
"
"     let g:rg_command_grep = '
"                 \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
"                 \ -g "!*.{a,lock,png,jpg,jpeg,ico,svg}"
"                 \ -g "!{.git,.cache,node_modules,bundle,build,pkg,vendor,third_party,bin,dist,target,_build,deps}/*" '
"     command! -bang -nargs=* FzfRipgrep call fzf#vim#grep(g:rg_command_grep .shellescape(<q-args>), 1, <bang>0)
" endif

if dein#tap('ctrlp')
    let g:ctrlp_map = ''
    let g:ctrlp_cache_dir=$EDITOR_ROOT . '/.cache/ctrlp'
    let g:ctrlp_clear_cache_on_exit=0
    let g:ctrlp_regexp=0
    let g:ctrlp_root_markers=g:root_markers
    let g:ctrlp_show_hidden=0
    let g:ctrlp_max_files=10000
    let g:ctrlp_max_depth=40
    let g:ctrlp_open_new_file='v'
    let g:ctrlp_arg_map=1
    let g:ctrlp_follow_symlinks=1
    let g:ctrlp_lazy_update=0

    let g:ctrlp_custom_ignore = {
                \ 'dir': '\v[\/](\.git|node_modules|build|bundle|dist|tmp|third_party|vendor|_build|deps|pkg|bin)$',
                \ }
endif

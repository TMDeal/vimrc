let s:flagInfo = {
\   '-I': {
\     'pattern': '-I\s*',
\     'output': '-I'
\   },
\   '-isystem': {
\     'pattern': '-isystem\s*',
\     'output': '-isystem'
\   },
\   '-F': {
\     'pattern': '-F\s*',
\     'output': '-F'
\   },
\   '-include': {
\     'pattern': '-include\s\+',
\     'output': '-include '
\   }
\ }

let s:flagPatterns = []
for s:flag in values(s:flagInfo)
  let s:flagPatterns = add(s:flagPatterns, s:flag.pattern)
endfor
let s:flagPattern = '\%(' . join(s:flagPatterns, '\|') . '\)'

function! s:processFilename(filename, root)
    " Handle Unix absolute path
    if matchstr(a:filename, '\C^[''"\\]\=/') != ''
        let l:filename = a:filename
        " Handle Windows absolute path
    elseif has('win32') 
                \ && matchstr(a:filename, '\C^"\=[a-zA-Z]:[/\\]') != ''
        let l:filename = a:filename
        " Convert relative path to absolute path
    else
        " If a windows file, the filename may need to be quoted.
        if has('win32')
            let l:root = substitute(a:root, '\\', '/', 'g')
            if matchstr(a:filename, '\C^".*"\s*$') == ''
                let l:filename = substitute(a:filename, '\C^\(.\{-}\)\s*$'
                            \ , '"' . l:root . '\1"', 'g')
            else
                " Strip first double-quote and prepend the root.
                let l:filename = substitute(a:filename, '\C^"\(.\{-}\)"\s*$'
                            \ , '"' . l:root . '\1"', 'g')
            endif
            let l:filename = substitute(l:filename, '/', '\\', 'g')
        else
            " For Unix, assume the filename is already escaped/quoted correctly
            let l:filename = shellescape(a:root) . a:filename
        endif
    endif
    return l:filename
endfunction

function! clang#Config()
    let l:user_options = []
    let l:include_dirs = []
    let l:local_conf = findfile('.clang_complete', getcwd() . ',.;')
    if l:local_conf == '' || !filereadable(l:local_conf)
        return ''
    endif

    let l:sep = '/'
    if has('win32')
        let l:sep = '\'
    endif

    let l:root = fnamemodify(l:local_conf, ':p:h') . l:sep

    let l:opts = readfile(l:local_conf)
    for l:opt in l:opts
        " Ensure passed filenames are absolute. Only performed on flags which
        " require a filename/directory as an argument, as specified in s:flagInfo
        if matchstr(l:opt, '\C^\s*' . s:flagPattern . '\s*') != ''
            let l:flag = substitute(l:opt, '\C^\s*\(' . s:flagPattern . '\).*'
                        \ , '\1', 'g')
            let l:flag = substitute(l:flag, '^\(.\{-}\)\s*$', '\1', 'g')
            let l:filename = substitute(l:opt,
                        \ '\C^\s*' . s:flagPattern . '\(.\{-}\)\s*$',
                        \ '\1', 'g')
            let l:filename = s:processFilename(l:filename, l:root)

            let l:opt = s:flagInfo[l:flag].output . l:filename
            let l:include_dirs += [l:filename]
        endif

        let l:user_options += [l:opt]

    endfor

    let result = {
                \'all': user_options,
                \'dirs': include_dirs,
                \}

    return result
endfunction


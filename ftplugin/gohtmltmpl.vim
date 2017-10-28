setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2

setlocal omnifunc=htmlcomplete#CompleteTags

if dein#tap('context-filetype')
    let g:context_filetype#filetypes={}
    let g:context_filetype#filetypes.gohtmltmpl=[
                \{
                \ 'start':
                \  '<script\%( [^>]*\)\? type="text/javascript"\%( [^>]*\)\?>',
                \ 'end': '</script>', 'filetype': 'javascript',
                \},
                \{
                \ 'start':
                \  '<script\%( [^>]*\)\? type="text/coffeescript"\%( [^>]*\)\?>',
                \ 'end': '</script>', 'filetype': 'coffee',
                \},
                \{
                \ 'start':
                \  '<script\%( [^>]*\)\?>',
                \ 'end': '</script>', 'filetype': 'javascript',
                \},
                \{
                \ 'start':
                \  '<style\%( [^>]*\)\?>',
                \ 'end': '</style>', 'filetype': 'css',
                \},
                \{
                \ 'start':
                \  '<[^>]\+ style="',
                \ 'end': '"', 'filetype': 'css',
                \}
                \]
endif

vnoremap H ^
vnoremap L $

"indent in visual mode and maintain cursor position
vnoremap <silent> > md>`d:delm d<cr>gv
vnoremap <silent> < md<`d:delm d<cr>gv

augroup phoenix
  autocmd!

  " Setup when openening a file without a filetype
  autocmd BufNewFile,BufReadPost *
    \ if empty(&filetype) |
    \   call phoenix#Setup() |
    \ endif

  " Setup when launching Vim for a file with any filetype
  autocmd FileType * call phoenix#Setup()

  " Setup when launching Vim without a buffer
  autocmd VimEnter *
    \ if expand('<amatch>') == '' |
    \   call phoenix#Setup() |
    \ endif
augroup end

augroup phoenix_projections
  autocmd!
  autocmd User ProjectionistDetect call phoenix#Projectionist()
augroup END

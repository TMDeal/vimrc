" augroup django
"   autocmd!
"
"   " Setup when openening a file without a filetype
"   autocmd BufNewFile,BufReadPost *
"     \ if empty(&filetype) |
"     \   call django#Setup() |
"     \ endif
"
"   " Setup when launching Vim for a file with any filetype
"   autocmd FileType * call django#Setup()
"
"   " Setup when launching Vim without a buffer
"   autocmd VimEnter *
"     \ if expand('<amatch>') == '' |
"     \   call django#Setup() |
"     \ endif
" augroup end

augroup django_projections
  autocmd!
  autocmd User ProjectionistDetect call django#Projectionist()
augroup END

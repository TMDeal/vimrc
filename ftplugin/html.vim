augroup my_autocmds
    autocmd VimEnter * if exists(projectroot#guess() . '/angular.json') != '' | call angular_cli#init() | endif
augroup END

setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2

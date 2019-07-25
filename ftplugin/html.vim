augroup my_autocmds
    autocmd VimEnter * if exists(projectroot#guess() . '/angular.json') != '' | call angular_cli#init() | endif
augroup END

setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4

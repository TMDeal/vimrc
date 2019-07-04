function! s:makeProjections() abort
    let name = substitute(projectroot#guess(), '^.*/', '', '')
    echo name
    let projections = {
                \ name . "/settings.py": {
                \   "type": "settings"
                \ },
                \
                \ "*/urls.py": {
                \   "type": "urls",
                \   "alternate": "{}/tests/test_urls.py"
                \ },
                \
                \ "*/tests/test_urls.py": {
                \   "alternate": "{}/urls.py"
                \ },
                \
                \ "*/views.py": {
                \   "type": "views",
                \   "alternate": "{}/tests/test_views.py"
                \ },
                \
                \ "*/tests/test_views.py": {
                \   "alternate": "{}/views.py"
                \ },
                \
                \ "*/admin.py": {
                \   "type": "admin"
                \ },
                \
                \ "*/forms.py": {
                \   "type": "forms",
                \   "alternate": "{}/tests/test_forms.py"
                \ },
                \
                \ "*/tests/test_forms.py": {
                \   "alternate": "{}/forms.py"
                \ },
                \
                \ "*/models.py": {
                \   "type": "models",
                \   "alternate": "{}/tests/test_models.py"
                \ },
                \
                \ "*/tests/test_models.py": {
                \   "alternate": "{}/models.py"
                \ },
                \
                \ "*/middleware.py": {
                \   "type": "middleware",
                \   "alternate": "{}/tests/test_middleware.py"
                \ },
                \
                \ "*/tests/test_middleware.py": {
                \   "alternate": "{}/middleware.py"
                \ },
                \
                \ "*.html": {
                \   "type": "templates"
                \ }
                \ }

    return projections
endfunction

function! django#Projectionist() abort
    let projections = s:makeProjections()
    if exists('b:is_django')
        call projectionist#append(projectroot#guess(), projections)
    endif
endfunction


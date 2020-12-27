let g:ale_statusline_format = ['x %d', '⚠ %d', 'ok']

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_fix_on_save = 1
let g:ale_virtualtext_cursor = 1

" let g:ale_pattern_options = {
"   '\.cpp$': { 'ale_' }
" }
" let g:ale_cpp_gcc_options = '-std=c++14 -Wall'
let g:ale_linters = {
\   'cpp': ['clang'],
\   'python': ['flake8', 'mypy'],
\   'tex': ['chktex', 'lacheck'],
\   'plaintex': ['chktex', 'lacheck'],
\   'markdown': ['textlint'],
\}

" let g:ale_fixers = {
"    \ 'python': ['autopep8', 'black'],
"    \ }

" 各ツールの実行オプションを変更してPythonパスを固定
let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_autopep8_executable = g:python3_host_prog
let g:ale_python_autopep8_options = '-m autopep8'
let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort'
let g:ale_python_black_executable = g:python3_host_prog
let g:ale_python_black_options = '-m black'

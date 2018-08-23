let g:ale_statusline_format = ['x %d', '⚠ %d', 'ok']

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" let g:ale_pattern_options = {
"   '\.cpp$': { 'ale_' }
" }
" let g:ale_cpp_gcc_options = '-std=c++14 -Wall'
let g:ale_linters = {
\   'cpp': ['clang'],
\}

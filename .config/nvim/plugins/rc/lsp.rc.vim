if executable('pyls')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': {server_info->['pyls']},
      \ 'whitelist': ['python'],
      \ })
endif

let s:jdt_path = '~/lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.300.v20190213-1655.jar'
if executable('java') && filereadable(expand(s:jdt_path))
    au User lsp_setup call lsp#register_server({
       \ 'name': 'eclipse.jdt.ls',
       \ 'cmd': {server_info->[
       \     'java',
       \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
       \     '-Dosgi.bundles.defaultStartLevel=4',
       \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
       \     '-Dlog.level=ALL',
       \     '-noverify',
       \     '-Dfile.encoding=UTF-8',
       \     '-Xmx1G',
       \     '-jar',
       \     expand(s:jdt_path),
       \     '-configuration',
       \     expand('~/lsp/eclipse.jdt.ls/config_linux'),
       \     '-data',
       \     expand('~/lsp/eclipse.jdt.ls/workspace')
       \ ]},
       \ 'whitelist': ['java'],
       \ })
endif

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif

let lsp_diagnostics_enabled = 0
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 0

let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}

nnoremap <silent> <C-L>h :LspHover<CR>
nnoremap <silent> <C-L>d :LspDefinition<CR>
nnoremap <silent> <C-L>r :LspRename<CR>
nnoremap <silent> <F3> :LspDocumentFormat<CR>

"""
" " Debug logging
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')

" for asyncomplete.vim log
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

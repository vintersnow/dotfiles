if executable('pyls')
  aug LspPython
    au!
    au User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': {server_info->['pyls']},
      \ 'whitelist': ['python'],
      \ })
  aug END
endif

let s:jdt_path = '~/lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.300.v20190213-1655.jar'
if executable('java') && filereadable(expand(s:jdt_path))
  aug LspJava
    au!
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
  aug END
endif

if executable('rls')
  aug LspRust
    au!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
  aug END
endif

let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}

nnoremap <silent> <C-K>h :LspHover<CR>
nnoremap <silent> <C-K>d :LspDefinition<CR>
nnoremap <silent> <C-K>r :LspRename<CR>
nnoremap <silent> <F3> :LspDocumentFormat<CR>


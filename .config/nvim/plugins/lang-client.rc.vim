set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'python': ['pyls'],
    \ 'cpp': ['cquery', '--language-server', '--log-file=/tmp/cq.log'],
    \ 'javascript.jsx': ['/usr/bin/javascript-typescript-stdio']
    \ }

    " \ 'go': ['go-langserver'],
    " \ 'javascript.jsx': ['node', '/home/vinter/Projects/stuff/langserver/javascript-typescript-langserver/lib/language-server-stdio.js'],

let g:LanguageClient_settingsPath = '/home/vinter/.config/nvim/settings.json'
let g:LanguageClient_loadSettings = 1


" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> <C-K>h :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <C-K>d :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <C-K>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <F3> :call LanguageClient_textDocument_formatting()<CR>

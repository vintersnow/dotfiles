"---------------------------------------------------------------------------
" deoplete.nvim

let g:deoplete#enable_at_startup = 1

" if !exists('g:deoplete#omni#input_patterns')
"   let g:deoplete#omni#input_patterns = {}
" endif

" let g:deoplete#disable_auto_complete = 1
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" tern
" if dein#tap('tern_for_vim')
"   let g:tern_show_argument_hints = 'on_hold'
"   let g:tern_show_signature_in_pum = 1
"   autocmd FileType javascript setlocal omnifunc=tern#Complete
" endif
"
" let g:tern_request_timeout = 1
" echomsg 'load file'
let g:tern#command = ['tern', '--no-port-file']
" echomsg g:tern#command

" deoplete-clang "{{{
" if has('mac')
"   " you need to
"   " libclang shared library path
"   let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/3.8.1/lib/libclang.dylib'
"
"   " clang builtin header path
"   let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/3.8.1/lib/clang'
"
"   " libclang default compile flags
"   let g:deoplete#sources#clang#flags = [
"     \ '-cc1',
"     \ '-triple', 'x86_64-apple-macosx10.11.0',
"     \ '-Wdeprecated-objc-isa-usage',
"     \ '-Werror=deprecated-objc-isa-usage',
"     \ '-E',
"     \ '-disable-free',
"     \ '-disable-llvm-verifier',
"     \ '-main-file-name', 
"     \ '-', 
"     \ '-mrelocation-model', 'pic', '-pic-level', '2',
"     \ '-mthread-model', 'posix',
"     \ '-mdisable-fp-elim',
"     \ '-masm-verbose',
"     \ '-munwind-tables',
"     \ '-target-cpu', 'core2',
"     \ '-target-linker-version', '264.3.102',
"     \ '-v',
"     \ '-dwarf-column-info',
"     \ '-debugger-tuning=lldb',
"     \ '-resource-dir', '/usr/local/Cellar/llvm/3.8.1/bin/../lib/clang/3.8.1',
"     \ '-I.',
"     \ '-I/Users/vinter/.local/include',
"     \ '-I/Users/vinter/.local/include',
"     \ '-stdlib=libc++',
"     \ '-fdeprecated-macro',
"     \ '-fdebug-compilation-dir', '/usr/local/Cellar/llvm/3.8.1',
"     \ '-ferror-limit', '19',
"     \ '-fmessage-length', '103',
"     \ '-stack-protector', '1',
"     \ '-fblocks',
"     \ '-fobjc-runtime=macosx-10.11.0',
"     \ '-fencode-extended-block-signature',
"     \ '-fcxx-exceptions',
"     \ '-fexceptions',
"     \ '-fmax-type-align=16',
"     \ '-fdiagnostics-show-option',
"     \ '-fcolor-diagnostics',
"     \ '-o', '-', '-x', 'c++'
"     \ ]
"
"   " compile_commands.json directory path
"   " Not file path. Need build directory path
"   " let g:deoplete#sources#clang#clang_complete_database =
"   "       \ expand('~/src/neovim/build')
" endif
"}}}

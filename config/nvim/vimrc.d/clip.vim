if system('uname -a | grep Microsoft') != ""
  let g:clipboard = {
          \   'name': 'myClipboard',
          \   'copy': {
          \      '+': 'win32yank.exe -i',
          \      '*': 'win32yank.exe -i',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o',
          \      '*': 'win32yank.exe -o',
          \   },
          \   'cache_enabled': 1,
          \ }
endif

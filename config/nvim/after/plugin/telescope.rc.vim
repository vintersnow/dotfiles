if !exists('g:loaded_telescope') | finish | endif

" nnoremap <silent> ;f <cmd>Telescope find_files<cr>
" nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
" nnoremap <silent> \\ <cmd>Telescope buffers<cr>
" nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
nnoremap [Leader]ff <cmd>Telescope find_files<cr>
nnoremap [Leader]fg <cmd>Telescope live_grep<cr>
nnoremap [Leader]fb <cmd>Telescope buffers<cr>
nnoremap [Leader]fh <cmd>Telescope help_tags<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF


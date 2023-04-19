if !exists('g:loaded_telescope')
  echom "Skip loading telescope config"
  finish
endif

" nnoremap <silent> ;f <cmd>Telescope find_files<cr>
" nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
" nnoremap <silent> \\ <cmd>Telescope buffers<cr>
" nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
nnoremap [Leader]ff <cmd>Telescope find_files<cr>
nnoremap [Leader]fg <cmd>Telescope live_grep<cr>
nnoremap [Leader]fb <cmd>Telescope buffers<cr>
nnoremap [Leader]fh <cmd>Telescope help_tags<cr>
nnoremap [Leader]tr <cmd>Telescope registers<cr>
" nnoremap <expr> [leader]fw ':Telescope find_files<cr>' . "'" . expand('<cword>')


lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
local telescope = require('telescope')
telescope.setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
telescope.load_extension('harpoon')
EOF


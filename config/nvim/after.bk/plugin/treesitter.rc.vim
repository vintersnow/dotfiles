function s:configure() abort

if !exists('g:loaded_nvim_treesitter')
  echom "Skip loading treesitter config"
  return
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "json",
    "yaml",
    "swift",
    "html",
    "scss"
  },
}

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
EOF

endfunction


" augroup SetupNvimTreesitter
"     autocmd!
"     autocmd User JetpackNvimTreesitterPre echom "Lazy will load treesitter!"
"     autocmd User JetpackNvimTreesitterPost echom "Lazy did loaded treesitter!"
"     autocmd User JetpackNvimTreesitterPost call s:configure()
" augroup END

call s:configure()

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- plugins = require('plugins/core')

require('lazy').setup({
  spec = {
    -- { import = "plugins.core" },
    { import = "plugins.whichkey" },
    { import = "plugins.ui" },
    { import = "plugins.treesitter"},
    { import = "plugins.lsp" },
    { import = "plugins.avante" },
    { import = "plugins.flutter" },
    { import = "plugins.git" },
    { import = "plugins.tool" },
    { import = "plugins.oil" },
    { import = "plugins.overseer" },
    { import = "plugins.editor" },
    { import = "plugins.skk" },
    { import = "plugins.snippet" },
  },
})

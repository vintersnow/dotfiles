return {
  "dstein64/vim-startuptime",
  lazy = true,
  cmd = { "StartupTime" },
  config = function()
    vim.g.startuptime_default_cmds = { "StartupTime" }
    vim.g.startuptime_tries = 5
  end,
}

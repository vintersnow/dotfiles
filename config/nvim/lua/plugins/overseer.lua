return {
  {
    "stevearc/overseer.nvim",
    keys = {
      { "<leader>r", "<CMD>OverseerRun<CR>" },
      { "<leader>R", "<CMD>OverseerToggle<CR>" },
    },
    cmd = { "OverseerRun", "OverseerToggle" },
    opts = {
      templates = {
        "builtin",
        "python.run",
        "python.format",
        "python.lint",
      },
    },
  },
}

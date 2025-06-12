return {
  {
    "stevearc/overseer.nvim",
    keys = {
      { "<leader>r", "<CMD>OverseerRun<CR>" },
      { "<leader>R", "<CMD>OverseerToggle<CR>" },
    },
    cmd = { "OverseerRun", "OverseerToggle" },
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
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

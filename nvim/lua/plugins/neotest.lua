return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "olimorris/neotest-rspec",
  },

  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rspec"),
      },
    })

    vim.api.nvim_set_keymap("n", "<C-t>", ':lua require("neotest").run.run()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap(
      "n",
      "<Leader>tu",
      ':lua require("neotest").run.run()<CR>',
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<Leader>td",
      ":lua require(\"neotest\").run.run({ strategy = 'dap' })<CR>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<Leader>tf",
      ':lua require("neotest").run.run(vim.fn.expand("%")<CR>',
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<Leader>to",
      ':lua require("neotest").output.open()<CR>',
      { noremap = true, silent = true }
    )
  end,
}

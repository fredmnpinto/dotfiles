return {
  "stevearc/conform.nvim",
  -- enabled = false,
  optional = true,
  opts = {
    formatters_by_ft = {
      ruby = { "rubocop" },
      eruby = { "erb_format" },
    },
  },
}

return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
  },
  opts = {
    ensure_installed = {
      "erb-formatter",
      "erb-lint",
      "tailwindcss-language-server",
    },
  },
}

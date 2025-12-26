local lspconfig = require("lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Useful for debugging formatter issues
      format_notify = true,
      inlay_hints = { enabled = false },
      servers = {
        bashls = {},
        denols = {},
        diagnosticls = {},
        dockerls = {},
        helm_ls = {},
        jsonls = {},
        jsonnet_ls = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
        marksman = {},
        pyright = {},
        -- regols is not maanged by Mason. i install it with `brew install kitagry/tap/regols`.
        -- See: https://github.com/kitagry/regols
        regols = {},
        ruby_lsp = {
          cmd = { "bundle", "exec", "ruby-lsp" },
          formatters = { "" },
        },
        rubocop = {
          -- See: https://docs.rubocop.org/rubocop/usage/lsp.html
          cmd = { "bundle", "exec", "rubocop", "--lsp" },
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
        },
        -- solargraph = {
        --   cmd = { "bundle", "exec", "solargraph" },
        -- },
        sqlls = {},
        terraformls = {},
        tsserver = {},
        yamlls = {},
        tailwindcss = {
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  'class="([^"]*)"',
                  "class:\\s*'([^']*)'",
                  'class:\\s*"([^"]*)"',
                },
              },
            },
          },
        },
      },
    },
  },
}

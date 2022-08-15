-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "onenord",
}

M.plugins = {
  user = {
    ["goolord/alpha-nvim"] = {
      disable = false,
    },
    ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.plugins.lspconfig"
      end,
    },
    ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
        require "custom.plugins.null-ls"
      end,
    },
    ["NvChad/nvterm"] = {
      module = "nvterm",
      config = function()
        require "custom.plugins.nvterm"
      end,
      setup = function()
        require("core.utils").load_mappings "nvterm"
      end,
    },
  },
  override = {
    ["williamboman/mason.nvim"] = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        "css-lsp",
        "html-lsp",
        "rust-analyzer",
        "pyright",

        -- shell
        "shfmt",
        "shellcheck",

        -- sql
        "sqls",
      },
    },
  },
}

return M

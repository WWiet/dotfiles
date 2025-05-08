return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = false, -- Disable virtual text for LazyVim's LSP
      underline = true,
      signs = false,
      -- signs = {
      --   text = {
      --     [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
      --     [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
      --     [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
      --     [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
      --   },
      -- },
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = false,
        exclude = { "" }, -- filetypes for which you don't want to enable inlay hints
      },
      -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the code lenses.
      codelens = {
        enabled = false,
      },
      -- add any global capabilities here
      capabilities = {
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
      },
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
    },
    servers = {
      yamlls = {
        settings = {
          yaml = {
            schemas = {
              ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = "/*.yaml",
            },
            customTags = {
              "!Ref scalar",
              "!GetAtt scalar",
              "!Sub scalar",
              "!Join sequence",
              "!If sequence",
              "!Not sequence",
              "!And sequence",
              "!Or sequence",
              "!FindInMap sequence",
              "!ImportValue scalar",
              "!Select sequence",
              "!Split sequence",
              "!Equals sequence",
              "!Condition scalar",
            },
          },
        },
      },
    },
  },
}

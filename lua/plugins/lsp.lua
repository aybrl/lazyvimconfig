return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
          },
        },
      },
      clangd = {},
      gopls = {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
          },
        },
      },
      terraformls = {
        settings = {},
      },
    },
  },
  config = function(_, opts)
    vim.filetype.add({
      extension = {
        tf = "terraform",
        tfvars = "terraform",
      },
    })
    require("lspconfig").terraformls.setup({
      filetypes = { "terraform", "hcl", "tf", "tfvars" },
      settings = opts.servers.terraformls.settings,
    })
    require("lspconfig").gopls.setup(opts.servers.gopls)
    require("lspconfig").clangd.setup(opts.servers.clangd)
    require("lspconfig").rust_analyzer.setup(opts.servers.rust_analyzer)
  end,
}

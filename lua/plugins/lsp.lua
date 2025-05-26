return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      rust_analyzer = {
        settings = {
          rust = {
            analysis = {
              typecheckingmode = "strict",
            },
          },
        },
      },
      clangd = {
        settings = {
          clang = {
            analysis = {
              typecheckingmode = "strict",
            },
          },
        },
      },
      gopls = {
        settings = {
          go = {
            analysis = {
              typecheckingmode = "strict",
            },
          },
        },
      },
    },
  },
}

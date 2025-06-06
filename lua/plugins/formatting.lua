return { -- Autoformat
  "stevearc/conform.nvim",
  lazy = false,
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    notify_on_error = true,
    formatters_by_ft = {
      lua = { "stylua" },
      sh = { "shfmt" },
      html = { "djlint" },
      go = { "gofmt", "goimports" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      cmake = { "cmake_format" },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { { "prettierd", "prettier" } },
    },
    formatters = {
      clang_format = {
        prepend_args = { "--style=file:/home/angiko/.config/nvim/.clang-format", "--fallback-style=google" },
      },
      shfmt = {
        prepend_args = { "-i", "4" },
      },
      cmake_format = { prepend_args = { "--tab-size 4" } },
    },
  },
}

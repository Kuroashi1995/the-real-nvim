require'nvim-treesitter.configs'.setup{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "typescript", "tsx", "javascript", "lua" },
      highlight = { enable = true },
    })
  end
}

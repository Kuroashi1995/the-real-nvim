return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- or nvim-tree/nvim-web-devicons
    opts = {
        checkbox = {
            enable = true,
            position = "inline", -- Inline forces it to replace the [ ] text completely
            unchecked = { icon = "󰄱 " },
            checked = { icon = " " },
        },
    },
}

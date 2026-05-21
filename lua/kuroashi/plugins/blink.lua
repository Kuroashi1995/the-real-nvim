return {
    { "L3MON4D3/LuaSnip", keys = {} },
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        version = "*",
        build = 'cargo build --release',
        config = function()
            require("blink.cmp").setup({
                snippets = { preset = "luasnip" },
                signature = { enabled = true },
                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = "normal",
                },
                sources = {
                    default = { "lsp", "path", "snippets" },
                    providers = {
                        cmdline = {
                            min_keyword_length = 2,
                        },
                    },
                },
                -- This is the only section we are modifying
                keymap = {
                    preset = 'none', 

                    -- Manual trigger (safe from Space-leader timeouts)
                    ['<C-x>'] = { 'show', 'show_documentation', 'hide_documentation' }, 
                    ['<C-e>'] = { 'hide', 'fallback' },

                    -- Confirm selection with your preferred key
                    ['<C-y>'] = { 'accept', 'fallback' },
                    ['<CR>']  = { 'accept', 'fallback' }, -- Kept as a safe fallback

                    -- FIX: Classic Vim navigation keys restored for blink
                    ['<C-n>'] = { 'select_next', 'fallback' },
                    ['<C-p>'] = { 'select_prev', 'fallback' },

                    -- Scroll the documentation window on the side
                    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
                },
                cmdline = {
                    enabled = false,
                    completion = { menu = { auto_show = true } },
                    keymap = {
                        ["<CR>"] = { "accept_and_enter", "fallback" },
                    },
                },
                completion = {
                    menu = {
                        border = nil,
                        scrolloff = 1,
                        scrollbar = false,
                        draw = {
                            columns = {
                                { "kind_icon" },
                                { "label",      "label_description", gap = 1 },
                                { "kind" },
                                { "source_name" },
                            },
                        },
                    },
                    documentation = {
                        window = {
                            border = nil,
                            scrollbar = false,
                            winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
                        },
                        auto_show = true,
                        auto_show_delay_ms = 500,
                    },
                },
            })

            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}

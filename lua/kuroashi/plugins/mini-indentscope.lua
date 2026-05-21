return {
  'echasnovski/mini.indentscope',
  version = false,
  config = function()
    require('mini.indentscope').setup({
      symbol = "│",
      draw = {
        -- Set delay before drawing (0 means instantly)
        delay = 0,

        -- This is the magic key: set the animation duration to 0 
        -- to disable the drawing/growing effect entirely
        animation = function() return 0 end,
      },
      options = {
        -- Try to anchor to border characters for cleaner placement
        border = 'both', 
      },
    })
  end
}

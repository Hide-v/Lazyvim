return {
  "rebelot/heirline.nvim",
  event = "VeryLazy",
  config = function()
    require("heirline").setup({
      -- 使用相对路径引用
      statusline = require("config.heirline.statusline"),
      tabline = require("config.heirline.tabline"),
    })
  end,
}

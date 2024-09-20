if not vim.g.neovide then
  return {} -- 如果不是 Neovide，会直接返回
end

return {
  -- 配置 Neovide 的选项
  "neovide/neovide",
  config = function()
    -- 设置字体和大小
    vim.o.guifont = "JetBrainsMono Nerd Font:h10"

    -- 设置全局变量 g 的 Neovide 相关配置
    vim.g.neovide_transparency = 0.8 -- 透明度设置
    vim.g.neovide_fullscreen = false -- 是否全屏
    vim.g.neovide_remember_window_size = true -- 记住窗口大小
    vim.g.neovide_input_macos_alt_is_meta = true -- MacOS 用户可以设置 Alt 键为 Meta 键

    -- 设置 Neovide 的缩放比例
    vim.g.neovide_scale_factor = 1.0
    -- 动画效果
    vim.g.neovide_cursor_animation_length = 0.13
    vim.g.neovide_cursor_trail_length = 0.8
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_vfx_mode = "pixiedust" -- 可选择 railgun、torpedo、pixiedust 等

    -- 设置窗口的 padding
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0
  end,
}

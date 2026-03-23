-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- load immediately
    priority = 1000, -- load before other plugins
    config = function()
      vim.cmd("colorscheme tokyonight")
    end,
  },
}

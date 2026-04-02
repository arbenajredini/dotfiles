return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-`>]], -- This sets Ctrl-\ as the toggle key
        shade_terminals = true,
        direction = 'float',      -- Options: 'vertical', 'horizontal', 'float'
        float_opts = {
          border = 'curved',
        },
      })
    end
  }
}

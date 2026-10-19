return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    render_modes = { 'n', 'c', 't' },
    code = {
      conceal_delimiters = false,
      width = 'block',
      left_pad = 2,
      right_pad = 4,
      min_width = 60,
      border = 'thick',
    },
    heading = {
      width = 'block',
      left_pad = 2,
      right_pad = 4,
      min_width = 77,
      border = true,
    },
  },
}

return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    checkbox = {
      checked = {
        scope_highlight = '@markup.strikethrough',
      },
    },
    code = {
      border = 'thick',
      conceal_delimiters = false,
      left_pad = 2,
      min_width = 60,
      right_pad = 4,
      width = 'block',
    },
    heading = {
      border = true,
      left_pad = 2,
      min_width = 77,
      right_pad = 4,
      width = 'block',
    },
    html = {
      comment = {
        conceal = false,
        highlight = 'RenderMarkdownHtmlComment',
      },
    },
    render_modes = { 'n', 'c', 't' },
  },
}

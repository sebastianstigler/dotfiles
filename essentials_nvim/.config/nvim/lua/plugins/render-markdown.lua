return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
  config = function()
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    local opts = {
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
        backgrounds = {
          'RenderMarkdownH1Bg',
          'RenderMarkdownH2Bg',
          'RenderMarkdownH3Bg',
          'RenderMarkdownH4Bg',
          'RenderMarkdownH5Bg',
          'RenderMarkdownH6Bg',
        },
        foregrounds = {
          'RenderMarkdownH1',
          'RenderMarkdownH2',
          'RenderMarkdownH3',
          'RenderMarkdownH4',
          'RenderMarkdownH5',
          'RenderMarkdownH6',
        },
      },
      html = {
        comment = {
          conceal = false,
          highlight = 'RenderMarkdownHtmlComment',
        },
      },
      render_modes = { 'n', 'c', 't' },
    }
    vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { bg = '#503746' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { bg = '#52413E' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { bg = '#524D48' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { bg = '#3D4D45' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { bg = '#304658' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', { bg = '#40445C' })
    require('render-markdown').setup(opts)
  end,
}

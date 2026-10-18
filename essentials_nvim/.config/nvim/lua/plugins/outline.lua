return {
  'hedyhli/outline.nvim',
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })

    require('outline').setup {
      -- Your setup opts here (leave empty to use defaults)
      outline_window = {
        show_coursorline = true,
        hide_coursor = true,
      },
      outline_items = {
        show_symbol_details = true,
        show_symbol_lineno = true,
      },
      symbol_folding = {
        auto_depth = 1,
        auto_unfold = {
          hovered = true,
          only = true,
        },
      },
    }
  end,
}

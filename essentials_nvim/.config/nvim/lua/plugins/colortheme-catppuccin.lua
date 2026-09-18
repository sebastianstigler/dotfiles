return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    local catppuccin = require 'catppuccin'

    -- Initial configuration
    catppuccin.setup {
      transparent_background = true,
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
    }

    -- Set the correct colorscheme name
    vim.cmd.colorscheme 'catppuccin'

    -- State variable to track transparency
    local bg_transparent = true

    local toggle_transparency = function()
      bg_transparent = not bg_transparent

      -- Re-configure and re-load the theme dynamically
      catppuccin.setup {
        transparent_background = bg_transparent,
        flavour = 'mocha',
      }
      vim.cmd.colorscheme 'catppuccin'
    end

    -- Keymap to toggle transparency
    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end,
}

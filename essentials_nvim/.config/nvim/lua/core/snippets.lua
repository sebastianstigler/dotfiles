-- Custom code snippets for different purposes

-- Prevent LSP from overwriting treesitter color settings
-- https://github.com/NvChad/NvChad/issues/1907
--vim.hl.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

-- Appearance of diagnostics
vim.diagnostic.config {
  virtual_text = {
    prefix = '●',
    -- Add a custom format function to show error codes
    format = function(diagnostic)
      local code = diagnostic.code and string.format('[%s]', diagnostic.code) or ''
      return string.format('%s %s', code, diagnostic.message)
    end,
  },
  underline = false,
  update_in_insert = true,
  float = {
    source = true, -- Or "if_many"
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.INFO] = ' ',
      [vim.diagnostic.severity.HINT] = '󰌵 ',
    },
  },
  -- Make diagnostic background transparent
  on_ready = function()
    vim.cmd 'highlight DiagnosticVirtualText guibg=NONE'
  end,
}

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Highlight trailing whitespaces
vim.api.nvim_set_hl(0, 'TrailingWhitespaceNormal', { fg = '#ff3c00', bg = '#cacdd2', bold = true })
vim.api.nvim_set_hl(0, 'TrailingWhitespaceInsert', { fg = '#ff3c00', bg = 'NONE' })
vim.cmd [[match TrailingWhitespace /\s\+$/]]
vim.api.nvim_set_hl(0, 'TrailingWhitespace', { link = 'TrailingWhitespaceNormal' })
vim.api.nvim_create_autocmd('InsertEnter', {
  callback = function()
    vim.opt.listchars.trail = nil
    vim.api.nvim_set_hl(0, 'TrailingWhitespace', { link = 'TrailingWhitespaceInsert' })
  end,
})
vim.api.nvim_create_autocmd('InsertLeave', {
  callback = function()
    vim.opt.listchars.trail = '·'
    vim.api.nvim_set_hl(0, 'TrailingWhitespace', { link = 'TrailingWhitespaceNormal' })
  end,
})

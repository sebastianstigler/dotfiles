-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
opts.desc = 'Save file with auto-formatting'
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)
vim.keymap.set('i', '<C-s>', '<Esc><cmd> w <CR>', opts)

-- save file without auto-formatting
opts.desc = 'Save file without auto-formatting'
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- format file
opts.desc = 'Format file'
vim.keymap.set('n', '<C-f>', vim.lsp.buf.format, { desc = 'Format buffer' })

-- quit file
opts.desc = 'Quit file'
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
opts.desc = 'Delete single character without copying into register'
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
opts.desc = 'Vertical scroll down and center'
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
opts.desc = 'Vertical scroll up and center'
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
opts.desc = 'Find next and center'
vim.keymap.set('n', 'n', 'nzzzv', opts)
opts.desc = 'Find previous and center'
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
opts.desc = 'Reduce height of split window'
vim.keymap.set('n', '<S-Up>', ':resize -2<CR>', opts)
opts.desc = 'Increase height of split window'
vim.keymap.set('n', '<S-Down>', ':resize +2<CR>', opts)
opts.desc = 'Reduce width of split window'
vim.keymap.set('n', '<S-Left>', ':vertical resize -2<CR>', opts)
opts.desc = 'Increase width of split window'
vim.keymap.set('n', '<S-Right>', ':vertical resize +2<CR>', opts)

-- Buffers
opts.desc = 'Go to next buffer'
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
opts.desc = 'Go to previous buffer'
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
opts.desc = 'Close buffer'
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- close buffer
opts.desc = 'New buffer'
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
opts.desc = 'Split window vertically'
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
opts.desc = 'Split window horizontally'
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
opts.desc = 'Make split windows equal width & height'
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
opts.desc = 'Close current split window'
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
opts.desc = 'Navigate between splits: Up'
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
opts.desc = 'Navigate between splits: Down'
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
opts.desc = 'Navigate between splits: Left'
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
opts.desc = 'Navigate between splits: Right'
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
opts.desc = '[T]ab: [O]pen new'
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
opts.desc = '[T]ab: [X] close'
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
opts.desc = '[T]ab: go to [N]ext tab'
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
opts.desc = '[T]ab: go to [P]revious tab'
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
opts.desc = 'Toggle line wrapping'
vim.keymap.set('n', '<leader>wl', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
opts.desc = 'Unindent (stay in indent mode)'
vim.keymap.set('v', '<', '<gv', opts)
opts.desc = 'Indent (stay in indent mode)'
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
opts.desc = 'Keep last yanked when pasting'
vim.keymap.set('v', 'p', '"_dP', opts)

-- Move marked block down(K) / up(J)
opts.desc = 'Move marked block up'
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
opts.desc = 'Move marked block down'
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', '<leader>dt', function()
  vim.diagnostic.config {
    virtual_text = not vim.diagnostic.config().virtual_text,
  }
end, { desc = 'Toggle diagnostic virtual text' })

-- Show changes in an unsaved file to the saved version
vim.api.nvim_create_user_command('DiffOrig', function()
  local current_buf = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(current_buf)

  -- Open a vertical split
  vim.cmd 'vnew'

  local diff_buf = vim.api.nvim_get_current_buf()

  -- Read the saved file
  vim.fn.readfile(file, '', -1)
  vim.api.nvim_buf_set_lines(diff_buf, 0, -1, false, vim.fn.readfile(file))

  vim.bo[diff_buf].buftype = 'nofile'
  vim.bo[diff_buf].bufhidden = 'wipe'
  vim.bo[diff_buf].swapfile = false
  vim.bo[diff_buf].modifiable = false

  vim.cmd 'diffthis'
  vim.cmd 'wincmd p'
  vim.cmd 'diffthis'
end, {})
-- Show diff to last save
opts.desc = 'Show diff to last save'
vim.keymap.set('n', '<F8>', '<cmd>DiffOrig<CR>', opts)
vim.keymap.set('i', '<F8>', '<Esc><cmd>DiffOrig<CR>', opts)
-- Toggle set list
opts.desc = 'Toggle show all whitespace chars'
vim.keymap.set('n', '<leader>l', '<cmd>set list!<CR>', opts)
-- Toggle spell check
opts.desc = 'Toggle spell check'
vim.keymap.set('n', '<F2>', '<cmd>set spell!<CR>', opts)
vim.keymap.set('i', '<F2>', '<Esc><cmd>set spell!<CR>', opts)
-- Toggle spell check languages
vim.api.nvim_create_user_command('SpellLangToggle', function()
  local current_lang = table.concat(vim.opt_local.spelllang:get(), ',')
  if current_lang == 'de,en' then
    vim.opt.spelllang = { 'de' }
  elseif current_lang == 'de' then
    vim.opt.spelllang = { 'en' }
  elseif current_lang == 'en' then
    vim.opt.spelllang = { 'de', 'en' }
  end
end, {})
opts.desc = 'Toggle spelling laguages'
vim.keymap.set('n', '<F26>', '<cmd>SpellLangToggle<CR>', opts) -- C+F2
vim.keymap.set('i', '<F26>', '<Esc><cmd>SpellLangToggle<CR>', opts) -- C+F2

-- Terminal
opts.desc = 'Open [T]erminal'
-- local job_id = 0
vim.keymap.set('n', '<leader>tt', function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd 'J'
  vim.api.nvim_win_set_height(0, 10)
  vim.opt.spell = false
  --job_id = vim.bo.channel
end, opts)

-- vim.keymap.set('n', '<leader>example', function()
--   vim.fn.chansend(job_id, { 'ls -la\r\n' })
-- end)

vim.keymap.set('t', '<C-space>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- Bufferline
map("n","<leader>bl", '<Cmd>ls<CR>', { desc = 'List'}) -- List buffers
map("n","<leader>bo", '<Cmd>enew<CR>', { desc = 'Open new'}) -- Open new buffer
map("n","<leader>bd", '<Cmd>bd<CR>', { desc = 'Delete/close'}) -- Delete active buffer
map("n","<leader>bf", '<Cmd>bd!<CR>', { desc = 'Delete/close (force)'}) -- Delete active buffer even if unsaved changes
map("n","<leader>bn", '<Cmd>bn<CR>', { desc = 'Next'}) -- Next buffer
map("n","<leader>bp", '<Cmd>bp<CR>', { desc = 'Previous'}) -- Previous buffer
map("n","<C-Tab>", '<Cmd>bn<CR>', { desc = 'Next Buffer'}) -- Next buffer shortcut
map("n","<C-S-Tab>", '<Cmd>bp<CR>', { desc = 'Previous Buffer'}) -- Previous buffer shortcut


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

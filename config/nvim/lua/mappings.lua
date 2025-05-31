require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-c>", "<ESC>:noh <CR>", { desc = "Clear Highlights" })

map({ "v" }, ">", ">gv", { desc = "Indent line or selection" })
map({ "v" }, "<", "<gv", { desc = "Indent line or selection" })

map("n", "<leader>d", ":m+1<CR>", { desc = "Move current line down by 1 line" })
map("n", "<leader>u", ":m-2<CR>", { desc = "Move current line up by 1 line" })

-- Don't pollute insert mode move.
-- map("i", "<leader>d", "<ESC>:m+1<CR>", { desc = "Move current line down by 1 line" })
-- map("i", "<leader>u", "<ESC>:m-2<CR>", { desc = "Move current line up by 1 line" })

-- gv restores the visual mode after move.
map("v", "<leader>d", ":m '>+1<CR>gv=gv", { desc = "Move visual block down by 1 line" })
map("v", "<leader>u", ":m '<-2<CR>gv=gv", { desc = "Move visual block up by 1 line" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- <A-h> is already bound to switching tmux pane. rebind to Alt-Shift-V
map({ "n", "t" }, "<A-V>", function()
  require("nvterm.terminal").toggle "horizontal"
end, { desc = "Toggle horizontal terminal" })

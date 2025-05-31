require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- A more complete VIM List Chars
--
-- vim.opt.listchars = {
--   tab = '»',
--   space = '·',
--   nbsp = '␣',
--   extends = '⟩',
--   precedes = '⟨'
-- }

-- Setup for nvim listchars
vim.opt.listchars = {
  tab = "» ",
  space = "·",
}

local function toggle_lcs()
  if vim.opt.list._value == true then
    vim.opt.list = false
  else
    vim.opt.list = true
  end
end

vim.api.nvim_create_user_command("ToggleLcs", function()
  toggle_lcs()
end, {
  nargs = 0,
  desc = "Toggle Vim ListChars",
})

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function title_case()
  local s_row, s_col = unpack(vim.api.nvim_buf_get_mark(0, "<"))
  local e_row, e_col = unpack(vim.api.nvim_buf_get_mark(0, ">"))
  local lines = vim.api.nvim_buf_get_lines(0, s_row - 1, e_row, false)

  if #lines == 0 then
    return
  end

  for i, line in ipairs(lines) do
    lines[i] = line:gsub("(%S+)", function(word)
      return word:sub(1, 1):upper() .. word:sub(2):lower()
    end)
  end

  vim.api.nvim_buf_set_lines(0, s_row - 1, e_row, false, lines)
end

vim.keymap.set("v", "<leader>tc", title_case, { desc = "Title Case Selection" })

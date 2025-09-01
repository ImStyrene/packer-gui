local M = {}
local actions = require("packer-gui.actions")

local function open_window()
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.7)
  local height = math.floor(vim.o.lines * 0.7)
  local opts = {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = (vim.o.lines - height) / 2,
    col = (vim.o.columns - width) / 2,
    border = "rounded",
  }
  vim.api.nvim_open_win(buf, true, opts)
  return buf
end

function M.open()
  local buf = open_window()
  local packer = require("packer")
  local plugins = packer.plugin_names()

  -- write plugin names
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, plugins)

  -- attach keymaps
  actions.attach(buf)
end

return M

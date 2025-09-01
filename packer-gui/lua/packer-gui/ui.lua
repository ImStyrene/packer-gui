local M = {}

-- Create a floating window
local function create_window()
  local buf = vim.api.nvim_create_buf(false, true)

  -- Size and position like Lazy.nvim
  local width = math.floor(vim.o.columns * 0.7)
  local height = math.floor(vim.o.lines * 0.7)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(buf, "filetype", "packer-gui")

  return buf, win
end

-- Example: display plugin list
function M.open()
  local buf, win = create_window()

  local plugins = {
    { name = "nvim-treesitter", status = "✓ installed" },
    { name = "telescope.nvim", status = "✗ not installed" },
    { name = "lualine.nvim", status = "✓ installed" },
  }

  local lines = { "Packer GUI", "============", "" }
  for _, plugin in ipairs(plugins) do
    table.insert(lines, string.format("  %-20s %s", plugin.name, plugin.status))
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Keymaps (q to quit)
  vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>bd!<CR>", { noremap = true, silent = true })
end

return M

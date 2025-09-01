local M = {}

-- helper to create a floating window
local function create_window()
  local buf = vim.api.nvim_create_buf(false, true)

  local width = 40
  local height = 12
  local ui = vim.api.nvim_list_uis()[1]

  local opts = {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = (ui.height - height) / 2,
    col = (ui.width - width) / 2,
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, opts)

  -- ascii content
  local lines = {
    "╭────────────────────────────╮",
    "│        Packer GUI          │",
    "│        ==========          │",
    "│                            │",
    "│   [I] Install Plugins      │",
    "│   [S] Sync Plugins         │",
    "│   [C] Compile              │",
    "│   [U] Update Plugins       │",
    "│   [P] Profile              │",
    "│   [Q] Quit                 │",
    "│                            │",
    "╰────────────────────────────╯",
  }

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, "modifiable", false)
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

  return buf, win
end

function M.open()
  local buf, win = create_window()

  local map = function(lhs, rhs)
    vim.keymap.set("n", lhs, rhs, { buffer = buf, nowait = true, silent = true })
  end

  map("I", function() vim.cmd("PackerInstall") end)
  map("S", function() vim.cmd("PackerSync") end)
  map("C", function() vim.cmd("PackerCompile") end)
  map("U", function() vim.cmd("PackerUpdate") end)
  map("P", function() vim.cmd("PackerProfile") end)
  map("Q", function() vim.api.nvim_win_close(win, true) end)
end

return M

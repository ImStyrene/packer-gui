local M = {}

function M.open()
  -- Create scratch buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- Floating window config
  local width = 49
  local height = 12
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = "minimal",
    border = "rounded",
  }

  -- Open floating window
  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Buffer options
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].modifiable = true

  -- ASCII + menu
  local lines = {
    '',
    '  88""Yb    db     dP""b8 88  dP 888888 88""Yb ',
    '  88__dP   dPYb   dP   `" 88odP  88__   88__dP ',
    '  88"""   dP__Yb  Yb      88"Yb  88""   88"Yb  ',
    '  88     dP""""Yb  YboodP 88  Yb 888888 88  Yb ',
    "  -------------------------------------------- ",
    "                  [S] Sync",
    "                  [I] Install",
    "                  [C] Compile",
    "                  [U] Update",
    "                  [Q] Quit",
  }

  -- Insert content
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false
  vim.bo[buf].readonly = true

  -- Helper function to close GUI safely
  local function close_gui()
    if vim.api.nvim_buf_is_valid(buf) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end

  -- Keymaps
  local opts = { noremap = true, silent = true, buffer = buf }
  vim.keymap.set("n", "S", function() vim.cmd("PackerSync") close_gui() end, opts)
  vim.keymap.set("n", "I", function() vim.cmd("PackerInstall") close_gui() end, opts)
  vim.keymap.set("n", "C", function() vim.cmd("PackerCompile") close_gui() end, opts)
  vim.keymap.set("n", "U", function() vim.cmd("PackerUpdate") close_gui() end, opts)
  vim.keymap.set("n", "Q", close_gui, opts)
  vim.keymap.set("n", "q", close_gui, opts)
end

return M

local M = {}

-- Close buffer safely
local function close_gui(buf)
  if vim.api.nvim_buf_is_valid(buf) then
    vim.api.nvim_buf_delete(buf, { force = true })
  end
end

function M.open()
  -- Create scratch buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- Floating window config
  local width = 62
  local height = 20
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
    " .S_sSSs     .S_SSSs      sSSs   .S    S.     sSSs   .S_sSSs",
    ".SS~YS%%b   .SS~SSSSS    d%%SP  .SS    SS.   d%%SP  .SS~YS%%b",
    "S%S   `S%b  S%S   SSSS  d%S'    S%S    S&S  d%S'    S%S   `S%b",
    "S%S    S%S  S%S    S%S  S%S     S%S    d*S  S%S     S%S    S%S",
    "S%S    d*S  S%S SSSS%S  S&S     S&S   .S*S  S&S     S%S    d*S",
    "S&S   .S*S  S&S  SSS%S  S&S     S&S_sdSSS   S&S_Ss  S&S   .S*S",
    "S&S_sdSSS   S&S    S&S  S&S     S&S~YSSY%b  S&S~SP  S&S_sdSSS",
    "S&S~YSSY    S&S    S&S  S&S     S&S    `S%  S&S     S&S~YSY%b",
    "S*S         S*S    S&S  S*b     S*S     S%  S*b     S*S   `S%b",
    "S*S         S*S    S*S  S*S.    S*S     S&  S*S.    S*S    S%S",
    "S*S         S*S    S*S   SSSbs  S*S     S&   SSSbs  S*S    S&S",
    "S*S         SSS    S*S    YSSP  S*S     SS    YSSP  S*S    SSS",
    "SP                 SP           SP                  SP        ",
    "Y                  Y            Y                   Y         ",
    "--------------------------------------------------------------",
    "                          [S] Sync",
    "                          [I] Instsall",
    "                          [C] Compile",
    "                          [U] Update",
    "                          [Q] Quit",
  }

  -- Insert content
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false
  vim.bo[buf].readonly = true

  -- Keymaps (buffer-local)
  local map_opts = { noremap = true, silent = true, buffer = buf }
  vim.keymap.set("n", "S", "<cmd>PackerSync<CR>", map_opts)
  vim.keymap.set("n", "I", "<cmd>PackerInstall<CR>", map_opts)
  vim.keymap.set("n", "C", "<cmd>PackerCompile<CR>", map_opts)
  vim.keymap.set("n", "U", "<cmd>PackerUpdate<CR>", map_opts)
  vim.keymap.set("n", "Q", function() close_gui(buf) end, map_opts)
  vim.keymap.set("n", "q", function() close_gui(buf) end, map_opts)
end

return M

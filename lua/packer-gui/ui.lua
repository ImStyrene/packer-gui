local M = {}

function M.open()
  -- create scratch buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- open vertical split
  vim.cmd("vsplit")   -- use "split" for horizontal

  -- set the split width to something smaller
  vim.cmd("vertical resize 70") -- width in columns for vsplit
  -- for horizontal: vim.cmd("resize 10") -- height in lines

  -- set buffer to the split
  vim.api.nvim_win_set_buf(0, buf)

  -- buffer settings
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false

  -- menu content
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
    "███████████                     █████                        ",
    "░░███░░░░░███                   ░░███                         ",
    " ░███    ░███  ██████    ██████  ░███ █████  ██████  ████████ ",
    " ░██████████  ░░░░░███  ███░░███ ░███░░███  ███░░███░░███░░███",
    " ░███░░░░░░    ███████ ░███ ░░░  ░██████░  ░███████  ░███ ░░░ ",
    " ░███         ███░░███ ░███  ███ ░███░░███ ░███░░░   ░███     ",
    " █████       ░░████████░░██████  ████ █████░░██████  █████    ",
    "░░░░░         ░░░░░░░░  ░░░░░░  ░░░░ ░░░░░  ░░░░░░  ░░░░░     ",
    "",
    "                    [S] Sync",
    "                    [I] Install",
    "                    [C] Compile",
    "                    [U] Update",
    "                  [Q] Quit / Close",
  })

  -- keymaps
  local opts = { noremap = true, silent = true, buffer = buf }
  vim.keymap.set("n", "S", "<cmd>PackerSync<CR>", opts)
  vim.keymap.set("n", "I", "<cmd>PackerInstall<CR>", opts)
  vim.keymap.set("n", "C", "<cmd>PackerCompile<CR>", opts)
  vim.keymap.set("n", "U", "<cmd>PackerUpdate<CR>", opts)
  vim.keymap.set("n", "Q", "<cmd>q<CR>", opts)
  vim.keymap.set("n", "q", "<cmd>q<CR>", opts)
end

return M

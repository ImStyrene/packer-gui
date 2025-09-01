local M = {}

function M.open()
  -- Open a new scratch buffer in a vertical split
  vim.cmd("vsplit")
  vim.cmd("enew")
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.bo.swapfile = false

  -- Set ASCII menu
  vim.api.nvim_buf_set_lines(0, 0, -1, false, {
    "########################################",
    "#           Packer GUI Menu             #",
    "########################################",
    "",
    "[S] Sync",
    "[I] Install",
    "[C] Compile",
    "[U] Update",
    "[q] Quit",
  })

  -- Buffer-local keymaps
  local opts = { noremap = true, silent = true, buffer = 0 }
  vim.keymap.set("n", "S", "<cmd>PackerSync<CR>", opts)
  vim.keymap.set("n", "I", "<cmd>PackerInstall<CR>", opts)
  vim.keymap.set("n", "C", "<cmd>PackerCompile<CR>", opts)
  vim.keymap.set("n", "U", "<cmd>PackerUpdate<CR>", opts)
  vim.keymap.set("n", "q", "<cmd>bd!<CR>", opts)
end

return M

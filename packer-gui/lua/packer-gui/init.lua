local M = {}

M.open = require("packer-gui.ui").open

-- Create :Packer command
vim.api.nvim_create_user_command("Packer", function()
  M.open()
end, {})

return M

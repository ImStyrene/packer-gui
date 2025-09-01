local M = {}

function M.setup()
  vim.api.nvim_create_user_command("Packer", function()
    require("packer-gui.ui").open()
  end, {})
end

return M

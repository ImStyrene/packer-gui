local ui = require("packer-gui.ui")
vim.api.nvim_create_user_command("Packer", function()
  ui.open()
end, {})

local ui = require("packer-gui.ui")

vim.api.nvim_create_user_command("PackerGUI", function()
  ui.open()
end, {})

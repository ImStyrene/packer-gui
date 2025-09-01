local M = {}

function M.attach(buf)
  local map = function(lhs, rhs, desc)
    vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
  end

  map("u", function() require("packer").update() end, "Update plugins")
  map("s", function() require("packer").sync() end, "Sync plugins")
  map("c", function() require("packer").clean() end, "Clean plugins")
end

return M

local M = {}

function M.setup(mappings)
  mappings = require(mappings)
  vim.schedule(function()
    for mode, maps in pairs(mappings) do
      for keybind, mapping in pairs(maps) do
	local action, description = table.unpack(mapping)

        vim.keymap.set(mode, keybind, action, {
            desc = description
        })
      end
    end
  end)
end

return M

local M = {}

M.find_spec = function()
  -- TODO
  -- There's gotta be a better way to do this in Lua
  local s = string.gsub(vim.api.nvim_buf_get_name(0), "app", "spec")
  local spec_file = string.sub(s, 0, -4) .. "_spec.rb"
  local buf = vim.api.nvim_create_buf( true, false )

  -- TODO
  -- We should probably check that the file exists, or that this function is being
  -- called from a file in a rails project?
  vim.api.nvim_buf_call(buf, function() vim.cmd('edit ' .. spec_file) end)
  vim.api.nvim_win_set_buf(0, buf)
end

vim.keymap.set("n", "<leader>rt", M.find_spec)

return M


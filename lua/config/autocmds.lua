-- configure overseer task saving with sessions
local overseer = require("overseer")

local function get_cwd_as_name()
  local dir = vim.fn.getcwd(0)
  return dir:gsub("[^A-Za-z0-9]", "_")
end

vim.api.nvim_create_autocmd("User", {
  desc = "Save overseer.nvim tasks on persistence.nvim session save",
  pattern = "PersistenceSavePre",
  callback = function()
    overseer.save_task_bundle(get_cwd_as_name(), nil, { on_conflict = "overwrite" })
  end,
})

vim.api.nvim_create_autocmd("User", {
  desc = "Remove all previous overseer.nvim tasks on persistence.nvim session load",
  pattern = "PersistenceLoadPre",
  callback = function()
    for _, task in ipairs(overseer.list_tasks({})) do
      task:dispose(true)
    end
  end,
})

vim.api.nvim_create_autocmd("User", {
  desc = "Load overseer.nvim tasks on persistence.nvim session load",
  pattern = "PersistenceLoadPost",
  callback = function()
    overseer.load_task_bundle(get_cwd_as_name(), { ignore_missing = true })
  end,
})

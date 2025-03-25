vim.opt.exrc = true
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.g.autoformat = false
vim.filetype.add({
  extension = {
    hlsl = "hlsl",
  },
  pattern = {
    [".*%.glsl%..*"] = "glsl",
  },
})

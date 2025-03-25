vim.opt.exrc = true
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.g.autoformat = false

vim.filetype.add({
  extension = {
    hlsl = function(path, bufnr, ext)
      vim.bo[bufnr].commentstring = "//%s"
      return "hlsl"
    end,
  },
  pattern = {
    [".*%.glsl%..*"] = "glsl",
  },
})

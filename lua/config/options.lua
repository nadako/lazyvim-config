vim.opt.exrc = true
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.g.autoformat = false
vim.g.neovide_cursor_animation_length = 0

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

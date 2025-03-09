vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("SetGLSLFileType", { clear = true }),
  pattern = { "*.glsl.frag", "*.glsl.vert" },
  callback = function()
    vim.opt_local.filetype = "glsl"
  end,
})

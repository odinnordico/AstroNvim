-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
local filetypes = {
  extension = {
    gohtml = "html",
  },
  filename = {},
  pattern = {},
}
vim.filetype.add(filetypes)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.snippets",
  command = "setfiletype snippets",
})

-- Set neotree to open on start
vim.api.nvim_create_augroup("neotree", {})
vim.api.nvim_create_autocmd("UiEnter", {
  desc = "Open Neotree automatically",
  group = "neotree",
  callback = function()
    if vim.fn.argc() == 0 then vim.cmd "Neotree toggle" end
  end,
})

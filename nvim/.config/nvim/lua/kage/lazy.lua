-- This "bootstraps" lazy to install lazy if it is not already installed on the machine
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
   })
end
vim.opt.rtp:prepend(lazypath)

-- This will require the paths to out plugins and will also suppress notifications for changes
require("lazy").setup("kage.plugins", {
   checker = {
      enabled = true,
      notify = false,
   },
   change_detection = {
      notify = false,
   },
})

-- This creates an indent line, treesitter also highlights the line for the scope!!
return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = { indent = { char = "┊" }, },
}

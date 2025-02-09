return {
  {--///////////////// GENERAL LUA FUNCTIONS /////////////////////
  "nvim-lua/plenary.nvim",
  },
  {--///////////////// WHICH KEY /////////////////////
    "folke/which-key.nvim", -- Visual aid for key maps
    event = "VeryLazy",
  },
  {--///////////////// TOGGLE TERM /////////////////////
    'akinsho/toggleterm.nvim', -- Terminal emulator in Nvim
    version = "*",
    event = "VeryLazy",

    opts = { height = 10, open_mapping = [[<c-`>]] }
  },
  {--///////////////// INDENT BLANK LINE /////////////////////
    "lukas-reineke/indent-blankline.nvim", -- This shows a vertical line to show you where your indent is
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = { indent = { char = "┊" }, },
  },
  {--///////////////// GITSIGNS /////////////////////
    "lewis6991/gitsigns.nvim",-- This makes the gitsigns in the gutter look pretty
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  }
}

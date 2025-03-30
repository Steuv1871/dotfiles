return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "html-lsp", "css-lsp" , "prettier",
      },
    },
  },
  
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css",
        "markdown", "markdown_inline",
        "bash", "perl",
        "python",
        "rust", "c", "cpp",
        "toml", "yaml", "json",
      },
    },
  },

  -- VIM Fountain plugin
  {
    "kblin/vim-fountain",
    ft = "fountain",
  },

-- Markdow Preview
  {
    'OXY2DEV/markview.nvim',
    ft = "markdown",
    dependencies  = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      local presets = require("markview.presets")
      require('markview').setup({
        -- hybrid_modes = {"i"},
        markdown = {
          headings = presets.headings.slanted,
          horizontal_rules = presets.horizontal_rules.thick,
          tables = presets.tables.rounded,
          -- headings = { shift_width = 2  },
        },
      })
    end
  },

  {
    "epwalsh/obsidian.nvim",
    enabled = function()
        -- check if vaults folder exists, if so, enable obsidian plugin
        local vaults_path = vim.fn.expand("~/vaults/zettelkasten")
        if vim.fn.isdirectory(vaults_path) == 1 then
          return true
        end
        return false
      end,
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "Zettelkasten",
          path = "~/vaults/zettelkasten"
        },
      },
      picker = {
        -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
        name = "telescope.nvim",
        note_mappings = {
          -- Create a new note from your query.
          new = "<C-x>",
          -- Insert a link to the selected note.
          insert_link = "<C-l>",
        },
        tag_mappings = {
          -- Add tag(s) to current note.
          tag_note = "<C-x>",
          -- Insert a tag at the current location.
          insert_tag = "<C-l>",
        },
      },
      new_notes_location = "current_dir",
      ui = { enable = false }, -- Disable the UI as it conflicts with the markview (conceallevel set to 3)

    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      -- return tostring(os.time()) .. "-" .. suffix # Default Zettlekasten style
      return suffix -- No unique ID, just the chosen title
    end,
      },
    },  
}
-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = { 'git', 'clone', '--filter=blob:none', 'https://github.com/echasnovski/mini.nvim', mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })

-- Use 'mini.deps'. `now()` and `later()` are helpers for a safe two-stage
-- startup and are optional.
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Safely execute immediately
local map = vim.api.nvim_set_keymap
now(function()
  vim.o.termguicolors = true
  -- vim.cmd('colorscheme slate') -- Default Mini.nvim Colorscheme, replaced by theme plugin
  -- vim.cmd('set relativenumber') -- Show line number
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.cmd('set hidden') -- When switching to an other buffer while unsaved change in current buffer, the current buffer is "hidden"
  map('n', '<Space>', '', {}) -- Delete Space keybind in normal mode
  vim.g.mapleader = ' ' -- Changing Leader Key
  -- width if a tab
  vim.opt.shiftwidth = 4
  vim.opt.tabstop = 4
  vim.opt.softtabstop = 4
  vim.opt.expandtab = true -- use number of space to insert a <Tab>
end)

-- Keymap (TODO: Mettre dans un fichier à part)
now(function()
  -- vim.keymap.set("n","<leader>aa", function() print "hi!" end, { desc = 'Say hi!'}) -- test leader key, the desc is used for clue
  vim.keymap.set("i", "jk", "<ESC>", { desc = 'jk to escape'}) -- jk to escape in insert mode
  -- Buffers <Leader>b
  vim.keymap.set("n","<leader>bl", '<Cmd>ls<CR>', { desc = 'List'}) -- List buffers
  vim.keymap.set("n","<leader>bo", '<Cmd>enew<CR>', { desc = 'Open new'}) -- Open new buffer
  vim.keymap.set("n","<leader>bd", '<Cmd>bd<CR>', { desc = 'Delete/close'}) -- Delete active buffer
  vim.keymap.set("n","<leader>bf", '<Cmd>bd!<CR>', { desc = 'Delete/close (force)'}) -- Delete active buffer even if unsaved changes
  vim.keymap.set("n","<leader>bn", '<Cmd>bn<CR>', { desc = 'Next'}) -- Next buffer
  vim.keymap.set("n","<leader>bp", '<Cmd>bp<CR>', { desc = 'Previous'}) -- Previous buffer
  vim.keymap.set("n","<C-Tab>", '<Cmd>bn<CR>', { desc = 'Next Buffer'}) -- Next buffer shortcut
  vim.keymap.set("n","<C-S-Tab>", '<Cmd>bp<CR>', { desc = 'Previous Buffer'}) -- Previous buffer shortcut
end)

now(function()
  require('mini.notify').setup()
  vim.notify = require('mini.notify').make_notify()
end)
now(function() require('mini.icons').setup() end)
now(function() require('mini.tabline').setup() end)
now(function() require('mini.statusline').setup() end)
now(function() require('mini.pairs').setup() end)
now(function() require('mini.trailspace').setup() end)
-- now(function() require('mini.animate').setup() end) -- Deactivated, causing issue with mouse wheel
-- now(function() require('mini.cursorword').setup() end) -- More anoying than usefull
now(function()
  require('mini.git').setup()
  -- FIXME: Trouver comment avoir le chemin du fichier en cours relativement à la racine du repo et pas depuis le rep d'exec
  vim.keymap.set('n', '<Leader>gaa', '<Cmd>Git add .<CR>', {desc = 'add all changed files in current repo'} )
  vim.keymap.set('n', '<Leader>gac', '<Cmd>Git add %<CR>', {desc = 'add current file'} )
  vim.keymap.set('n', '<Leader>gc', '<Cmd>Git commit<CR>', {desc = 'commit changes'} )
  vim.keymap.set('n', '<Leader>gg', '<Cmd>lua MiniGit.show_at_cursor()<CR>', {desc = 'mini.git show at cursor'} )
  vim.keymap.set('n', '<Leader>gs', '<Cmd>Git status<CR>', {desc = 'status'} )
end)
now(function() require('mini.diff').setup({
  view = { style = 'sign'}
}) end)
now(function() require('mini.indentscope').setup() end)
now(function()
  require('mini.sessions').setup()
  vim.keymap.set('n', '<Leader>sc', '<Cmd>mksession<CR>', {desc = 'create'} )
  vim.keymap.set('n', '<Leader>ss', '<Cmd>lua MiniSessions.select()<CR>', {desc = 'select'} )
  vim.keymap.set('n', '<Leader>sd', '<Cmd>lua MiniSessions.delete(nil, {force = true})<CR>', {desc = 'delete'} )
end)
now(function() require('mini.starter').setup({
  items = {
    require('mini.starter').sections.recent_files(3, false, true), -- 3 recent files, not limited to CWD, show path
    require('mini.starter').sections.sessions(3, true), -- 3 sessions, sorted by recent (false for alphabetical)
    require('mini.starter').sections.builtin_actions(), -- New buffer and quit
  },
  content_hooks = {
    require('mini.starter').gen_hook.adding_bullet(),
    require('mini.starter').gen_hook.aligning('center', 'center'),
    require('mini.starter').gen_hook.padding(0, 0), -- Padding left, top
    -- require('mini.starter').gen_hook.indexing('all', {}), -- unique index to the start of items. by 'section' or 'all', liste ignored sections
  },
  -- header = 'Mini.Starter'
  -- header = "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗\n  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║\n  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║\n  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║\n  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║\n  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝", -- NEOVIM
  header = " ____ ____ ____ ____ ____ ____ ____ ____ ____ \n||M |||I |||N |||I |||. |||N |||V |||I |||M ||\n||__|||__|||__|||__|||__|||__|||__|||__|||__||\n|/__\\|/__\\|/__\\|/__\\|/__\\|/__\\|/__\\|/__\\|/__\\|" -- Mini.Nvim keyboard
}) end)

-- Tokyo Night Color Theme
now(function()
  add({ source = 'folke/tokyonight.nvim' })
    vim.cmd('colorscheme tokyonight-night')
end)

-- Safely execute later
later(function() require('mini.hipatterns').setup({
  -- Higkight FIXME:, TODO:, NOTE: et Colors like #223344
  highlighters = {
    fixme = { pattern = '%f[%w]()FIXME:', group = 'MiniHipatternsFixme' },
    todo = { pattern = '%f[%w]()TODO:', group = 'MiniHipatternsTodo' },
    note = { pattern = '%f[%w]()NOTE:', group = 'MiniHipatternsNote' },
    hex_color = require('mini.hipatterns').gen_highlighter.hex_color()
  }
}) end)
later(function()
  require('mini.map').setup()
  -- vim.keymap.set('n', '<Leader>mo', MiniMap.open, desc = {'open'} )
  -- vim.keymap.set('n', '<Leader>mc', MiniMap.close, desc = {'close'} )
  vim.keymap.set('n', '<Leader>mt', MiniMap.toggle, {desc = 'open/close'} )
  vim.keymap.set('n', '<Leader>mf', MiniMap.toggle_focus, {desc = 'focus/unfocus'} )
  vim.keymap.set('n', '<Leader>mr', MiniMap.refresh, { desc = 'refresh'} )
  vim.keymap.set('n', '<Leader>ms', MiniMap.toggle_side, { desc = 'change side'} )
end)

later(function()
  require('mini.files').setup({
    windows = { preview = true },
    mappings = {
      go_in = "l",
      go_in_plus = "<CR>", -- open the file and quit mini.files (default L)
      go_out = "H", -- swapped with go_out_plus
      go_out_plus = "h",
      reset = ",", -- default <BS>
      reveal_cwd = ".", -- default @
      synchronize = "s", -- default =
      show_help = "g?",
      trim_left = "<",
      trim_right = ">",
    },
    options = {
      use_as_default_explorer = true,
      -- If set to false, files are moved to the trash directory --> `:echo stdpath('data')` to reveal
      permanent_delete = false,
    },
  })
  local minifiles_toggle = function(...) -- Function to toggle Mini.Files
    if not MiniFiles.close() then MiniFiles.open(...) end
  end
  -- vim.keymap.set('n', '<Leader>fof', '<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>', {desc = 'current File location'} )
  -- vim.keymap.set('n', '<Leader>fow', '<Cmd>lua MiniFiles.open()<CR>', {desc = 'current Working directory'} )
  -- vim.keymap.set('n', '<Leader>fr', '<Cmd>lua MiniFiles.refresh()<CR>', {desc = 'refresh'} )
  -- vim.keymap.set('n', '<Leader>fa', '<Cmd>lua MiniFiles.synchronize()<CR>', {desc = 'apply changes'} )
  vim.keymap.set('n', '<Leader>ft', minifiles_toggle, {desc = 'toggle on/off'} )
  -- vim.keymap.set('n', '<Leader>ftl', '<Cmd>lua MiniFiles.trim_left()<CR>', {desc = 'left'} )
  -- vim.keymap.set('n', '<Leader>ftr', '<Cmd>lua MiniFiles.trim_right()<CR>', {desc = 'right'} )
  vim.keymap.set('n', '<Leader>fh', '<Cmd>lua MiniFiles.show_help()<CR>', {desc = 'help: `g?` in Mini.Files'} )
end)

later(function() require('mini.clue').setup({
  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },
    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },
    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },
    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = "`" },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = "`" },
    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },
    -- Window commands
    { mode = 'n', keys = '<C-w>' },
    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },
  clues = {
    require('mini.clue').gen_clues.builtin_completion(),
    require('mini.clue').gen_clues.g(),
    require('mini.clue').gen_clues.marks(),
    require('mini.clue').gen_clues.registers(),
    require('mini.clue').gen_clues.windows({
      submode_move = true,
      submode_navigate = true,
      submode_resize = true,
    }),
    require('mini.clue').gen_clues.z(),
    -- Leader key group hints
    { mode = 'n', keys = '<Leader>b', desc = '+Buffers'},
    { mode = 'n', keys = '<Leader>m', desc = '+Mini.map'},
    { mode = 'n', keys = '<Leader>g', desc = '+Git'},
    { mode = 'n', keys = '<Leader>ga', desc = '+Add'},
    { mode = 'n', keys = '<Leader>f', desc = '+Mini.Files'},
    { mode = 'n', keys = '<Leader>s', desc = '+Mini.Sessions'},
  },
  window = {
    delay = 500,
    scroll_down = '<Down>',
    scroll_up = '<Up>'
  }
}) end)

later(function() require('mini.ai').setup() end)
-- later(function() require('mini.comment').setup() end) -- Obsolete, gcc builtin nvim >=0.10
later(function() require('mini.pick').setup() end)
later(function() require('mini.surround').setup() end)
-- later(function() require('mini.completion').setup() end) -- Don't have lsp installed so only hint text in buffer

now(function()
  -- Use other plugins with `add()`. It ensures plugin is available in current
  -- session (installs if absent)
  add({
    source = 'neovim/nvim-lspconfig',
    -- Supply dependencies near target plugin
    depends = { 'williamboman/mason.nvim' },
  })
end)

now(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    -- Use 'master' while monitoring updates in 'main'
    checkout = 'master',
    monitor = 'main',
    -- Perform action after every checkout
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })
  -- Possible to immediately execute code which depends on the added plugin
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'vimdoc', 'html', 'markdown', 'markdown_inline', 'python', 'toml', 'yaml', 'json', 'bash' },
    highlight = { enable = true },
  })
end)

-- VIM Fountain plugin
now(function()
  add({ source = 'kblin/vim-fountain' })
end)

-- Markdow Preview
now(function()
  add({
    source = 'OXY2DEV/markview.nvim',
    depends = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    }
  })
  local presets = require("markview.presets");
  require("markview").setup({
    -- hybrid_modes = {"i"},
    markdown = {
      headings = presets.headings.slanted,
      horizontal_rules = presets.horizontal_rules.thick,
      tables = presets.tables.rounded
      -- headings = { shift_width = 2  },
    },
  })
end)

-- Obsidian plugin
local vaults_path = vim.fn.expand("~/vaults/zettelkasten")
-- check if vaults folder exists, if so, load obsidian plugin
if vim.fn.isdirectory(vaults_path) == 1 then
  now(function()
    add({
      source = 'epwalsh/obsidian.nvim',
      depends = { "nvim-lua/plenary.nvim" }
    })
    -- Vaults declaration
    require('obsidian').setup({
      workspaces = {
        {
        name = "Zettelkasten",
        path = "~/vaults/zettelkasten"
        }
      },
      picker = {
        -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
        name = "mini.pick",
        -- Optional, configure key mappings for the picker. These are the defaults.
        -- Not all pickers support all mappings.
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
      -- completion = { nvim_cmp = true, min_char = 2 }, -- Completion of wiki links, local markdown links, and tags using nvim-cmp
    })
  end)
end

-- Vim Wiki --> Deactivated, causing issues with Obsidian plugin
-- later(function()
--   add({ source = 'vimwiki/vimwiki' })
-- end)


--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
vim.opt.wrap = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "github_dark_high_contrast"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.keys.visual_mode["<leader>sw"] = "<esc><cmd>lua require('spectre').open_visual()<CR>"

-- Tmux terminal stuff
-- lvim.keys.normal_mode["<C-S-d"] = ":lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>"
-- lvim.keys.normal_mode["<C-S-m"] = ":lua require('harpoon.tmux').gotoTerminal(1)<CR>"
-- lvim.keys.normal_mode["<C-S-,"] = ":lua require('harpoon.tmux').gotoTerminal(2)<CR>"
-- lvim.keys.normal_mode["<C-S-."] = ":lua require('harpoon.tmux').gotoTerminal(3)<CR>"
-- lvim.keys.normal_mode["<C-S-/"] = ":lua require('harpoon.tmux').gotoTerminal(4)<CR>"

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")

-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
    ["<C-Q>"] = actions.send_selected_to_qflist + actions.open_qflist,
  },
  -- for normal mode
  n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
    ["<C-Q>"] = actions.send_selected_to_qflist + actions.open_qflist,
  },
}

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
local which_key_custom = {
  ["e"] = { "<cmd>Neotree toggle<CR>", "Neotree" },

  ["."] = {
    name = "+Dotfiles/Setups",
    v = { "<cmd>edit ~/Documents/Repos/Configs/LunarVim/config.lua<cr>", "LunarVim" },
    z = { "<cmd>edit ~/Documents/Repos/Configs/Zsh/.zshrc<cr>", ".zshrc" },
    t = { "<cmd>edit ~/Documents/Repos/Configs/tmux/.tmux.conf<cr>", ".tmux.conf" },
    f = { "<cmd>edit ~/Documents/Repos/Personal/fresh-mac/homebrew/Brewfile<cr>", "Fresh Mac Brewfile" },
  },

  p = {
    "<cmd>Telescope projects<CR>", "Projects"
  },

  t = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
  },

-- Do not overwrite "s"
  s = {
    w = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "Search current word" },
  },

-- Do not overwrite "g"
  g = {
    d = { "<cmd>DiffviewOpen<cr>", "diffview" },
  },

  r = {
    name = "+Spectre",
    s = { "<cmd>lua require('spectre').open()<CR>", "Open Spectre" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search current word" },
    p = { "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", "Search current word in current file" }
  },

  m = {
    name = "+Marks",
    a = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add" },
    e = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Quick Menu" },
    j = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "Previous" },
    k = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", "Next" },
    ["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "File 1" },
    ["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", "File 2" },
    ["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", "File 3" },
    ["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", "File 4" },
    ["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", "File 5" },
    ["6"] = { "<cmd>lua require('harpoon.ui').nav_file(6)<CR>", "File 6" },
    ["7"] = { "<cmd>lua require('harpoon.ui').nav_file(7)<CR>", "File 7" },
    ["8"] = { "<cmd>lua require('harpoon.ui').nav_file(8)<CR>", "File 8" },
    ["9"] = { "<cmd>lua require('harpoon.ui').nav_file(9)<CR>", "File 9" },
  },

-- Do not overwrite "b"
  b = {
    c = { "<cmd>enew<CR>", "New buffer" },
  },

  S = {
    name = "Session",
    c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
  },

}

lvim.builtin.which_key.mappings["."] = which_key_custom["."]
lvim.builtin.which_key.mappings["P"] = which_key_custom["P"]
lvim.builtin.which_key.mappings["S"] = which_key_custom["S"]
lvim.builtin.which_key.mappings["e"] = which_key_custom["e"]
lvim.builtin.which_key.mappings["m"] = which_key_custom["m"]
lvim.builtin.which_key.mappings["p"] = which_key_custom["p"]
lvim.builtin.which_key.mappings["r"] = which_key_custom["r"]
lvim.builtin.which_key.mappings["t"] = which_key_custom["t"]
lvim.builtin.which_key.mappings["b"]["c"] = which_key_custom["b"]["c"]
lvim.builtin.which_key.mappings["b"]["d"] = which_key_custom["b"]["d"]
lvim.builtin.which_key.mappings["g"]["d"] = which_key_custom["g"]["d"]
lvim.builtin.which_key.mappings["s"]["w"] = which_key_custom["s"]["w"]

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.nvimtree.active = true -- NOTE: using neo-tree
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.renderer.full_name = true
lvim.builtin.which_key.setup.plugins.marks = true
lvim.builtin.which_key.setup.plugins.registers = true
lvim.builtin.which_key.setup.plugins.presets.z = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "css",
  "dockerfile",
  "gitignore",
  "go",
  "graphql",
  "html",
  "http",
  "java",
  "javascript",
  "json",
  "lua",
  "make",
  "markdown",
  "php",
  "pug",
  "python",
  "regex",
  "ruby",
  "rust",
  "scss",
  "sql",
  "tsx",
  "typescript",
  "vue",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.matchup.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  "angularls",
  "bashls",
  "cssls",
  "dockerls",
  "emmet_ls",
  "gopls",
  "graphql",
  "jsonls",
  "marksman", -- Markdown
  "phpactor",
  "pyright",
  "solargraph", -- Ruby
  "sqlls",
  "tsserver",
  "vuels",
}
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "shfmt", filetypes = { "sh" } },
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  { command = "phpcbf", filetypes = { "php" } },
  { command = "sql_formatter", filetypes = { "sql" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = {
      "css",
      "graphql",
      "html",
      "javascript",
      "jsx",
      "json",
      "jsonc",
      "less",
      "markdown",
      "markdown.mdx",
      "scss",
      "typescript",
      "tsx",
      "vue",
      "yaml",
    },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  -- { command = "phpcs", filetypes = { "php" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "python" },
  },
}

-- Additional Plugins
lvim.plugins = {
  {
    "folke/lazy.nvim",
    version = "stable",
  },

  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

  -- Motion plugin
  {
    "ggandor/leap.nvim",
    event = "BufRead",
    config = function()
      require('leap').add_default_mappings()
    end,
  },

  -- Preview line number
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
    require("numb").setup {
      show_numbers = true, -- Enable 'number' for the window while peeking
      show_cursorline = true, -- Enable 'cursorline' for the window while peeking
    }
    end,
  },

  -- Better quickfix window
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = {
              ["ctrl-s"] = "split"
            },
            extra_opts = {
              "--bind", "ctrl-o:toggle-all", "--prompt", "> "
            },
          },
        },
      })
    end,
  },

  -- Search and replace
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup({
        mapping = {
          ['send_to_qf'] = {
            map = "<C-q>",
            cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
            desc = "send all item to quickfix",
          },
        },
      })
    end,
  },

  -- Navigate and highlight matching words
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- Interactive scratchpad
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },

  -- Session persistence
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },

  -- Enable repeating supported plugin maps with .
  {
    "tpope/vim-repeat",
  },

  {
    -- "tpope/vim-surround",
    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },

  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  -- navigate between neovim and tmux panes
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require 'nvim-tmux-navigation'.setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          -- last_active = "<C-\\>",
          -- next = "<C-Space>",
        },
      }
    end,
  },

  -- git diff view of everything
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },

  -- treesitter text objects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      require('nvim-treesitter.configs').setup({
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              -- You can optionally set descriptions to the mappings (used in the desc parameter of
              -- nvim_buf_set_keymap) which plugins like which-key display
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              ["ad"] = "@conditional.outer",
              ["id"] = "@conditional.inner",
              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["al"] = "@assignment.lhs",
              ["ar"] = "@assignment.rhs",
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V', -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = false,
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]]"] = { query = "@class.outer", desc = "Next class start" },
            },
            goto_next_end = {
              ["]F"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[F"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
            -- Below will go to either the start or the end, whichever is closer.
            -- Use if you want more granular movements
            -- Make it even more gradual by adding multiple queries and regex.
            goto_next = {
              ["]d"] = "@conditional.outer",
              ["]a"] = "@parameter.inner",
            },
            goto_previous = {
              ["[d"] = "@conditional.outer",
              ["[a"] = "@parameter.inner",
            },
          },
        },
      })
    end,
  },

  -- Harpoon
  {
    "ThePrimeagen/harpoon",
  },

  -- Symbols outline
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },

  -- Autotag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Comment string context
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufRead",
  },

  -- Dev Icons
  {
    "nvim-tree/nvim-web-devicons",
  },

  -- Neo Tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        source_selector = {
          winbar = true,
          statusline = true,
        },
        close_if_last_window = true,
        window = {
          width = 30,
          mappings = {
            ["o"] = "open",
            ["<cr>"] = "open",
          },
        },
        buffers = {
          follow_current_file = true,
        },
        filesystem = {
          follow_current_file = true,
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_by_name = {
              "node_modules"
            },
            never_show = {
              ".DS_Store",
              "thumbs.db"
            },
          },
        },
      })
    end
  },

  -- Function context
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup{
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },

  -- LuaSnip
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require "luasnip"
      local types = require "luasnip.util.types"

      ls.config.set_config {
        history = true,
        updateevents = "TextChanged, TextChangedI",
      }

      -- <c-k>
      -- expand current item or jump to next item within snippet
      vim.keymap.set({ "i", "s" }, "<c-k>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      -- <c-j>
      -- go back an item
      vim.keymap.set({ "i", "s" }, "<c-j>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })

      -- <c-l>
      -- choice nodes
      vim.keymap.set("i", "<c-l>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end)

      -- refresh snippets
      -- vim.keymap.set("n", "<leader><leader>s", "<cmd>source ")
    end,
  },

  -- preview markdown
  {
    "npxbr/glow.nvim",
    ft = {"markdown"}
    -- build = "yay -S glow"
  },

  -- session management
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },

-- Open URLs in browser
  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },

  -- Fast finding
  {
    "camspiers/snap",
    config = function()
      local snap = require "snap"
      local layout = snap.get("layout").bottom
      local file = snap.config.file:with { consumer = "fzf", layout = layout }
      local vimgrep = snap.config.vimgrep:with { layout = layout }
      snap.register.command("find_files", file { producer = "ripgrep.file" })
      snap.register.command("buffers", file { producer = "vim.buffer" })
      snap.register.command("oldfiles", file { producer = "vim.oldfile" })
      snap.register.command("live_grep", vimgrep {})
    end,
  },

  -- auto-switch between relative and absolute line numbers
  { "sitiom/nvim-numbertoggle" },

  -- GitHub theme
  {
    "projekt0n/github-nvim-theme",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd('colorscheme github_dark_high_contrast')
    end,
  },

  -- highlight todo comments
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },

}

-- Plugin Extensions Setup
-- Telescope extensions
lvim.builtin.telescope.on_config_done = function (telescope)
  pcall(telescope.load_extension, "harpoon")
end


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
vim.api.nvim_create_autocmd("BufEnter", {
  command = "highlight Normal guibg=none",
})

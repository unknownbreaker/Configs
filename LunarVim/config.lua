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
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "tokyonight"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

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
  },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
}

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
local which_key_custom = {
  ["."] = {
    name = "+Dotfiles/Setups",
    v = { "<cmd>edit ~/Documents/Repos/Configs/LunarVim/config.lua<cr>", "LunarVim" },
    z = { "<cmd>edit ~/Documents/Repos/Configs/Zsh/.zshrc<cr>", ".zshrc" },
    t = { "<cmd>edit ~/Documents/Repos/Configs/tmux/.tmux.conf<cr>", ".tmux.conf" },
    f = { "<cmd>edit ~/Documents/Repos/Personal/fresh-mac/homebrew/Brewfile<cr>", "Fresh Mac Brewfile" },
  },

  P = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    r = { "<cmd>lua require('lvim.plugin-loader').recompile()<cr>", "Re-compile" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
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
    w = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "Search word under cursor" }
  },

-- Do not overwrite "g"
  g = {
    d = { "<cmd>DiffviewOpen<cr>", "diffview" },
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
    d = { "<cmd>bd<CR>", "Close current buffer" },
  },
}

lvim.builtin.which_key.mappings["."] = which_key_custom["."]
lvim.builtin.which_key.mappings["m"] = which_key_custom["m"]
lvim.builtin.which_key.mappings["P"] = which_key_custom["P"]
lvim.builtin.which_key.mappings["p"] = which_key_custom["p"]
lvim.builtin.which_key.mappings["t"] = which_key_custom["t"]
lvim.builtin.which_key.mappings["g"]["d"] = which_key_custom["g"]["d"]
lvim.builtin.which_key.mappings["s"]["w"] = which_key_custom["s"]["w"]
lvim.builtin.which_key.mappings["b"]["c"] = which_key_custom["b"]["c"]
lvim.builtin.which_key.mappings["b"]["d"] = which_key_custom["b"]["d"]

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.renderer.full_name = true

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

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  "sumneko_lua",
  "jsonls",
  "cssls",
  "dockerls",
  "emmet_ls",
  "gopls",
  "graphql",
  "html-lsp",
  "tsserver",
  "marksman", -- Markdown
  "phpactor",
  "pyright",
  "solargraph", -- Ruby
  "sqlls",
  "vuels",
  "angularls",
  "bashls",
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
      "javascriptreact",
      "json",
      "jsonc",
      "less",
      "markdown",
      "markdown.mdx",
      "scss",
      "typescript",
      "typescriptreact",
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
      require("spectre").setup()
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
    module = "persistence",
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },

  -- Enable repeating supported plugin maps with .
  { "tpope/vim-repeat" },

  {
    "tpope/vim-surround",
    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
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
            include_surrounding_whitespace = true,
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
              ["]m"] = "@function.outer",
              ["]]"] = { query = "@class.outer", desc = "Next class start" },
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
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

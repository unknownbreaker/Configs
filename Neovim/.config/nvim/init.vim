nnoremap <SPACE> <Nop>
let mapleader = " "

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set exrc " custom executions for various projects
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50 " cursor look
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
set cursorline
set relativenumber
set nohlsearch " kill highlight after done searching
set hidden " keeps any buffer you've been editing in the background
set noerrorbells
set nu
" set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8 " starts scrolling when 8 lines away from edge
set colorcolumn=100
set signcolumn=yes " show nice indicators in column
set mouse=a
set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience
set shortmess+=c " Avoid showing message extra message when using completion
set clipboard+=unnamedplus " share system clipboard
set updatetime=100 " relevant for signify update
set startofline
set foldmethod=indent
set foldnestmax=5
set foldlevelstart=99
set splitbelow " new split shows bottom
set splitright " new split shows right

" Vim directories
let data_dir = has('nvim') ? stdpath('data') : '~/.vim'

" UNDODIR
if !isdirectory(data_dir . '/undodir')
  silent execute '!mkdir '.data_dir.'/undodir'
endif

" PLUGGED DIR
if !isdirectory(data_dir . '/plugged')
  silent execute '!mkdir '.data_dir.'/plugged'
endif

" Plugins
if empty(glob(data_dir . '/site/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'williamboman/nvim-lsp-installer' " automatically install language servers
Plug 'neovim/nvim-lspconfig'
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'} " php lsp
Plug 'tami5/lspsaga.nvim' " little GUIs
Plug 'digitaltoad/vim-pug' " syntax highlighting for pug/jade
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects' "text objects
Plug 'nvim-treesitter/nvim-treesitter-context' " sticky header
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'onsails/lspkind-nvim' "icons in completion menu
Plug 'gruvbox-community/gruvbox' "theme
Plug 'iCyMind/NeoSolarized' "theme
Plug 'rakr/vim-one' "theme
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'hoob3rt/lualine.nvim' "status line
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'kyazdani42/nvim-web-devicons' "file icons
Plug 'kyazdani42/nvim-tree.lua' "file tree
Plug 'numToStr/Comment.nvim' "comment the code
Plug 'JoosepAlviste/nvim-ts-context-commentstring' "comment embedded languages, like jsx/tsx
Plug 'christoomey/vim-tmux-navigator' 
Plug 'christoomey/vim-tmux-runner' "vim and tmux integration
Plug 'tpope/vim-obsession' "remember vim sessions
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' "repeats more than just native commands
Plug 'kylechui/nvim-surround'
Plug 'szw/vim-maximizer' "maximize current pane
Plug 'tpope/vim-unimpaired' "cnext and cprev mappings
Plug 'mhinz/vim-signify' "git symbols in gutter; faster than gitgutter
Plug 'sbdchd/neoformat' " prettier
Plug 'wellle/targets.vim' " super charge separators and selecting text objs
Plug 'junegunn/gv.vim' " peruse git commits; depends on fugitive
Plug 'kevinhwang91/nvim-bqf' " quickfix list editing
Plug 'ThePrimeagen/git-worktree.nvim' " git worktree telescopic
Plug 'lukas-reineke/indent-blankline.nvim' " show me what the blanks are
Plug 'chentoast/marks.nvim' " marks
Plug 'ThePrimeagen/harpoon' " manage marks/file navigation memory
Plug 'michaelb/sniprun' " repls
Plug 'folke/trouble.nvim' " easier to find code issues
Plug 'subnut/nvim-ghost.nvim', {'do': ':call nvim_ghost#installer#install()'}
Plug 'TimUntersberger/neogit' " magit clone
Plug 'windwp/nvim-autopairs'
Plug 'ldelossa/litee.nvim' " Call hierarchy stuff
Plug 'ldelossa/litee-calltree.nvim'
Plug 'hkupty/iron.nvim' " Repl in vim
Plug 'mfussenegger/nvim-dap' " Debug in vim
Plug 'rcarriga/nvim-dap-ui' " UI for DAP
Plug 'theHamsta/nvim-dap-virtual-text' " Virtual text support
Plug 'simrat39/symbols-outline.nvim' " symbols for different keywords
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install && :call mkdp#util#install()' } " markdown live preview
Plug 'ojroques/nvim-bufdel' " Improve deletion of buffers
call plug#end()

" Start Obsession upon entering
if exists("g:this_obsession")
  autocmd VimEnter * Obsession
endif

colorscheme one
highlight Normal guibg=none

au! BufRead,BufNewFile tsconfig.json set filetype=jsonc

if filereadable(findfile('.prettierrc.json', '.'))
  echo "Prettier running..."
  " autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.json,*.yml Neoformat
" autocmd BufWritePre *.js Neoformat
" autocmd BufWritePre *.jsx Neoformat
" autocmd BufWritePre *.ts Neoformat
" autocmd BufWritePre *.tsx Neoformat
" autocmd BufWritePre *.json Neoformat
" autocmd BufWritePre *.yml Neoformat
endif

" Close vim if NvimTree is the last buffer
" nvimtree pane is not counted as a buffer
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'OUTLINE' . tabpagenr() | quit | endif

" Search but keep very magic enabled
nnoremap / /\v

" Split windows and move into new split
nnoremap <Leader>sh :vsplit<CR>
nnoremap <Leader>sl :vsplit<CR><C-W><c-l>
nnoremap <Leader>sj :split<CR><C-W><c-j>
nnoremap <Leader>sk :split<CR>

" move vertically by visual line with j k
nnoremap j gj
nnoremap k gk

" move text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" greatest remap ever
vnoremap <leader>p "_dP

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" copy from cursor to end of line
nnoremap Y y$

" copy visual selection but leave cursor where it was
vnoremap y mzy`z

" keep cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Keep search on current result
nnoremap * *N

" unset last search pattern by hitting return
" nnoremap <CR> :nohlsearch<CR><CR>

" Undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" quick close window without save
nnoremap <leader>q :q<CR>
" quick save
nnoremap <leader>w :w!<CR>
" quick save and close
nnoremap <leader>x :x<CR>

" jump list mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" close all open buffers and reopen last one
" recenter cursor and last position
command! Bd execute '%bdelete|edit #|normal `"zz'
nnoremap <silent><C-x> :Bd<CR>

" close current buffer
nnoremap <silent><leader>bb :BufDel<CR>`"zz'
" close current buffer and ignore changes
nnoremap <silent><leader>bd :BufDel!<CR>`"zz'

nnoremap <silent><leader>o :SymbolsOutline<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Access saved marks less awkwardly.
nnoremap M `


" Run Neoformat
nnoremap <silent>\f :Neoformat<CR>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({find_command=function (opts) return {"rg", "--files", "--color", "never", "--hidden", "--glob", "!.git/"} end})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fo <cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<cr>
nnoremap <leader>pw <cmd>lua require('telescope.builtin').grep_string ({search = vim.fn.expand("<cword>")})<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fm <cmd>lua require('telescope.builtin').marks()<cr>

nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gf <cmd>lua require('telescope.builtin').git_files()<cr>

nnoremap <leader>ww <cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>
nnoremap <leader>wa <cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>


nnoremap <leader>vd <cmd>lua require('telescope.builtin').lsp_definitions()<CR>zz
nnoremap <leader>vD <cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>zz
nnoremap <leader>vi <cmd>lua require('telescope.builtin').lsp_implementations()<CR>zz
nnoremap <leader>vr <cmd>lua require('telescope.builtin').lsp_references()<CR>zz
nnoremap <leader>vsh <cmd>lua require('telescope.builtin').signature_help()<CR>zz
nnoremap <leader>vR <cmd>lua require('telescope.builtin').rename()<CR>
nnoremap <leader>vca <cmd>lua require('telescope.builtin').code_action()<CR>
nnoremap <leader>vsd <cmd>lua require('telescope.builtin').diagnostics()<CR>
nnoremap <leader>d <cmd>lua require('telescope.builtin').diagnostics()<cr>

" nnoremap <leader>vp <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>zz
" nnoremap <leader>vn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>zz

" nnoremap <silent><C-f> <cmd>


" lsp saga
" lsp provider to find the cursor word definition and reference
nnoremap <silent><leader>gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" code action
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
" show hover doc
nnoremap <silent><leader>K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>

" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" show signature help
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
" and you also can use smart_scroll_with_saga to scroll in signature help win
" rename
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
" close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`
" preview definition
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
" can use smart_scroll_with_saga to scroll
" show
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
" only show diagnostic if cursor is over the area
nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

" jump diagnostic
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
" float terminal also you can pass the cli command in open_float_terminal function
nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR> " or open_float_terminal('lazygit')<CR>
tnoremap <silent> <A-d> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>

" Navigate quickfix
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprev<CR>

" file tree
" https://github.com/kyazdani42/nvim-tree.lua
nnoremap <leader>e :NvimTreeFindFileToggle<CR>
" nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

let g:python3_host_prog = '/usr/bin/python3'

nnoremap <leader><leader>m :MaximizerToggle!<CR>

" fugitive maps
" Helpful for patch mode
" index is in left pane
" working tree is in right pane
" nnoremap <leader><leader>gdp :diffput<CR>
" nnoremap <leader><leader>gdg :diffget<CR>
" Useful for diffing during merge conflicts from 
" middle pane
" nnoremap <leader><leader>gdl :diffget //3<CR>
" nnoremap <leader><leader>gdh :diffget //2<CR>
" status 
nnoremap <C-g> :G<CR>
" quickfix menu of log
nnoremap \gl :G log<CR>
" patch mode
nnoremap \gp :Gdiffsplit<CR>

" unimpaired
nnoremap <silent> <space>] :cnext<CR>zz
nnoremap <silent> <space>[ :cprevious<CR> 

" lua snippet
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" undo tree toggle
nnoremap <leader>u :UndotreeToggle<CR>

nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR> 

lua << EOF
require("git-worktree").setup{}
require("telescope").load_extension("git_worktree")
require("nvim-lsp-installer").setup {
  -- automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}

-- local nvim_lsp = require('lspconfig')

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
--local on_attach = function(client, bufnr)
--  -- Enable completion triggered by <c-x><c-o>
--  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--  -- Mappings.
--  -- See `:help vim.lsp.*` for documentation on any of the below functions
--  local bufopts = { noremap=true, silent=true, buffer=bufnr }
--  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--  vim.keymap.set('n', '<space>wl', function()
--    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--  end, bufopts)
--  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
--end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = {
--  {
--    name = 'angularls',
--    root_dir = nvim_lsp.util.root_pattern("angular.json"),
--  },
--   'bashls',
--   'cssls',
--   'cssmodules_ls',
--   'dockerls',
--   'emmet_ls',
--   'eslint',
--   'golangci_lint_ls',
--   'gopls',
--   'graphql',
--   'html',
--   'jsonls',
--   'phpactor',
--   'pylsp',
--   'pyright',
--   'rust_analyzer',
--   'sqlls',
--   'stylelint_lsp',
--   'tsserver',
--   'vimls',
-- }

local lspconfig = require('lspconfig')
lspconfig.angularls.setup {}
lspconfig.bashls.setup {}
lspconfig.clojure_lsp.setup{}
lspconfig.cssls.setup {}
-- lspconfig.cssmodules_ls.setup {}
lspconfig.dockerls.setup {}
lspconfig.emmet_ls.setup {}
-- lspconfig.eslint.setup {}
lspconfig.golangci_lint_ls.setup {}
lspconfig.gopls.setup {}
lspconfig.graphql.setup {}
lspconfig.html.setup {}
lspconfig.jsonls.setup {}
lspconfig.phpactor.setup {}
lspconfig.pylsp.setup {}
lspconfig.pyright.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.sqlls.setup {}
-- lspconfig.stylelint_lsp.setup {}
lspconfig.tsserver.setup {}
lspconfig.vimls.setup {}
lspconfig.zk.setup{}


-- for _, lsp in pairs(servers) do
--   require('lspconfig')[lsp].setup {
--     -- on_attach = on_attach,
--     flags = {
--       -- This will be the default in neovim 0.7+
--       debounce_text_changes = 150,
--     }
--   }
-- end

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "html",
    "scss",
    "css",
  },

-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  textobjects = {

    -- text objects: select
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["a,"] = "@parameter.outer",
        ["i,"] = "@parameter.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
          typescript = "(function_definition) @function",
          javascript = "(function_definition) @function",
        },
      },
    },

    -- text objects: swap
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },

    -- text objects: move
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
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

    -- text objects: lsp interop
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["df"] = "@function.outer",
        ["dF"] = "@class.outer",
      },
    },
  },

  -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
  context_commentstring = { enable = true, },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript" }

-- auto completion
local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<Tab>'] = cmp.mapping.scroll_docs(-4),
      ['<S-Tab>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'buffer' },
      { name = 'cmp_tabnine' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

-- custom completion item kind
require('vim.lsp.protocol').CompletionItemKind = {
    '  Text         ', -- Text
    '  Method       ', -- Method
    '  Function     ', -- Function
    '  Constructor  ', -- Constructor
    '  Field        ', -- Field
    '  Variable     ', -- Variable
    '  Class        ', -- Class
    'ﰮ  Interface    ', -- Interface
    '  Module       ', -- Module
    '  Property     ', -- Property
    '  Unit         ', -- Unit
    '  Value        ', -- Value
    '了 Enum         ', -- Enum
    '  Keyword      ', -- Keyword
    '﬌  Snippet      ', -- Snippet
    '  Color        ', -- Color
    '  File         ', -- File
    '  Reference    ', -- Reference
    '  Folder       ', -- Folder
    '  EnumMember   ', -- EnumMember
    '  Constant     ', -- Constant
    '  Struct       ', -- Struct
    '  Event        ', -- Event
    'ﬦ  Operator     ', -- Operator
    '  TypeParameter', -- TypeParameter
}

-- status line
local status, lualine = pcall(require, "lualine")
if (not status) then return end
lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'solarized_dark',
    section_separators = {'', ''},
    component_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {
      { 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'ObsessionStatus()', 'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
}

-- nvim tree
-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).

require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
  hijack_cursor = true,
  open_on_tab = true,
  reload_on_bufenter = true,
  remove_keymaps = { "<C-k>", "<C-e>", "g?" },
  update_focused_file = {
    enable = true,
  },
  view = {
    width = 40,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      list = {
        { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
        { key = "?",                              action = "toggle_help" },
      },
    },
  },
  renderer = {
    full_name = true,
    highlight_opened_files = "all",
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {"dist"},
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
    }
  },
  git = {
    show_on_dirs = false,
  },
  actions = {
    change_dir = {
      restrict_above_cwd = true,
    },
    expand_all = {
      exclude = { ".git", "dist", "build", "public" },
    },
  },
} -- END_DEFAULT_OPTS


-- sniprun
require'sniprun'.setup({
  selected_interpreters = {},     -- # use those instead of the default for the current filetype
  repl_enable = {},               -- # enable REPL-like behavior for the given interpreters
  repl_disable = {},              -- # disable REPL-like behavior for the given interpreters

  interpreter_options = {         -- # intepreter-specific options, see docs / :SnipInfo <name>
    GFM_original = {
      use_on_filetypes = {"markdown.pandoc"}    -- # the 'use_on_filetypes' configuration key is
                                                -- # available for every interpreter
    }
  },      

  -- # you can combo different display modes as desired
  display = {
    "Classic",                    -- # display results in the command-line  area
    "VirtualTextOk",              -- # display ok results as virtual text (multiline is shortened)

    -- "VirtualTextErr",          -- # display error results as virtual text
    -- "TempFloatingWindow",      -- # display results in a floating window
    -- "LongTempFloatingWindow",  -- # same as above, but only long results. To use with VirtualText__
    -- "Terminal",                -- # display results in a vertical split
    -- "TerminalWithCode",        -- # display results and code history in a vertical split
    -- "NvimNotify",              -- # display with the nvim-notify plugin
    -- "Api"                      -- # return output to a programming interface
  },

  display_options = {
    terminal_width = 45,       -- # change the terminal display option width
    notification_timeout = 5   -- # timeout for nvim_notify output
  },

  -- # You can use the same keys to customize whether a sniprun producing
  -- # no output should display nothing or '(no output)'
  show_no_output = {
    "Classic",
    "TempFloatingWindow",      -- # implies LongTempFloatingWindow, which has no effect on its own
  },

  -- # customize highlight groups (setting this overrides colorscheme)
  snipruncolors = {
    SniprunVirtualTextOk   =  {bg="#66eeff",fg="#000000",ctermbg="Cyan",cterfg="Black"},
    SniprunFloatingWinOk   =  {fg="#66eeff",ctermfg="Cyan"},
    SniprunVirtualTextErr  =  {bg="#881515",fg="#000000",ctermbg="DarkRed",cterfg="Black"},
    SniprunFloatingWinErr  =  {fg="#881515",ctermfg="DarkRed"},
  },

  -- # miscellaneous compatibility/adjustement settings
  inline_messages = 0,             -- # inline_message (0/1) is a one-line way to display messages
				   -- # to workaround sniprun not being able to display anything

  borders = 'single',              -- # display borders around floating windows
                                   -- # possible values are 'none', 'single', 'double', or 'shadow'
  live_mode_toggle='off'       -- # live mode toggle, see Usage - Running for more info   
})


local lspsaga = require 'lspsaga'
lspsaga.setup { -- defaults ...
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  diagnostic_header_icon = "   ",
  -- code action title icon
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  definition_preview_icon = "  ",
  border_style = "single",
  rename_prompt_prefix = "➤",
  rename_output_qflist = {
    enable = false,
    auto_open_qflist = false,
  },
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. ",
  diagnostic_message_format = "%m %c",
  highlight_prefix = false,
}

require("trouble").setup {}
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)

require('Comment').setup {}

require('neogit').setup {}

require('nvim-autopairs').setup {}
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
local handlers = require('nvim-autopairs.completion.handlers')

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done({
    filetypes = {
      -- "*" is a alias to all filetypes
      ["*"] = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          handler = handlers["*"]
        }
      },
      lua = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method
          },
          ---@param char string
          ---@param item item completion
          ---@param bufnr buffer number
          handler = function(char, item, bufnr)
            -- Your handler function. Inpect with print(vim.inspect{char, item, bufnr})
          end
        }
      },
      -- Disable for tex
      tex = false
    }
  })
)

require("luasnip.loaders.from_vscode").lazy_load()

-- Call hierarchy stuff
require('litee.lib').setup({})
require('litee.calltree').setup({})

-- REPL
require("iron.core").setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        command = {"zsh"}
      }
    },
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = require('iron.view').bottom(40),
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_file = "<space>sf",
    send_line = "<space>sl",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  }
}

-- DAP
local dap = require('dap')

dap.configurations = {
  go = {
    {
        type = 'go';
        name = 'Debug';
        request = 'launch';
        showLog = false;
        program = "${file}";
        dlvToolPath = vim.fn.exepath('dlv')  -- Adjust to where delve is installed
    },
  },
  javascript = {
    {
      name = 'Launch',
      type = 'node2',
      request = 'launch',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      console = 'integratedTerminal',
    },
    {
      -- For this to work you need to make sure the node process is started with the `--inspect` flag.
      name = 'Attach to process',
      type = 'node2',
      request = 'attach',
      processId = require'dap.utils'.pick_process,
    },
  },
  typescript = {
    name = 'Debug with Firefox',
    type = 'firefox',
    request = 'launch',
    reAttach = true,
    url = 'http://localhost:3000',
    webRoot = '${workspaceFolder}',
    firefoxExecutable = '/usr/bin/firefox'
  },
  typescriptreact = { -- change to typescript if needed
    {
      type = "chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}"
    }
  },
  javascriptreact = { -- change this to javascript if needed
    {
      type = "chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}"
    }
  },
}

dap.adapters = {
  go = {
    type = 'executable';
    command = 'node';
    args = {os.getenv('HOME') .. '/dev/golang/vscode-go/dist/debugAdapter.js'};
  },
  chrome = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. "/path/to/vscode-chrome-debug/out/src/chromeDebug.js"} -- TODO adjust
  },
  firefox = {
    type = 'executable',
    command = 'node',
    args = {os.getenv('HOME') .. '/path/to/vscode-firefox-debug/dist/adapter.bundle.js'},
  },
  node2 = {
    type = 'executable',
    command = 'node',
    args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
  },
}

require("dapui").setup()
require("nvim-dap-virtual-text").setup()

require("treesitter-context").setup()

require("symbols-outline").setup({
  show_relative_numbers = true,
})

require("marks").setup()

require('bufdel').setup({
  next = 'tabs',  -- or 'cycle, 'alternate'
  quit = true,    -- quit Neovim when last buffer is closed
})

EOF


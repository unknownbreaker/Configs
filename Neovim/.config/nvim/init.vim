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

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects' "text objects
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
Plug 'hrsh7th/nvim-compe' "auto completion
Plug 'kyazdani42/nvim-web-devicons' "file icons
Plug 'kyazdani42/nvim-tree.lua' "file tree
Plug 'tpope/vim-commentary' "comment the code
Plug 'preservim/nerdcommenter' " more comment options
Plug 'christoomey/vim-tmux-navigator' 
Plug 'christoomey/vim-tmux-runner' "vim and tmux integration
Plug 'tpope/vim-obsession' "remember vim sessions
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' "repeats more than just native commands
Plug 'szw/vim-maximizer' "maximize current pane
Plug 'puremourning/vimspector' "debugger tool
Plug 'tpope/vim-unimpaired' "cnext and cprev mappings
Plug 'mhinz/vim-signify' "git symbols in gutter; faster than gitgutter
Plug 'sbdchd/neoformat' " prettier
Plug 'wellle/targets.vim' " super charge separators and selecting text objs
Plug 'L3MON4D3/LuaSnip' " snippet engine
Plug 'rafamadriz/friendly-snippets' " repo of snippets
Plug 'junegunn/gv.vim' " peruse git commits; depends on fugitive
Plug 'kevinhwang91/nvim-bqf' " quickfix list editing
Plug 'ThePrimeagen/git-worktree.nvim' " git worktree telescopic
Plug 'lukas-reineke/indent-blankline.nvim' " show me what the blanks are
Plug 'chentau/marks.nvim' " marks

call plug#end()

colorscheme one
highlight Normal guibg=none

autocmd BufWritePre *.js Neoformat

nnoremap <SPACE> <Nop>
let mapleader = " "

" Search but keep very magic enabled
nnoremap / /\v

" Split windows and move into new split
nnoremap <Leader>sh :vsplit<CR>
nnoremap <Leader>sl :vsplit<CR><C-W><c-l>
nnoremap <Leader>sj :split<CR><C-W><c-j>
nnoremap <Leader>sk :split<CR>

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

" Marks
nnoremap <C-e> :<C-u>marks<CR>:normal! `

" quick close window without save
nnoremap <leader>q :q<CR>
" quick save
nnoremap <leader>w :w<CR>
" quick save and close
nnoremap <leader>x :x<CR>

" jump list mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" close all open buffers and reopen last one
" recenter cursor and last position
command! BufOnly execute '%bdelete|edit #|normal `"zz'
nnoremap <silent><leader>o :BufOnly<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <C-n>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-p> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>gf <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>tt <cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>
nnoremap <leader>tc <cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>

nnoremap <leader>` <cmd>lua require('telescope.builtin').marks()<cr>

nnoremap <leader>vd <cmd>lua vim.lsp.buf.definition()<CR>zz
nnoremap <leader>vi <cmd>lua vim.lsp.buf.implementation()<CR>zz
nnoremap <leader>vsh <cmd>lua vim.lsp.buf.signature_help()<CR>zz
nnoremap <leader>vr <cmd>lua vim.lsp.buf.references()<CR>zz
nnoremap <leader>vD <cmd>lua vim.lsp.buf.type_definition()<CR>zz
nnoremap <leader>vR <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>vp <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>zz
nnoremap <leader>vn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>zz

" Navigate quickfix
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprev<CR>

" file tree
" https://github.com/kyazdani42/nvim-tree.lua
nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" auto completion
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

let g:python3_host_prog = '/usr/local/bin/python3'

" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>
nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" fugitive maps
" Helpful for patch mode
" index is in left pane
" working tree is in right pane
nnoremap <leader><leader>gdp :diffput<CR>
nnoremap <leader><leader>gdg :diffget<CR>
" Useful for diffing during merge conflicts from 
" middle pane
nnoremap <leader><leader>gdl :diffget //3<CR>
nnoremap <leader><leader>gdh :diffget //2<CR>
" status 
nnoremap <leader><leader>gs :G<CR>
" quickfix menu of log
nnoremap <leader><leader>gl :G log<CR>
" fugitive patchmode
nnoremap <leader><leader>gco :G checkout<Space>
nnoremap <leader><leader>gP :G pull<CR>
nnoremap <leader><leader>gpo :G push origin HEAD<CR>

nnoremap <leader><leader>gap :Gdiffsplit<CR>

" unimpaired
nnoremap <silent> <space>] :cnext<CR>zz
nnoremap <silent> <space>[ :cprevious<CR> 

" lua snippet
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" undo tree toggle
nnoremap <leader>u :UndotreeToggle<CR>

nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR> 

lua << EOF
require("git-worktree").setup{}
require("telescope").load_extension("git_worktree")

require'lspconfig'.bashls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.graphql.setup{}
require'lspconfig'.perlpls.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.sqlls.setup{}
require'lspconfig'.tsserver.setup{}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

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
    "scss"
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }

-- auto completion
vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}

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
    lualine_z = {'location'}
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


-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
require'nvim-treesitter.configs'.setup {
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
}

-- nvim tree
-- following options are the default
require'nvim-tree'.setup {
  -- disables netrw completely
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close          = false,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = false,
  -- hijacks new directory buffers when they are opened.
  update_to_buf_dir   = {
    -- enable the feature
    enable = true,
    -- allow to open the tree if it was previously closed
    auto_open = true,
  },
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd          = false,
  -- show lsp diagnostics in the signcolumn
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 30,
    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    height = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  }
}

EOF


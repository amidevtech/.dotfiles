" ============================================================================
" BEST-IN-CLASS NEOVIM CONFIG FOR ANGULAR/JAVA/TYPESCRIPT/MARKDOWN
" ============================================================================
"
" PHILOSOPHY:
" - <space> = Buffer actions (navigation, LSP, formatting within file)
" - <leader> = Global actions (files, git, projects, cross-file operations)
" - Focus on Angular, Java, TypeScript, and Markdown development
" - Gruvbox theme for consistent, pleasant development experience
"
" KEY BINDINGS SUMMARY:
" <space> + [key] = Buffer operations (navigation, LSP, formatting)
" <leader> + [key] = Global operations (files, git, projects)
"
" ESSENTIAL PLUGINS INCLUDED:
" - LSP: nvim-lspconfig, cmp, typescript.nvim (Angular/Java/TypeScript support)
" - Navigation: telescope, harpoon, hop
" - Git: fugitive, gitsigns, diffview
" - UI: gruvbox, lualine, bufferline
" - Testing: neotest, vim-test
" - Markdown: markdown-preview, table-mode
" - Utilities: trouble, symbols-outline, zen-mode
"
" SETUP INSTRUCTIONS:
" 1. Install vim-plug: curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 2. Run :PlugInstall
" 3. For Java: Install jdtls language server
" 4. For Angular: npm install -g @angular/language-server
" ============================================================================

" Basic Vim settings
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,cp866
set termencoding=utf-8
set ttyfast
set updatetime=300
set timeoutlen=500
set ttimeoutlen=50

" Performance optimizations
set lazyredraw
set regexpengine=1
set synmaxcol=300
set maxmempattern=2000

" Editor basics
set number
set relativenumber
set cursorline
set signcolumn=yes
set colorcolumn=120
set wrap
set linebreak
set showbreak=↪\
set textwidth=0
set wrapmargin=0

" Indentation and tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set smartindent
set shiftround

" Search and completion
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set completeopt=menu,menuone,noselect
set wildmenu
set wildmode=longest:full,full
set wildignore+=*/node_modules/*,*/.git/*,*/dist/*,*/build/*,*/target/*

" Files and buffers
set hidden
set autoread
set autowrite
set nobackup
set nowritebackup
set noswapfile
set undofile
set undodir=~/.config/nvim/undodir

" UI and colors
set background=dark
set termguicolors
syntax enable
set noshowmode
set showcmd
set cmdheight=2
set laststatus=3
set ruler
set list
set listchars=tab:→\ ,trail:·,nbsp:␣,extends:⟩,precedes:⟨

" Mouse and clipboard
set mouse=a
set clipboard=unnamedplus

" Folding
set foldmethod=indent
set foldlevel=99
set foldenable
set foldcolumn=0

" Leaders
let mapleader = ","
let maplocalleader = "\<space>"

" Plugin management
call plug#begin('~/.config/nvim/plugged')

" ===== CORE FUNCTIONALITY =====
Plug 'tpope/vim-fugitive'                    " Git integration
Plug 'tpope/vim-surround'                    " Surround text objects
Plug 'tpope/vim-commentary'                  " Comment/uncomment
Plug 'tpope/vim-repeat'                      " Repeat plugin commands

" ===== LSP AND COMPLETION =====
Plug 'neovim/nvim-lspconfig'                 " LSP configurations
Plug 'hrsh7th/nvim-cmp'                      " Completion engine
Plug 'hrsh7th/cmp-nvim-lsp'                  " LSP completion source
Plug 'hrsh7th/cmp-buffer'                    " Buffer completion source
Plug 'hrsh7th/cmp-path'                      " Path completion source
Plug 'hrsh7th/cmp-cmdline'                   " Command line completion
Plug 'L3MON4D3/LuaSnip'                      " Snippet engine
Plug 'saadparwaiz1/cmp_luasnip'              " Snippet completion source
Plug 'onsails/lspkind.nvim'                  " LSP completion icons

" ===== NAVIGATION AND SEARCH =====
Plug 'nvim-lua/plenary.nvim'                 " Lua utilities
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'ThePrimeagen/harpoon'                  " Quick file navigation
Plug 'phaazon/hop.nvim'                      " Easy motion navigation

" ===== SYNTAX HIGHLIGHTING =====
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" ===== UI AND THEMES =====
Plug 'morhetz/gruvbox'                       " Gruvbox theme
Plug 'nvim-lualine/lualine.nvim'             " Status line
Plug 'akinsho/bufferline.nvim'               " Buffer tabs
Plug 'kyazdani42/nvim-web-devicons'          " Icons
Plug 'lukas-reineke/indent-blankline.nvim'   " Indent guides

" ===== GIT INTEGRATION =====
Plug 'lewis6991/gitsigns.nvim'               " Git signs
Plug 'sindrets/diffview.nvim'                " Git diff view
Plug 'TimUntersberger/neogit'                " Git interface

" ===== TESTING =====
Plug 'nvim-neotest/nvim-nio'                 " Async library for tests
Plug 'nvim-neotest/neotest'                  " Testing framework
Plug 'nvim-neotest/neotest-jest'             " Jest adapter
Plug 'vim-test/vim-test'                     " Vim test runner

" ===== DEBUGGING =====
Plug 'mfussenegger/nvim-dap'                 " Debug Adapter Protocol
Plug 'rcarriga/nvim-dap-ui'                  " DAP UI

" ===== UTILITIES =====
Plug 'folke/trouble.nvim'                    " Diagnostics viewer
Plug 'simrat39/symbols-outline.nvim'         " Symbols outline
Plug 'folke/zen-mode.nvim'                   " Distraction-free mode
Plug 'windwp/nvim-autopairs'                 " Auto pairs
Plug 'norcalli/nvim-colorizer.lua'           " Color highlighter

" ===== LANGUAGE SPECIFIC =====
" Angular/TypeScript/Java
Plug 'jose-elias-alvarez/typescript.nvim'    " Enhanced TypeScript support

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'dhruvasagar/vim-table-mode'            " Markdown table editing

" ===== ENHANCED FEATURES =====
Plug 'folke/which-key.nvim'                  " Keybinding helper
Plug 'folke/todo-comments.nvim'              " TODO comments
Plug 'ahmedkhalf/project.nvim'               " Project management

call plug#end()

" ===== THEME AND COLORS =====
colorscheme gruvbox
set background=dark

" ===== BASIC MAPPINGS =====

" Clear search highlighting
nnoremap <esc><esc> :noh<CR>

" Better window navigation
nmap <space>h <C-w>h
nmap <space>j <C-w>j
nmap <space>k <C-w>k
nmap <space>l <C-w>l

" Better buffer navigation
nmap <space>n :bnext<CR>
nmap <space>p :bprevious<CR>
nmap <space>d :bdelete<CR>
nmap <space>bd :%bdelete<CR>

" Quick save
nmap <space>s :w<CR>
nmap <space>q :q<CR>
nmap <space>wq :wq<CR>

" ===== LSP MAPPINGS (Buffer Actions) =====
nmap <space>gd <cmd>lua vim.lsp.buf.definition()<CR>
nmap <space>gr <cmd>Telescope lsp_references<CR>
nmap <space>gi <cmd>Telescope lsp_implementations<CR>
nmap <space>gt <cmd>lua vim.lsp.buf.type_definition()<CR>
nmap <space>rn <cmd>lua vim.lsp.buf.rename()<CR>
nmap <space>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nmap <space>ff <cmd>lua vim.lsp.buf.format({ async = true })<CR>
nmap <space>e <cmd>lua vim.diagnostic.open_float()<CR>
nmap <space>[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nmap <space>] <cmd>lua vim.diagnostic.goto_next()<CR>
nmap <space>ds <cmd>Telescope lsp_document_symbols<CR>
nmap <space>ws <cmd>Telescope lsp_workspace_symbols<CR>

" ===== TELESCOPE MAPPINGS (Global Actions) =====
nmap <leader>ff <cmd>Telescope find_files<CR>
nmap <leader>fg <cmd>Telescope live_grep<CR>
nmap <leader>fb <cmd>Telescope buffers<CR>
nmap <leader>fh <cmd>Telescope help_tags<CR>
nmap <leader>fr <cmd>Telescope oldfiles<CR>
nmap <leader>fc <cmd>Telescope commands<CR>
nmap <leader>fm <cmd>Telescope marks<CR>
nmap <leader>ft <cmd>Telescope treesitter<CR>

" ===== GIT MAPPINGS (Global Actions) =====
nmap <leader>gs <cmd>lua require('neogit').open()<CR>
nmap <leader>gc <cmd>Telescope git_commits<CR>
nmap <leader>gb <cmd>Telescope git_branches<CR>
nmap <leader>gd <cmd>lua require('diffview').open()<CR>
nmap <leader>gf <cmd>lua require('diffview').file_history()<CR>

" ===== HARPOON MAPPINGS (Global Actions) =====
nmap <leader>ha <cmd>lua require("harpoon.mark").add_file()<CR>
nmap <leader>hh <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
nmap <leader>h1 <cmd>lua require("harpoon.ui").nav_file(1)<CR>
nmap <leader>h2 <cmd>lua require("harpoon.ui").nav_file(2)<CR>
nmap <leader>h3 <cmd>lua require("harpoon.ui").nav_file(3)<CR>
nmap <leader>h4 <cmd>lua require("harpoon.ui").nav_file(4)<CR>

" ===== TESTING MAPPINGS =====
nmap <space>tt <cmd>lua require("neotest").run.run()<CR>
nmap <space>tf <cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>
nmap <space>ts <cmd>lua require("neotest").summary.toggle()<CR>

" ===== DEBUGGING MAPPINGS =====
nmap <space>db <cmd>lua require('dap').toggle_breakpoint()<CR>
nmap <space>dc <cmd>lua require('dap').continue()<CR>
nmap <space>di <cmd>lua require('dap').step_into()<CR>
nmap <space>do <cmd>lua require('dap').step_over()<CR>
nmap <space>dr <cmd>lua require('dap').repl.open()<CR>
nmap <space>du <cmd>lua require('dapui').toggle()<CR>

" ===== UTILITY MAPPINGS =====
nmap <leader>tt <cmd>TroubleToggle<CR>
nmap <leader>ts <cmd>SymbolsOutline<CR>
nmap <leader>zz <cmd>ZenMode<CR>
nmap <leader>td <cmd>TodoTelescope<CR>

" ===== MARKDOWN MAPPINGS =====
autocmd FileType markdown nmap <space>mp <cmd>MarkdownPreviewToggle<CR>
autocmd FileType markdown nmap <space>mt <cmd>TableModeToggle<CR>

" ===== LUA CONFIGURATION =====
lua << EOF
-- Enable vim loader for better performance
if vim.loader then
  vim.loader.enable()
end

-- ===== LSP CONFIGURATION =====
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- TypeScript/JavaScript LSP
require('typescript').setup({
  server = {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      -- Format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("Format", { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end,
  },
})

-- Angular LSP
lspconfig.angularls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
})

-- Java LSP (JDTLS)
lspconfig.jdtls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
})

-- ===== COMPLETION CONFIGURATION =====
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),
})

-- ===== TREESITTER CONFIGURATION =====
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "javascript", "typescript", "tsx", "java", "html", "css",
    "json", "markdown", "bash", "lua", "vim", "yaml", "dockerfile"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
})

-- ===== TELESCOPE CONFIGURATION =====
local telescope = require('telescope')
telescope.setup({
  defaults = {
    prompt_prefix = "🔍 ",
    selection_caret = "➤ ",
    file_ignore_patterns = { "node_modules", ".git", "dist", "build" },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
})
telescope.load_extension('fzf')

-- ===== HARPOON CONFIGURATION =====
require('harpoon').setup({
  global_settings = {
    save_on_toggle = false,
    save_on_change = true,
    enter_on_sendcmd = false,
  }
})

-- ===== LUALINE CONFIGURATION =====
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', {'diagnostics', sources={'nvim_lsp'}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})

-- ===== BUFFERLINE CONFIGURATION =====
require('bufferline').setup({
  options = {
    mode = "buffers",
    numbers = "ordinal",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator = {
      icon = '▎',
      style = 'icon',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 30,
    max_prefix_length = 30,
    tab_size = 21,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "slant",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  }
})

-- ===== GITSIGNS CONFIGURATION =====
require('gitsigns').setup({
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 1000,
  },
})

-- ===== NEOTEST CONFIGURATION =====
require('neotest').setup({
  adapters = {
    require('neotest-jest')({
      jestCommand = "npm test --",
      jestConfigFile = "jest.config.js",
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    }),
  }
})

-- ===== DAP CONFIGURATION =====
local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- ===== TROUBLE CONFIGURATION =====
require('trouble').setup({
  position = "bottom",
  height = 10,
  width = 50,
  icons = true,
  mode = "workspace_diagnostics",
  fold_open = "",
  fold_closed = "",
  group = true,
  padding = true,
})

-- ===== SYMBOLS OUTLINE CONFIGURATION =====
require('symbols-outline').setup()

-- ===== ZEN MODE CONFIGURATION =====
require('zen-mode').setup({
  window = {
    backdrop = 0.95,
    width = 120,
    height = 1,
    options = {
      signcolumn = "no",
      number = false,
      relativenumber = false,
      cursorline = false,
      cursorcolumn = false,
      foldcolumn = "0",
      list = false,
    },
  },
})

-- ===== AUTO PAIRS CONFIGURATION =====
require('nvim-autopairs').setup({})

-- ===== COLORIZER CONFIGURATION =====
require('colorizer').setup()

-- ===== WHICH KEY CONFIGURATION =====
require('which-key').setup({
  plugins = {
    spelling = {
      enabled = true,
      suggestions = 20,
    },
  },
})

-- ===== TODO COMMENTS CONFIGURATION =====
require('todo-comments').setup({
  signs = true,
  keywords = {
    FIX = {
      icon = " ",
      color = "error",
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },
})

-- ===== PROJECT CONFIGURATION =====
require('project_nvim').setup({
  manual_mode = false,
  detection_methods = { "lsp", "pattern" },
  patterns = { ".git", "package.json", "pom.xml", "angular.json", "Makefile" },
})

-- ===== HOP CONFIGURATION =====
require('hop').setup()

EOF

" ===== FILETYPE SPECIFIC SETTINGS =====

" Java settings
autocmd FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4

" TypeScript/React settings
autocmd FileType typescript,typescriptreact,javascript,javascriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Markdown settings
autocmd FileType markdown setlocal wrap linebreak textwidth=0 wrapmargin=0
autocmd FileType markdown setlocal spell spelllang=en_us

" JSON settings
autocmd FileType json setlocal tabstop=2 shiftwidth=2 softtabstop=2

" ===== ADDITIONAL UTILITY FUNCTIONS =====

" Function to toggle between relative and absolute line numbers
function! ToggleNumber()
  if &relativenumber
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunction

" Toggle line numbers
nmap <leader>tn :call ToggleNumber()<CR>

" Quick edit/reload vimrc
nmap <leader>ve :e $MYVIMRC<CR>
nmap <leader>vr :source $MYVIMRC<CR>

" ===== FINAL OPTIMIZATIONS =====

" Enable true color support
if exists('+termguicolors')
  set termguicolors
endif

" Better diff colors for gruvbox
highlight DiffAdd    ctermbg=22 guibg=#005f00
highlight DiffDelete ctermbg=52 guibg=#5f0000
highlight DiffChange ctermbg=17 guibg=#00005f
highlight DiffText   ctermbg=21 guibg=#0000ff

" Make background transparent for floating windows
highlight NormalFloat guibg=NONE ctermbg=NONE

" ===== QUICK REFERENCE GUIDE =====
" ============================================================================
"
" <space> + [key] = BUFFER OPERATIONS (Navigation, LSP, Formatting)
" ============================================================================
"
" WINDOW/BUFFER NAVIGATION:
" <space>h/j/k/l  - Move between windows
" <space>n/p      - Next/Previous buffer
" <space>d        - Delete buffer
" <space>bd       - Delete all buffers
" <space>s/q/wq   - Save/Quit/Save&Quit
"
" LSP OPERATIONS:
" <space>gd       - Go to definition
" <space>gr       - Find references
" <space>gi       - Go to implementation
" <space>gt       - Go to type definition
" <space>rn       - Rename symbol
" <space>ca       - Code actions
" <space>ff       - Format file
" <space>e        - Show diagnostics
" <space>]/[      - Next/Previous diagnostic
" <space>ds       - Document symbols
" <space>ws       - Workspace symbols
"
" TESTING & DEBUGGING:
" <space>tt       - Run test under cursor
" <space>tf       - Run all tests in file
" <space>ts       - Toggle test summary
" <space>db       - Toggle breakpoint
" <space>dc       - Continue debugging
" <space>di       - Step into
" <space>do       - Step over
" <space>du       - Toggle debug UI
"
" MARKDOWN:
" <space>mp       - Toggle markdown preview
" <space>mt       - Toggle table mode
"
" ============================================================================
"
" <leader> + [key] = GLOBAL OPERATIONS (Files, Git, Projects)
" ============================================================================
"
" FILE OPERATIONS:
" <leader>ff      - Find files
" <leader>fg      - Live grep
" <leader>fb      - Find buffers
" <leader>fr      - Recent files
" <leader>fh      - Help tags
" <leader>fm      - Marks
" <leader>fc      - Commands
" <leader>ft      - Treesitter symbols
"
" GIT OPERATIONS:
" <leader>gs      - Git status (Neogit)
" <leader>gc      - Git commits
" <leader>gb      - Git branches
" <leader>gd      - Git diff view
" <leader>gf      - File history
"
" HARPOON (Quick File Navigation):
" <leader>ha      - Add file to harpoon
" <leader>hh      - Harpoon menu
" <leader>h1-4    - Jump to harpoon files 1-4
"
" UTILITY OPERATIONS:
" <leader>tt      - Toggle Trouble (diagnostics)
" <leader>ts      - Toggle Symbols Outline
" <leader>zz      - Toggle Zen Mode
" <leader>td      - Todo telescope
" <leader>tn      - Toggle line numbers
" <leader>ve      - Edit vimrc
" <leader>vr      - Reload vimrc
"
" ============================================================================
"
" ESSENTIAL WORKFLOW:
" 1. <leader>ff to find files
" 2. <space>gd to jump to definitions
" 3. <space>rn to rename symbols
" 4. <space>ca for code actions
" 5. <leader>gs for git operations
" 6. <leader>ha to bookmark important files
" ============================================================================

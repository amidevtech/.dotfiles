" Plug
"
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Jdtls launcher https://github.com/eruizc-dev/jdtls-launcher

" WINDOWS
"au VimEnter * GuiPopupmenu 0


" Make cursor change on terminal
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


syntax on

"set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey
 
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
"Plug 'sheerun/vim-polyglot'
Plug 'machakann/vim-highlightedyank'
"Plug 'gruvbox-community/gruvbox'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'luochen1990/rainbow'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-plug'
Plug 'amiorin/vim-project'
"Plug 'dbakker/vim-projectroot'
"Plug 'easymotion/vim-easymotion'
"Plug 'justinmk/vim-sneak'
Plug 'phaazon/hop.nvim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'Yggdroot/indentLine'
Plug 'Townk/vim-autoclose'
Plug 'prettier/vim-prettier'

Plug 'vim-test/vim-test'

Plug 'wesQ3/vim-windowswap'
Plug 'troydm/zoomwintab.vim'


Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'


Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'

" CMP
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'onsails/lspkind-nvim'

Plug 'ThePrimeagen/harpoon'

" DODAC LSP SAGA
Plug 'glepnir/lspsaga.nvim'
Plug 'ray-x/lsp_signature.nvim'



Plug 'maxbrunsfeld/vim-yankstack'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


" AI Complete
Plug 'github/copilot.vim'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

call plug#end()

"  VIM TEST
let test#project_root = "/Users/phazo/projects/opentangarine/hot/hot-app"
let test#strategy = "neovim"

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

" :Rainbow parentheses
let g:rainbow_active = 1 

" ---------------
" Mouse
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a    " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U 
  
let loaded_matchparen = 1
  
" Integrate with system clipboard
set clipboard=unnamedplus,unnamed

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'


autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
autocmd FileType tex setl updatetime=1

let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 1
let g:indent_guides_enable_on_vim_startup = 1

" Nerd Tree options
let NERDTreeShowHidden=1  "  Always show dot files
let NERDTreeQuitOnOpen=1

""" MAPPINGS
let mapleader=','

" Mappings

noremap H ^
noremap L $
"nnoremap D d$
" Primegegen Remaps
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap , ,<c-g>u
inoremap ; ;<c-g>u

" Move visualy marked text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap go o<Esc>k
nnoremap gO O<Esc>j
nmap zk O<Esc>j  
nnoremap gj 15gjzz
nnoremap gk 15gkzz
vnoremap gj 15gjzz
vnoremap gk 15gkzz
inoremap jk <Esc>
nnoremap <esc><esc> :noh<return>

map <leader><leader>e :vsp $MYVIMRC<CR>
map <leader><leader>s :source $MYVIMRC<CR>

" Split window vertically or horizontally *and* switch to the new split!
map <leader>h :split<Bar>:wincmd j<CR>:wincmd =<CR>
map <leader>v :vsplit<Bar>:wincmd l<CR>:wincmd =<CR>


nnoremap <leader>u :UndotreeShow<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>gc :GCheckout<cr>
nmap <leader>gs :G<CR>
nmap <leader>gv :GV<CR>

nnoremap <leader>x :close<CR>
map <Leader>w  :NERDTreeFind<CR>
map <leader>n :bn<CR>
map <leader>p :bp<CR>
map <Leader>q :Goyo 120<CR>;
map <Leader>z :ZoomWinTabToggle<CR>
" Show all diagnostics

nnoremap <space>s :w<CR>
" key bindings for quickly moving between windows: h left, l right, k up, j down
nmap <space>h <c-w>h
nmap <space>l <c-w>l
nmap <space>k <c-w>k
nmap <space>j <c-w>j
nmap <space>b <C-o>
nmap <space>n <C-i>
map <space><Enter> i<Enter><ESC>
map <space>; A;<ESC>


  " See `:help vim.lsp.*` for documentation on any of the below functions
nnoremap gD <Cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap gd <Cmd>lua vim.lsp.buf.definition()<CR>
nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
"noremap gr <cmd>lua vim.lsp.buf.references()<CR>
noremap gr :Telescope lsp_references<CR>
nnoremap gp :Lspsaga preview_definition<CR>

nnoremap gh <cmd>lua vim.lsp.buf.outgoing_calls()<CR>

"nnoremap <silent> gO <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <space><space>o <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW  <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <space>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <space>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <space>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <space>d <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <space>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <space>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <space><space>ca :Lspsaga code_action<CR>
nnoremap <space>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <space>[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <space>] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>'
nnoremap <space>q <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <space>ff <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <space>fr <cmd>lua vim.lsp.buf.range_formatting()<CR>

nnoremap <leader>sr <cmd>lua vim.lsp.buf.server_ready()<CR>
nnoremap <leader>jl <cmd>lua vim.lsp.util.jump_to_location()<CR>
nnoremap gS :Lspsaga signature_help<CR>


command! -nargs=0 OR call: <Cmd>lua require'jdtls'.organize_imports()<CR>

imap ;; <ESC>A;<ESC>


set completeopt=menu,menuone,noselect


" Telescope
map <Leader>r :Telescope oldfiles<CR>
map <leader>f :Telescope git_files<CR>
map <Leader>e :Telescope buffers<CR>
map <leader>t :Telescope live_grep<CR>
"map <leader>t :Telescope lsp_dynamic_workspace_symbols  layout_strategy=vertical<CR>
map <space>f :Telescope current_buffer_fuzzy_find<CR>

map <leader>gc :Telescope git_commits<CR>
map <leader>gbc :Telescope git_bcomits<CR>
map <leader>gb :Telescope git_branches<CR>
map <space>o :Telescope lsp_document_symbols layout_strategy=vertical<CR>

map <space>d :Telescope lsp_document_diagnostics<CR>
map <leader>d :Telescope lsp_workspace_diagnostics<CR>
map <space>r :Telescope lsp_references<CR>

nmap <space>p <Plug>yankstack_substitute_older_paste
nmap <space>P <Plug>yankstack_substitute_newer_paste

map <space>tf :TestFile<CR>
map <space>tt :TestNarest<CR>
map <space>ts :TestSuite<CR>


map <leader>ma :lua require("harpoon.mark").add_file()<CR>
map <leader>mm :lua require("harpoon.ui").toggle_quick_menu()<CR>
map <leader>mq :lua require("harpoon.ui").nav_file(1)<CR>
map <leader>mw :lua require("harpoon.ui").nav_file(2)<CR>
map <leader>mf :lua require("harpoon.ui").nav_file(3)<CR>
map <leader>mp :lua require("harpoon.ui").nav_file(4)<CR>

"map <space>o :Telescope lsp_document_symbols<CR>
"map <leader>o :Telescope lsp_workspace_symbols<CR>

lua local actions = require('telescope.actions') require('telescope').setup{ defaults = { mappings = { i = { ["<esc>"] = actions.close }, }, } }
lua require'nvim-treesitter.configs'.setup { ensure_installed = "maintained", highlight = { enable = true, }, }

:lua << EOF
    -- require'lspconfig'.tsserver.setup{ on_attach=on_attach }

      --Enable (broadcasting) snippet capability for completion
      local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- require'lspconfig'.html.setup{  cmd = { "vscode-html-language-server.cmd", "--stdio" }}
      -- require'lspconfig'.yamlls.setup{ cmd = { "yaml-language-server.cmd", "--stdio" } }
      -- require'lspconfig'.jsonls.setup{ cmd = { "vscode-json-language-server.cmd", "--stdio" }}
      -- require'lspconfig'.angularls.setup{ cmd = { "ngserver.cmd", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" }}

      require'lspconfig'.html.setup{
          capabilities = capabilities,
      }
      require'lspconfig'.yamlls.setup{
          capabilities = capabilities,
      }
      require'lspconfig'.jsonls.setup{
          capabilities = capabilities,
      }
     -- require'lspconfig'.angularls.setup{}
      require'lspconfig'.cssls.setup{}
      require'lspconfig'.tsserver.setup{
          capabilities = capabilities,
      } 
      require'lspconfig'.jdtls.setup{
          capabilities = capabilities,
          cmd = { 'jdtls' },
          root_dir = function(fname)
             return require'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()   
          end
      }


    require'lsp_signature'.on_attach()

EOF

" lua <<EOF
"   vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
"   vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
"   vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
"   vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
"   vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
"   vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
"   vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
"   vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
" EOF

map <leader>ca <Cmd>lua require('jdtls').code_action()<CR>
"map <leader>ca :Telescope lsp_code_actions<cr>
vnoremap <A-CR> <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
"nnoremap <leader>ca <Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>

nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>


" If using nvim-dap
" This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
nnoremap <leader>df <Cmd>lua require'jdtls'.test_class()<CR>
nnoremap <leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>

command! -buffer JdtCompile lua require('jdtls').compile()
command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
command! -buffer JdtJol lua require('jdtls').jol()
command! -buffer JdtBytecode lua require('jdtls').javap()
command! -buffer JdtJshell lua require('jdtls').jshell()

:lua <<EOF
    local tabnine = require('cmp_tabnine.config')
    tabnine:setup({
            max_lines = 1000;
            max_num_results = 20;
            sort = true;
      run_on_every_keystroke = true;
      snippet_placeholder = '..';
    })

    local lspkind = require "lspkind"
    lspkind.init()



  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<ESC>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true}),
    },
    --  max_item_count = 10 Limits
    sources = cmp.config.sources({
      { name = 'nvim_lsp'},
      { name = 'cmp_tabnine' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'buffer' },
      { name = "path" },
    }),
    formatting = {
      -- Youtube: How to set up nice formatting for your sources.
      format = lspkind.cmp_format {
        with_text = true,
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[LSP]",
          cmp_tabnine = "[Tabnine]",
          path = "[path]",
          vsnip = "[snip]",
        },
      },
    },
    experimental = {
      -- I like the new menu better! Nice work hrsh7th
      native_menu = false,

      -- Let's play with this for a day or two
      ghost_text = true,
    },

  })


  require'hop'.setup()
EOF



let g:test#neovim#start_normal = 1 " If using neovim strategy
let g:test#basic#start_normal = 1 " If using basic strategy



"HOP
map <space>w :HopWord<CR>
map <space><space>l :HopLine<CR>
vnoremap <space>f <cmd>HopChar1<CR>
nnoremap <space>f <cmd>HopChar1<CR>

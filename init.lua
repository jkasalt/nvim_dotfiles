--- Imports
require 'plugins'

--- Utility Functions
function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--- Keymaps
map('', '<leader>c', '"+y') -- Copy to clipboard in normal, visual, select and operator modes
map('i', '<C-u>', '<C-g>u<C-u>') -- Make <C-u> undo-friendly
map('i', '<C-w>', '<C-g>u<C-w>') -- Make <C-w> undo-friendly

-- <Tab> to navigate the completion menu
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
map('n', '<leader>o', 'm`o<Esc>``') -- Insert a newline in normal mode

--- Basic Settings
local opt = vim.opt
local api = vim.api
vim.o.termguicolors = true
-- local color = require('xresources')
vim.g.colors_name = 'seoul256'

opt.completeopt = {'menuone', 'noinsert', 'noselect'} -- Completion options (for deoplete)
opt.hlsearch = false
opt.ignorecase = true -- Ignore case
opt.joinspaces = false -- No double spaces with join
opt.breakindent = true
opt.undofile = true
opt.updatetime = 250
vim.wo.signcolumn = 'yes'
opt.list = true -- Show some invisible characters
opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 6 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent
opt.sidescrolloff = 7 -- Columns of context
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 4 -- Number of spaces tabs count for
opt.wildmode = {'list', 'longest'} -- Command-line completion mode
vim.o.background = 'dark'
vim.g.ttimeoutlen = 50
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.api.nvim_exec([[
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
]], false)
-- vim.g.vimtex_compiler_latexmk_engine = { '_ : -xelatex' }

-- Basic Mappings
api.nvim_set_keymap('n', '<leader><leader>', ':source $MYVIMRC <CR>',
                    {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'",
                        {noremap = true, expr = true, silent = true}) -- Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'",
                        {noremap = true, expr = true, silent = true}) -- Remap for dealing with word wrap
vim.api
    .nvim_set_keymap('n', '<C-h>', "gT <CR>", {noremap = true, silent = true}) -- Remap for dealing with word wrap
vim.api
    .nvim_set_keymap('n', '<C-l>', "gt <CR>", {noremap = true, silent = true}) -- Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true}) -- Y yank until the end of line  (note: this is now a default on master)

-- Npairs
local npairs = require("nvim-autopairs")

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'}, -- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false -- don't check treesitter on java
    },
    ignored_next_char = "[%w%.<>]" -- will ignore alphanumeric and `.` `<` `>` symbols
})

local ts_conds = require('nvim-autopairs.ts-conds')

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)

-- Gitsigns
require('gitsigns').setup {
    signs = {
        add = {hl = 'GitGutterAdd', text = '+'},
        change = {hl = 'GitGutterChange', text = '~'},
        delete = {hl = 'GitGutterDelete', text = '_'},
        topdelete = {hl = 'GitGutterDelete', text = '‾'},
        changedelete = {hl = 'GitGutterChange', text = '~'}
    }
}

-- Telescope
require('telescope').setup {
    defaults = {mappings = {i = {['<C-u>'] = false, ['<C-d>'] = false}}}
}
-- Add leader shortcuts
-- vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sf',
                        [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
                        {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sh',
                        [[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>st',
                        [[<cmd>lua require('telescope.builtin').tags()<CR>]],
                        {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sb',
                        [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ss',
                        [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sp',
                        [[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>so',
                        [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>?',
                        [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
                        {noremap = true, silent = true})

-- TreeSitter
local ts = require 'nvim-treesitter.configs'
ts.setup {
    ensure_installed = 'maintained',
    highlight = {enable = true},
    incremental_selection = {
        enabled = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm'
        }
    },
    indent = {enabled = true},
    move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {[']m'] = '@function.outer', [']]'] = '@class.outer'},
        goto_next_end = {[']M'] = '@function.outer', [']['] = '@class.outer'},
        goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer'
        },
        goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer'
        }
    }
}

-- LSP Config
local nvim_lsp = require 'lspconfig'
-- -- remove annoying floating text
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--         virtual_text = false
--     }
-- )

require('lspfuzzy').setup {}
local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',
                                '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',
                                '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',
                                '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',
                                '<cmd>lua vim.lsp.buf.implementation()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>',
                                '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa',
                                '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr',
                                '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl',
                                '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D',
                                '<cmd>lua vim.lsp.buf.type_definition()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn',
                                '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',
                                '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca',
                                '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e',
                                '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d',
                                '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d',
                                '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q',
                                '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so',
                                [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f',
                                '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
-- local luasnip = require 'luasnip'

---- Example custom server
-- local sumneko_root_path = '/usr/lib/lua-language-server' -- Change to your sumneko root installation
-- local sumneko_binary = sumneko_root_path .. '/bin/Linux/lua-language-server'
--
---- Make runtime files discoverable to the server
-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, 'lua/?.lua')
-- table.insert(runtime_path, 'lua/?/init.lua')
--
-- nvim_lsp.sumneko_lua.setup {
--  cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
--  on_attach = on_attach,
--  capabilities = capabilities,
--  settings = {
--    Lua = {
--      runtime = {
--        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--        version = 'LuaJIT',
--        -- Setup your lua path
--        path = runtime_path,
--      },
--      diagnostics = {
--        -- Get the language server to recognize the `vim` global
--        globals = { 'vim' },
--      },
--      workspace = {
--        -- Make the server aware of Neovim runtime files
--        library = vim.api.nvim_get_runtime_file('', true),
--      },
--      -- Do not send telemetry data containing a randomized but unique identifier
--      telemetry = {
--        enable = false,
--      },
--    },
--  },
-- }

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {expand = function(args) vim.fn["vsnip#anonymous"](args.body) end},
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ['<CR>'] = cmp.mapping.confirm({select = true})
    },
    sources = {
        {name = 'nvim_lsp'}, {name = 'vsnip'}, {name = 'treesitter'},
        {name = 'path'}
        -- {name = 'buffer'},
    }
}

-- Start the language servers
-- nvim_lsp.rust_analyzer.setup{
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	settings = {
-- 		checkOnSave = {
-- 			command = "clippy"
-- 		}
-- 	}
-- }

nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {command = "clippy"},
            assist = {importGranularity = "module", importPrefix = "by_self"},
            cargo = {loadOutDirsFromCheck = true},
            procMacro = {enable = false},
            diagnostics = {disabled = {"macro-error", "unresolved-proc-macro"}}
        }
    }
}

nvim_lsp.texlab.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {latexindent = {modifyLineBreaks = true}}
}

nvim_lsp.pyright.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.r_language_server.setup{
	on_attach = on_attach,
	capabilities = capabilities,
}
-- nvim R settings
vim.g.R_assign = 0

vim.g.airline_theme = 'zenburn'

-- vimtex settings
vim.g.vimtex_quickfix_enabled = 0

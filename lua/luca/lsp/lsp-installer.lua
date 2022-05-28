require("nvim-lsp-installer").setup {}

require 'lspconfig'.texlab.setup {
    on_attach = require("luca.lsp.handlers").on_attach,
    capabilities = require("luca.lsp.handlers").capabilities,
    settings = {
        texlab = {
            latexindent = {
                modifyLineBreaks = true
            }
        }
    }
}

require('lspconfig').rust_analyzer.setup {
    on_attach = require("luca.lsp.handlers").on_attach,
    capabilities = require("luca.lsp.handlers").capabilities,
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy"
            }
        }
    }
}

require("lspconfig").sumneko_lua.setup {
    on_attach = require("luca.lsp.handlers").on_attach,
    capabilities = require("luca.lsp.handlers").capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "use" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
}

require("lspconfig").pyright.setup {
    on_attach = require("luca.lsp.handlers").on_attach,
    capabilities = require("luca.lsp.handlers").capabilities,
}

require("lspconfig").tsserver.setup {
    on_attach = require("luca.lsp.handlers").on_attach,
    capabilities = require("luca.lsp.handlers").capabilities,
}

require("lspconfig").cssls.setup {
    on_attach = require("luca.lsp.handlers").on_attach,
    capabilities = require("luca.lsp.handlers").capabilities,
}

require("lspconfig").html.setup {
    on_attach = require("luca.lsp.handlers").on_attach,
    capabilities = require("luca.lsp.handlers").capabilities,
}

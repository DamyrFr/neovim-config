-- LSP servers — must be installed via Nix, e.g.:
--   environment.systemPackages = [ pkgs.pyright pkgs.gopls pkgs.yaml-language-server ... ]
local servers = { "pyright", "yamlls", "jsonls", "remark_ls", "bashls", "dockerls", "gopls", "lua_ls", "terraformls", "helm_ls", "ansiblels" }

-- Diagnostic keymaps
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- LSP keymaps (applied when a server attaches to a buffer)
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- Base capabilities (nvim-cmp integration)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Apply base capabilities to all servers
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, { capabilities = capabilities })
end

-- yamlls: Kubernetes schemas + GitLab CI custom tags
vim.lsp.config('yamlls', {
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        kubernetes = {
          "/*.k8s.yaml", "/*.k8s.yml",
          "/k8s/**/*.yaml", "/k8s/**/*.yml",
          "/kubernetes/**/*.yaml", "/kubernetes/**/*.yml",
          "/manifests/**/*.yaml", "/manifests/**/*.yml",
          "/deployment*.yaml", "/deployment*.yml",
          "/service*.yaml", "/service*.yml",
          "/ingress*.yaml", "/ingress*.yml",
          "/configmap*.yaml", "/configmap*.yml",
          "/secret*.yaml", "/secret*.yml",
        },
      },
      customTags = { "!reference sequence" },
    },
  },
})

vim.lsp.enable(servers)

-- Snippets
local luasnip = require('luasnip')

local yaml_snippets = vim.list_extend(
  vim.deepcopy(require("snippets.kubernetes")),
  require("snippets.gitlab-ci")
)
luasnip.add_snippets("yaml", yaml_snippets)
luasnip.add_snippets("go", require("snippets.go"))
luasnip.add_snippets("sh", require("snippets.sh"))
luasnip.add_snippets("bash", require("snippets.sh"))

-- Completion
local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>']     = cmp.mapping.scroll_docs(-4),
    ['<C-d>']     = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>']      = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
      else fallback() end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then luasnip.jump(-1)
      else fallback() end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

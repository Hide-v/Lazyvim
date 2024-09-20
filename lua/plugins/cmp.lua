return {
  "hrsh7th/nvim-cmp",

  opts = function()
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        -- <Tab>用于补全或确认
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            require("luasnip").expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            require("luasnip").expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        ["<C-Space>"] = cmp.mapping.complete(),
      }),

      sources = cmp.config.sources({
        {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "sepll" },
        },
        {
          { name = "buffer" },
          { name = "path" },
        },
      }),

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }, -- 路径补全
          { name = "cmdline" }, -- 命令补全
        }, {
          { name = "cmdline" }, -- 命令行补全
        }),
      }),

      -- 配置 / 模式的补全
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }, -- 从缓冲区补全内容
        },
      }),
    })
  end,
}

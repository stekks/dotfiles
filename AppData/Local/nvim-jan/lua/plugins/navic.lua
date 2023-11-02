return {
    "SmiteshP/nvim-navic",
    init = function()
        vim.g.navic_silence = true
        require("utils").on_attach(function(client, buffer)
            if client.server_capabilities.documentSymbolProvider then
                require("nvim-navic").attach(client, buffer)
            end
        end)
    end,
    opts = {
        icons = {
            Namespace = "",
            Text = " ",
            Method = " ",
            Function = " ",
            Constructor = " ",
            Field = "ﰠ ",
            Variable = " ",
            Class = "ﴯ ",
            Interface = " ",
            Module = " ",
            Property = "ﰠ ",
            Unit = "塞 ",
            Value = " ",
            Enum = " ",
            Keyword = " ",
            Snippet = " ",
            Color = " ",
            File = " ",
            Reference = " ",
            Folder = " ",
            EnumMember = " ",
            Constant = " ",
            Struct = "פּ ",
            Event = " ",
            Operator = " ",
            TypeParameter = " ",
            Table = "",
            Object = " ",
            Tag = "",
            Array = "[]",
            Boolean = " ",
            Number = " ",
            Null = "ﳠ",
            String = " ",
            Calendar = "",
            Watch = " ",
            Package = "",
            Copilot = " ",
        },
        highlight = true,
    },
}

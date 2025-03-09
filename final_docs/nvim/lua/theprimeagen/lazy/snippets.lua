return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            local ls = require("luasnip")
            ls.filetype_extend("javascript", { "jsdoc" })

            --- Define custom Python snippets with dynamic types and variable names
            local python_snippets = {
                -- Read a single integer
                ls.snippet("readi", {
                    ls.insert_node(1, "n"),
                    ls.text_node(" = int(input())"),
                }),

                -- Read two integers separated by space
                ls.snippet("readmp", {
                    ls.insert_node(1, "n"),
                    ls.text_node(", "),
                    ls.insert_node(2, "m"),
                    ls.text_node(" = map(int, input().split())"),
                }),

                -- Read a list of integers separated by space
                ls.snippet("readic", {
                    ls.insert_node(1, "nums"),
                    ls.text_node(" = list(map(int, input().split())))"),
                }),

                -- Read a list of integer digits
                ls.snippet("readd", {
                    ls.insert_node(1, "nums"),
                    ls.text_node(" = list(map(int, input()))"),
                }),

                -- Read a list of integers separated by a comma
                ls.snippet("readc", {
                    ls.insert_node(1, "nums"),
                    ls.text_node(" = list(map(int, input().split(',')))"),
                }),

                -- Read a list of words separated by space
                ls.snippet("readws", {
                    ls.insert_node(1, "words"),
                    ls.text_node(" = input().split()"),
                }),

                -- Read a list of words separated by a comma
                ls.snippet("readwc", {
                    ls.insert_node(1, "words"),
                    ls.text_node(" = input().split(',')"),
                }),
            }

            -- Add custom Python snippets to LuaSnip
            ls.add_snippets("python", python_snippets)

            -- Keymaps
            vim.keymap.set({ "i" }, "<C-s>e", function() ls.expand() end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-s>;", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-s>,", function() ls.jump(-1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
        end,
    },
    {
        "mlaursen/vim-react-snippets"
    }
}


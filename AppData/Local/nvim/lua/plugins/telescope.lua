return {
    -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    -- branch = '0.1.x',
    dependencies = {
        { "nvim-lua/plenary.nvim" },
--        { 'nvim-telescope/telescope-fzf-native.nvim',
--            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
--            config = function()
--              require("telescope").load_extension("fzf")
--            end,
--        },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-telescope/telescope-file-browser.nvim" },
    },
    keys = {
        { "<leader>?", "<cmd>lua require('telescope.builtin').oldfiles()<cr>" },
        { "<leader><space>", "<cmd>lua require('telescope.builtin').buffers()<cr>" },
        { "<leader>/", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, })<cr>" },
        { "<leader>sf", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
        { "<leader>sh", "<cmd>lua require('telescope.builtin').help_tags()<cr>" },
        { "<leader>sw", "<cmd>lua require('telescope.builtin').grep_string()<cr>" },
        { "<leader>sg", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
        { "<leader>sd", "<cmd>lua require('telescope.builtin').diagnostics()<cr>" },
        { "<leader>sb", ":Telescope file_browser()<cr>" },
    },
    opts = function()
        -- local actions = require("telescope.actions")
        local theme = require("telescope.themes")
        return {
            pickers = {
                find_files = { hidden = true },
                live_grep = {
                    additional_args = function()
                        return { "--hidden" }
                    end,
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
                ["ui-select"] = {
                    theme.get_dropdown({
                        -- even more opts
                    }),
                },
                file_browser = {
                    grouped = true,
                    hidden = true,
                    hijack_netrw = true,
                    respect_gitignore = false,
                },
            },
            defaults = {
              vimgrep_arguments = {
                "rg",
                "-L",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
              },
              prompt_prefix = "   ",
              selection_caret = "  ",
              entry_prefix = "  ",
              initial_mode = "insert",
              selection_strategy = "reset",
              sorting_strategy = "ascending",
              layout_strategy = "horizontal",
              layout_config = {
                horizontal = {
                  prompt_position = "top",
                  preview_width = 0.55,
                  results_width = 0.8,
                },
                vertical = {
                  mirror = false,
                },
                width = 0.87,
                height = 0.80,
                preview_cutoff = 120,
              },
              file_sorter = require("telescope.sorters").get_fuzzy_file,
              file_ignore_patterns = { "node_modules" },
              generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
              path_display = { "truncate" },
              winblend = 0,
              border = {},
              borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
              color_devicons = true,
              set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
              file_previewer = require("telescope.previewers").vim_buffer_cat.new,
              grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
              qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
              -- Developer configurations: Not meant for general override
              buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
              mappings = {
                n = { ["q"] = require("telescope.actions").close },
                i = {
                  ["<C-u>"] = false,
                  ["<C-d>"] = false,
                },
              },
            },
        }
    end,
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        -- telescope.load_extension("fzf")
        telescope.load_extension("ui-select")
        telescope.load_extension("file_browser")
        -- telescope.load_extension("themes")
        -- telescope.load_extension("terms")
    end,
    -- extensions_list = { "themes", "terms" },
}


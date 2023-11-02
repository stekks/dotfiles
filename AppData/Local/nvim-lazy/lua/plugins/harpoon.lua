local function harpoon_add_file()
  local harpoon_mark = require("harpoon.mark")
  harpoon_mark.add_file()
end

local function harpoon_menu()
  local harpoon_ui = require("harpoon.ui")
  harpoon_ui.toggle_quick_menu()
end

return {
  "ThePrimeagen/harpoon",
  keys = {
    { "<leader>hm", harpoon_add_file, desc = "Harpoon add file" },
    { "<leader>hh", harpoon_menu, desc = "Harpoon toggle" },
  },
  opts = {
    global_settings = {
      -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
      save_on_toggle = false,

      -- saves the harpoon file upon every change. disabling is unrecommended.
      save_on_change = true,

      -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
      enter_on_sendcmd = false,

      -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
      tmux_autoclose_windows = false,

      -- filetypes that you want to prevent from adding to the harpoon list menu.
      excluded_filetypes = { "harpoon" },

      -- set marks specific to each git branch inside git repository
      mark_branch = false,
    },
  },
}

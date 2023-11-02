local function toggle_lines()
  local lsp_lines = require("lsp_lines")
  lsp_lines.toggle()
  vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
end

return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  keys = {
    { "<leader>tl", toggle_lines, desc = "Toggle lsp lines" },
  },
  config = function()
    local lsp_lines = require("lsp_lines")
    lsp_lines.setup()
    vim.diagnostic.config({
      virtual_text = true,
      virtual_lines = false,
    })
  end,
}

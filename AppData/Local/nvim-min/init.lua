vim.g.mapleader = " " -- sets leader key
vim.g.netrw_banner = 0 -- gets rid of the annoying banner for netrw
vim.g.netrw_browse_split = 4 -- open in prior window
vim.g.netrw_altv = 1 -- change from left splitting to right splitting
vim.g.netrw_liststyle = 3 -- tree style view in netrw
--vim.cmd("let g:netrw_list_hide=netrw_gitignore#Hide()")
vim.opt.title = true -- show title
vim.cmd("set path+=**") -- search current directory recursively
vim.opt.syntax = "ON"
vim.opt.backup = false
vim.opt.compatible = false -- turn off vi compatibility mode
vim.opt.number = true -- turn on line numbers
vim.opt.relativenumber = true -- turn on relative line numbers
vim.opt.mouse = "a" -- enable the mouse in all modes
vim.opt.ignorecase = true -- enable case insensitive searching
vim.opt.smartcase = true -- all searches are case insensitive unless there's a capital letter
vim.opt.hlsearch = false -- disable all highlighted search results
vim.opt.incsearch = true -- enable incremental searching
vim.opt.wrap = true -- enable text wrapping
vim.opt.tabstop = 4 -- tabs=4spaces
vim.opt.shiftwidth = 4
vim.opt.fileencoding = "utf-8" -- encoding set to utf-8
vim.opt.pumheight = 10 -- number of items in popup menu
vim.opt.showtabline = 2 -- always show the tab line
vim.opt.laststatus = 2 -- always show statusline
vim.opt.signcolumn = "auto"
vim.opt.expandtab = false -- expand tab
vim.opt.smartindent = true
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.showmode = true
vim.opt.scrolloff = 8 -- scroll page when cursor is 8 lines from top/bottom
vim.opt.sidescrolloff = 8 -- scroll page when cursor is 8 spaces from left/right
vim.opt.guifont = "monospace:h17"
vim.opt.clipboard = unnamedplus
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.splitbelow = true -- split go below
vim.opt.splitright = true -- vertical split to the right
vim.opt.termguicolors = true -- terminal gui colors
vim.cmd("colorscheme nord") -- set colorscheme
vim.cmd("filetype plugin on") -- set filetype
vim.cmd("set wildmenu") -- enable wildmenu

--statusline
vim.cmd("highlight StatusType guibg=#b16286 guifg=#1d2021")
vim.cmd("highlight StatusTypeInv guifg=#b16286 guibg=#1d2021")
vim.cmd("highlight StatusFile guibg=#fabd2f guifg=#1d2021")
vim.cmd("highlight StatusFileInv guifg=#fabd2f guibg=#1d2021")
vim.cmd("highlight StatusModified guibg=#1d2021 guifg=#d3869b")
vim.cmd("highlight StatusModifiedInv guifg=#1d2021 guibg=#d3869b")
vim.cmd("highlight StatusBuffer guibg=#98971a guifg=#1d2021")
vim.cmd("highlight StatusBufferInv guifg=#98971a guibg=#1d2021")
vim.cmd("highlight StatusLocation guibg=#458588 guifg=#1d2021")
vim.cmd("highlight StatusLocationInv guifg=#458588 guibg=#1d2021")
vim.cmd("highlight StatusPercent guibg=#1d2021 guifg=#ebdbb2")
vim.cmd("highlight StatusPercentInv guifg=#1d2021 guibg=#ebdbb2")
vim.cmd("highlight StatusNorm guibg=none guifg=white")
vim.cmd("highlight StatusNormInv guifg=none guibg=white")
vim.o.statusline = " "
	.. ""
	.. " "
	.. "%l"
	.. " "
	.. " %#StatusTypeInv#"
	.. ""
	.. "%#StatusType#"
	.. "%Y"
	.. "  "
	.. " %#StatusTypeInv#"
	.. ""
	.. "%#StatusFileInv#"
	.. ""
	.. "%#StatusFile#"
	.. "%F"
	.. "%#StatusFileInv#"
	.. ""
	.. "%#StatusModified#"
	.. "%m"
	.. "%#StatusNorm#"
	.. "%="
	.. "%#StatusBufferInv#"
	.. ""
	.. "%#StatusBuffer#"
	.. "﬘ "
	.. "%n"
	.. "%#StatusBufferInv#"
	.. ""
	.. "%#StatusLocationInv#"
	.. ""
	.. "%#StatusLocation#"
	.. "燐 "
	.. "%l,%c"
	.. "%#StatusLocationInv#"
	.. ""
	.. "%#StatusPercentInv#"
	.. ""
	.. "%#StatusPercent#"
	.. "%p%%  "
	.. "%#StatusPercentInv#"
	.. ""

-- reload config
vim.keymap.set("n", "<leader>cs", ":source ~\\AppData\\Local\\nvim-min\\init.lua<CR>") -- source neovim config
vim.keymap.set("n", "<leader>ce", ":e ~\\AppData\\Local\\nvim-min\\init.lua<CR>") -- edit neovim config

-- Tab bindings
-- vim.keymap.set("n", "<leader>t", ":tabnew<CR>") -- space+t creates new tab
vim.keymap.set("n", "<leader>x", ":tabclose<CR>") -- space+x closes current tab
vim.keymap.set("n", "<leader>j", ":tabprevious<CR>") -- space+j moves to previous tab
vim.keymap.set("n", "<leader>k", ":tabnext<CR>") -- space+k moves to next tab

-- easy split generation
vim.keymap.set("n", "<leader>v", ":vsplit") -- space+v creates a veritcal split
vim.keymap.set("n", "<leader>s", ":split") -- space+s creates a horizontal split

-- Move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h") -- control+h switches to left split
vim.keymap.set("n", "<C-l>", "<C-w>l") -- control+l switches to right split
vim.keymap.set("n", "<C-j>", "<C-w>j") -- control+j switches to bottom split
vim.keymap.set("n", "<C-k>", "<C-w>k") -- control+k switches to top split

-- buffer navigation
vim.keymap.set("n", "<Tab>", ":bnext <CR>") -- Tab goes to next buffer
vim.keymap.set("n", "<S-Tab>", ":bprevious <CR>") -- Shift+Tab goes to previous buffer
vim.keymap.set("n", "<leader>d", ":bd! <CR>") -- Space+d delets current buffer

-- adjust split sizes easier
vim.keymap.set("n", "<C-Left>", ":vertical resize +3<CR>") -- Control+Left resizes vertical split +
vim.keymap.set("n", "<C-Right>", ":vertical resize -3<CR>") -- Control+Right resizes vertical split -

-- Open netrw in 25% split in tree view
vim.keymap.set("n", "<leader>e", ":25Lex<CR>") -- space+e toggles netrw tree view

-- Automatically close brackets, parethesis, and quotes
vim.keymap.set("i", "'", "''<left>")
vim.keymap.set("i", '"', '""<left>')
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "[", "[]<left>")
vim.keymap.set("i", "{", "{}<left>")
vim.keymap.set("i", "{;", "{};<left><left>")
vim.keymap.set("i", "/*", "/**/<left><left>")

-- Visual Maps
vim.keymap.set("v", "<leader>r", '"hy:%s/<C-r>h//g<left><left>') -- Replace all instances of highlighted words
vim.keymap.set("v", "<C-s>", ":sort<CR>") -- Sort highlighted text in visual mode with Control+S

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Paste without replace clipboard
vim.keymap.set("v", "p", '"_dP')

-- Move Lines
vim.keymap.set("n", "<M-j>", ":m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("i", "<M-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("n", "<M-k>", ":m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
vim.keymap.set("i", "<M-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

-- Reimplement visual block mode: create command that executes the default (C-v)
vim.api.nvim_create_user_command("VisualBlock", "normal! <C-v>", {})
vim.keymap.set('n', "<M-v>", ":VisualBlock<cr>")

-- Better move
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
--vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Open quickfix list
vim.keymap.set("n", "<leader>q", function() vim.diagnostic.setloclist() end, { desc = "Open quickfix list" })

-- Toggle options
vim.keymap.set("n", "<leader>tl", function() utils.toggle("relativenumber") end, { desc = "Toggle Line Numbers" })

-- Open powershell terminal
vim.keymap.set("n", "<leader>tv", ":vsp term://pwsh<cr>", { desc = "Vertical terminal" })
vim.keymap.set("n", "<leader>hv", ":sp term://pwsh<cr>", { desc = "Horzontal terminal" })

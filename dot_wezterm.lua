local wezterm = require("wezterm")
local act = wezterm.action

local function font_with_fallback(font_family)
	-- family names, not file names
	return wezterm.font_with_fallback({
		font_family,
		"Font Awesome 6 Free Solid", -- nice double-spaced symbols!
	})
end

local function font_and_rules_for_jetbrains()
	-- Use a _very slightly_ lighter variant, so that regular bold really stand out
	-- local font = wezterm.font({ family = "JetBrains Mono", weight = "Light" })
	-- local font = wezterm.font({ family = "Monaspace Argon", weight = "Light" })
	local font = font_with_fallback("JetBrains Mono Light")
	local font_rules = {
		{
			italic = true,
			font = font_with_fallback("JetBrains Mono Light Italic"),
			-- font = wezterm.font({ family = "Cartograph CF", style = "Italic", weight = "Light" }),
		},
		{
			italic = true,
			intensity = "Bold",
			font = font_with_fallback("JetBrains Mono Bold Italic"),
			-- font = wezterm.font({ family = "Cartograph CF", style = "Italic", weight = "Bold" }),
		},
		{
			intensity = "Bold",
			font = font_with_fallback("JetBrains Mono Bold"),
			-- font = wezterm.font({ family = "JetBrains Mono", weight = "Bold" }),
		},
	}
	return font, font_rules
end

local function use_dark()
	return wezterm.gui.get_appearance():match("Dark.*")
end

-- Source for the colors: https://github.com/enkia/tokyo-night-vscode-theme#color-palette
local tokyonight = {
	-- Dark colorway
	storm = {
		colors = {
			tab_bar = {
				background = "#24283b",
				active_tab = {
					bg_color = "#7aa2f7",
					fg_color = "#24283b",
					intensity = "Bold",
				},
				inactive_tab = {
					bg_color = "#24283b",
					fg_color = "#a9b1d6",
				},
				new_tab = {
					bg_color = "#24283b",
					fg_color = "#a9b1d6",
				},
				inactive_tab_hover = {
					bg_color = "#414868",
					fg_color = "#a9b1d6",
				},
				new_tab_hover = {
					bg_color = "#414868",
					fg_color = "#a9b1d6",
				},
			},
		},
	},
	-- Light colorway
	day = {
		colors = {
			tab_bar = {
				background = "#d5d6db",
				active_tab = {
					bg_color = "#34548a",
					fg_color = "#d5d6db",
					intensity = "Bold",
				},
				inactive_tab = {
					bg_color = "#d5d6db",
					fg_color = "#343b58",
				},
				new_tab = {
					bg_color = "#d5d6db",
					fg_color = "#343b58",
				},
				inactive_tab_hover = {
					bg_color = "#9699a3",
					fg_color = "#343b58",
				},
				new_tab_hover = {
					bg_color = "#9699a3",
					fg_color = "#343b58",
				},
			},
		},
	},
}
local config = {
	check_for_updates = false,
	-- color_scheme = "Banana Blueberry",
	-- color_scheme = "AyuMirage (Gogh)",
	-- color_scheme = "TokyoNight (Gogh)",
	-- color_scheme = "GruvboxDark",
	-- color_scheme = "Catppuccin Frappe",
	-- color_scheme = "Catppuccin Mocha",
	-- color_scheme = "Gruvbox dark, pale (base16)",
	color_scheme = use_dark() and "TokyoNightStorm (Gogh)" or "TokyoNightLight (Gogh)",
	colors = use_dark() and tokyonight.storm.colors or tokyonight.day.colors,

	window_background_opacity = 0.95,

	tab_bar_at_bottom = true,
	inactive_pane_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.0,
	},

	-- Make sure word selection stops on most punctuations.
	--
	-- Note that dot (.) & slash (/) are allowed though for
	-- easy selection of (partial) paths.
	selection_word_boundary = " \t\n{}[]()\"'`,;:@│*",

	-- font = wezterm.font("JetBrainsMono Nerd Font Mono"),
	font_size = 11.0,

	default_prog = { "pwsh.exe", "-NoLogo" },

	launch_menu = {},
	leader = { key = "b", mods = "CTRL" },

	-- Allow using ^ with single key press.
	use_dead_keys = false,
	keys = {
		-- New/close pane
		{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "q", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
		{ key = "Q", mods = "LEADER", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
		{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
		{ key = "X", mods = "LEADER", action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
		--SUPER	m	Hide
		--SUPER	n	SpawnWindow
		--CTRL+SHIFT	n	SpawnWindow
		--ALT	Enter	ToggleFullScreen

		-- Pane navigation
		{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "LeftArrow", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "DownArrow", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "UpArrow", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "RightArrow", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Right" }) },

		-- Tab navigation
		{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
		{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "LEADER", action = "ShowTabNavigator" },
		{ key = "b", mods = "LEADER|CTRL", action = "ActivateLastTab" },
		{ key = "LeftArrow", mods = "SHIFT", action = wezterm.action({ ActivateTabRelative = -1 }) },
		{ key = "RightArrow", mods = "SHIFT", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action({ MoveTabRelative = -1 }) },
		{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action({ MoveTabRelative = 1 }) },

		-- Resize
		{ key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
		{ key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
		{ key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
		{ key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },

		-- Split
		{ key = "-", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "_", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{
			key = "\\",
			mods = "LEADER",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{
			key = "|",
			mods = "LEADER|SHIFT",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},

		-- Scroll/search buffer
		--SHIFT	PageUp	ScrollByPage=-1
		--SHIFT	PageDown	ScrollByPage=1
		--SUPER	k	ClearScrollback="ScrollbackOnly"
		--CTRL+SHIFT	K	ClearScrollback="ScrollbackOnly"
		--SUPER	f	Search={CaseSensitiveString=""}
		--CTRL+SHIFT	F	Search={CaseSensitiveString=""}

		-- Copy/paste buffer
		{ key = "[", mods = "LEADER", action = "ActivateCopyMode" },
		{ key = " ", mods = "LEADER", action = "QuickSelect" },
		--SUPER	c	CopyTo="Clipboard"
		--SUPER	v	PasteFrom="Clipboard"
		--CTRL+SHIFT	c	CopyTo="Clipboard"
		--CTRL+SHIFT	v	PasteFrom="Clipboard"
		--CTRL	Insert	CopyTo="PrimarySelection" ()
		--SHIFT	Insert	PasteFrom="PrimarySelection"
		--CTRL+SHIFT	X	ActivateCopyMode
		--CTRL+SHIFT	(Space)	QuickSelect (since: 20210502-130208-bff6815d)

		-- Fonts
		--SUPER	-	DecreaseFontSize
		--CTRL	-	DecreaseFontSize
		--SUPER	=	IncreaseFontSize
		--CTRL	=	IncreaseFontSize
		--SUPER	0	ResetFontSize
		--CTRL	0	ResetFontSize
		--CTRL	Z	TogglePaneZoomState

		-- Misc
		--SUPER	r	ReloadConfiguration
		--CTRL+SHIFT	R	ReloadConfiguration
		--CTRL+SHIFT	L	ShowDebugOverlay (Since: 20210814-124438-54e29167)
	},

	-- Geeft error?? (voorbeeld van wezterm website...)
	mouse_bindings = {
		-- Scrolling up while holding CTRL increases the font size
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "CTRL",
			action = act.IncreaseFontSize,
		},

		-- Scrolling down while holding CTRL decreases the font size
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "CTRL",
			action = act.DecreaseFontSize,
		},

		-- rightclick copy
		{
			event = { Down = { streak = 1, button = "Right" } },
			action = act.CopyTo("Clipboard"),
		},
		-- ctrl rightclick paste
		{
			event = { Down = { streak = 1, button = "Right" } },
			mods = "CTRL",
			action = act.PasteFrom("Clipboard"),
		},
	},

	set_environment_variables = {},
}

-- FIXME (<- this is an example of bolded text)
-- 0 1 2 3 4 5 6 7 8 9
-- Some ligatures: != <-> <-  -> ----> => ==> ===> -- --- /../;;/ #{}
--  <> <!-- --> ->> --> <= >= ++ == === := a::b::c a&&b a||b
config.font, config.font_rules = font_and_rules_for_jetbrains()

-- Enable various OpenType features
-- See https://docs.microsoft.com/en-us/typography/opentype/spec/featurelist
config.harfbuzz_features = {
	"zero", -- Use a slashed zero '0' (instead of dotted)
	"kern", -- (default) kerning (todo check what is really is)
	"liga", -- (default) ligatures
	"clig", -- (default) contextual ligatures
}

return config

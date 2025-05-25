{ pkgs, config, ... }:

let
  vimThemeLua = pkgs.writeTextDir "lua/colors/rti.lua" ''
    local M = {}

    local function hi(hl_group, args)
      if type(args) == "string" then
        vim.cmd("highlight! link " .. hl_group .. " " .. args)
      else
        local fg = args.fg or "NONE"
        local bg = args.bg or "NONE"
        local attr = args.attr or "NONE"
        local sp = args.sp or "NONE"
        vim.cmd("highlight! " .. hl_group .. " guifg=" .. fg .. " guibg=" .. bg .. " guisp=" .. sp .. " gui=" .. attr)
      end
    end

    function M._setup()
      vim.cmd("highlight! clear")

      vim.opt.background = "light"
      vim.opt.termguicolors = true
      vim.g.colors_name = 'rti'

      -- No need to set the background explicitly
      -- hi("Normal", { bg = "${config.theme.background}", fg = "${config.theme.foreground}"})
      hi("Normal", { fg = "${config.theme.foreground}" })
      hi("NormalNC", "Normal")
      hi("NormalFloat", "Normal")
      hi("typescriptParens", "NormalFloat") -- ???
      hi("FloatBorder", { fg = "${config.theme.foreground4}" })
      hi("VertSplit", { fg = "${config.theme.background3}" })
      hi("WinSeparator", "VertSplit")

      hi("Bold", { attr = "bold" })
      hi("Italic", { attr = "italic" })
      hi("Underlined", { attr = "underline" })

      hi("StatusLine", { bg="${config.theme.background3}" })
      hi("StatusLineNC", { bg="${config.theme.background3}" })

      hi("BufferCurrent", { attr = "bold" })

      hi("TabLine", { bg="${config.theme.background4}" })
      hi("TabLineSel", { bg = "${config.theme.foregroundCyan}", fg = "${config.theme.background}", attr = "bold" })
      hi("TabLineFill", "Normal")

      hi("Boolean", { fg = "${config.theme.foreground}" })
      hi("Comment", { fg = "${config.theme.foreground4}", attr = "italic" })
      hi("Constant", { fg = "${config.theme.foreground}" })
      hi("Conditional", { fg = "${config.theme.foreground}" })
      hi("Directory", { fg = "${config.theme.foreground}",attr = "bold" })
      hi("Function", { fg = "${config.theme.foregroundBlue}",attr = "bold" })
      hi("Identifier", { fg = "${config.theme.foregroundGreen}", attr = "bold" })
      hi("Keyword", { fg = "${config.theme.foreground}", attr = "italic" })
      hi("NonText", { fg = "${config.theme.background3}" })
      hi("Number", { fg = "${config.theme.foreground}" })
      hi("PreProc", { fg = "${config.theme.foreground}" })
      hi("Special", { fg = "${config.theme.foreground}" })
      hi("SpecialKey", { fg = "${config.theme.foreground3}" })
      hi("Statement", { fg = "${config.theme.foreground}" })
      hi("Tag", { fg = "${config.theme.foregroundBlue}", attr = "bold"  })
      hi("Title", { fg = "${config.theme.foreground}", attr = "bold" })
      hi("Todo", { fg = "${config.theme.foregroundRed}", bg = "${config.theme.background}", attr = "bold" })
      hi("Type", { fg = "${config.theme.foreground}" })

      hi("WhichKeyValue", "Constant")
      hi("helpOption", "Constant")
      hi("helpHyperTextJump", "Constant")

      hi("Cursor", { fg = "${config.theme.background}", bg = "${config.theme.foreground}" })
      hi("TermCursor", "Cursor")
      hi("CursorLine", { bg = "${config.theme.backgroundSelect}" })
      hi("CursorColumn", "CursorLine")
      hi("CursorLineNr", { fg = "${config.theme.foreground}", bg = "${config.theme.backgroundSelect}", attr = "bold" })
      hi("LineNr", { fg = "${config.theme.foreground4}" })
      hi("SignColumn", "LineNr")

      hi("WildMenu", "CursorLine")
      hi("Pmenu", "Normal")
      hi("PmenuSbar", "CursorLine")
      hi("PmenuThumb", { bg = "${config.theme.background3}" })
      hi("PmenuSel", "CursorLine")

      hi("TelescopeNormal", "NormalFloat")
      hi("TelescopePrompt", "NormalFloat")
      hi("TelescopePromptPrefix", "NormalFloat")
      hi("TelescopeBorder", "FloatBorder")
      hi("TelescopeSelection", "CursorLine")

      hi("DiagnosticError", { fg = "${config.theme.foregroundRed}" })
      hi("DiagnosticHint", { fg = "${config.theme.foregroundCyan}" })
      hi("DiagnosticInfo", { fg = "${config.theme.foregroundBlue}" })
      hi("DiagnosticWarn", { fg = "${config.theme.foregroundYellow}" })
      hi("DiagnosticSignError", "DiagnosticError")
      hi("DiagnosticSignHint", "DiagnosticHint")
      hi("DiagnosticSignInfo", "DiagnosticInfo")
      hi("DiagnosticSignWarn", "DiagnosticWarn")
      hi("DiagnosticUnderlineError", "DiagnosticError")
      hi("DiagnosticUnderlineHint", "DiagnosticHint")
      hi("DiagnosticUnderlineInfo", "DiagnosticInfo")
      hi("DiagnosticUnderlineWarn", "DiagnosticWarn")
      hi("DiagnosticVirtualTextError", "DiagnosticError")
      hi("DiagnosticVirtualTextHint", "DiagnosticHint")
      hi("DiagnosticVirtualTextInfo", "DiagnosticInfo")
      hi("DiagnosticVirtualTextWarn", "DiagnosticWarn")
      hi("TinyInlineDiagnosticVirtualTextError", { fg = "${config.theme.foregroundRed}", bg = "${config.theme.backgroundRed}" })
      hi("TinyInlineDiagnosticVirtualTextHint", { fg = "${config.theme.foregroundCyan}", bg = "${config.theme.backgroundCyan}" })
      hi("TinyInlineDiagnosticVirtualTextInfo", { fg = "${config.theme.foregroundBlue}", bg = "${config.theme.backgroundBlue}" })
      hi("TinyInlineDiagnosticVirtualTextWarn", { fg = "${config.theme.foregroundYellow}", bg = "${config.theme.backgroundYellow}" })

      hi("Error", "DiagnosticError")
      hi("ErrorMsg", "DiagnosticError")
      hi("WarningMsg", "DiagnosticWarn")

      hi("SpellBad", { fg = "${config.theme.foregroundRed}", attr = "undercurl" })
      hi("SpellCap", "SpellBad")
      hi("SpellRare", "SpellBad")

      hi("lualineDiffAdd", { fg = "${config.theme.foregroundGreen}", bg = "${config.theme.background4}" })
      hi("lualineDiffChange", { fg = "${config.theme.foregroundYellow}", bg = "${config.theme.background4}" })
      hi("lualineDiffDelete", { fg = "${config.theme.foregroundRed}", bg = "${config.theme.background4}" })
      hi("lualineDiagnosticError", { fg = "${config.theme.foregroundRed}", bg = "${config.theme.background4}" })
      hi("lualineDiagnosticHint", { fg = "${config.theme.foregroundCyan}", bg = "${config.theme.background4}" })
      hi("lualineDiagnosticInfo", { fg = "${config.theme.foregroundBlue}", bg = "${config.theme.background4}" })
      hi("lualineDiagnosticWarn", { fg = "${config.theme.foregroundYellow}", bg = "${config.theme.background4}" })

      hi("DiffAdd", { bg = "${config.theme.backgroundGreen}" })
      hi("DiffChange", { bg = "${config.theme.backgroundYellow}" })
      hi("DiffDelete", { bg = "${config.theme.backgroundRed}" })
      hi("DiffText", { fg = "${config.theme.foreground}", bg = "${config.theme.brightYellow}" })
      hi("diffAdded", "DiffAdd");
      hi("diffChanged", "DiffChange");
      hi("diffRemoved", "DiffDelete");
      hi("diffLine", { fg = "${config.theme.foregroundMagenta}", bg = "${config.theme.background2}", attr = "bold" })
      hi("diffFile", { fg = "${config.theme.foreground}", bg = "${config.theme.background2}", attr = "bold" })
      hi("diffOldFile", { fg = "${config.theme.foregroundRed}", bg = "${config.theme.background2}", attr = "italic" })
      hi("diffNewFile", { fg = "${config.theme.foregroundGreen}", bg = "${config.theme.background2}", attr = "italic" })

      hi("@text.diff.add.diff", "DiffAdd")
      hi("@text.diff.delete.diff", "DiffDelete")

      hi("GitSignsAdd", { fg = "${config.theme.brightGreen}" })
      hi("GitSignsAddInline", { fg = "${config.theme.foreground}", bg = "${config.theme.brightGreen}" })
      hi("GitSignsChange", { fg = "${config.theme.brightYellow}" })
      hi("GitSignsChangeInline", { fg = "${config.theme.foreground}", bg = "${config.theme.brightYellow}" })
      hi("GitSignsDelete", { fg = "${config.theme.brightRed}" })
      hi("GitSignsDeleteInline", { fg = "${config.theme.foreground}", bg = "${config.theme.brightRed}" })
      hi("GitSignsStagedAdd", { fg = "${config.theme.backgroundGreen}" })
      hi("GitSignsStagedChange", { fg = "${config.theme.backgroundYellow}" })
      hi("GitSignsStagedDelete", { fg = "${config.theme.backgroundRed}" })
      hi("GitSignsCurrentLineBlame", { fg = "${config.theme.foreground4}", attr = "bold" })

      hi("DapUIType", "Normal")
      hi("DapUIScope", "Normal")
      hi("DapUIValue", "Normal")
      hi("DapUISource", "Normal")
      hi("DapUIThread", "Normal")
      hi("DapUIVariable", { fg = "${config.theme.foreground}", attr = "bold" })
      hi("DapUIFrameName", { fg = "${config.theme.foreground}", attr = "bold" })
      hi("DapUIDecoration", "Normal")
      hi("DapUILineNumber", "Normal")
      hi("DapUIFloatBorder", "Normal")
      hi("DapUIWatchesEmpty", "Normal")
      hi("DapUIWatchesError", "Normal")
      hi("DapUIWatchesValue", "Normal")
      hi("DapUIModifiedValue", "Normal")
      hi("DapUIStoppedThread", "Normal")
      hi("DapUIBreakpointsInfo", { fg = "${config.theme.foreground}", attr = "bold" })
      hi("DapUIBreakpointsLine", "Normal")
      hi("DapUIBreakpointsPath", "Normal")
      hi("DapUIBreakpointsCurrentLine", "Normal")

      hi("FoldColumn", { fg = "${config.theme.background3}" })
      hi("Folded", { fg = "${config.theme.foreground3}", bg = "${config.theme.background2}" })

      hi("MatchParen", { fg = "${config.theme.foreground}", bg = "${config.theme.backgroundMagenta}" })

      hi("Search", { bg = "${config.theme.backgroundMagenta}" })
      hi("IncSearch", "Search")
      hi("CurSearch", "Search")
      hi("Visual", { bg = "${config.theme.backgroundBlue}" })

      hi("MoreMsg", { fg = "${config.theme.foregroundGreen}" })
      hi("Question", { fg = "${config.theme.foregroundGreen}" })

      hi("NvimTreeNormal", { fg = "${config.theme.foreground}" })
      hi("NvimTreeRootFolder", { fg = "${config.theme.foregroundBlue}", attr = "bold,italic" })
      hi("NvimTreeSpecialFile", { fg = "${config.theme.foregroundGreen}", attr = "bold" })
      hi("NvimTreeSymlink", { fg = "${config.theme.foreground3}", attr = "italic" })
      hi("NvimTreeExecFile", { fg = "${config.theme.foregroundGreen}" })
      hi("NvimTreeGitNew", { fg = "${config.theme.foregroundGreen}" })
      hi("NvimTreeGitDirty", { fg = "${config.theme.foregroundYellow}" })
      hi("NvimTreeGitDeleted", { fg = "${config.theme.foregroundRed}" })

      hi("NeoTreeDimText", { fg = "${config.theme.foreground2}" })
      hi("NeoTreeDirectoryIcon", { fg = "${config.theme.foreground}" })
      hi("NeoTreeDirectoryName", { fg = "${config.theme.foreground}", attr = "bold" })
      hi("NeoTreeDotfile", { fg = "${config.theme.foreground2}" })
      hi("NeoTreeFadeText1", { fg = "${config.theme.foreground4}" })
      hi("NeoTreeFadeText2", { fg = "${config.theme.foreground3}" })
      hi("NeoTreeFileIcon", { fg = "${config.theme.foreground}" })
      hi("NeoTreeFileName", { fg = "${config.theme.foreground}" })
      hi("NeoTreeGitAdded", { fg = "${config.theme.foregroundGreen}" })
      hi("NeoTreeGitConflict", { fg = "${config.theme.foregroundRed}" })
      hi("NeoTreeGitDeleted", { fg = "${config.theme.foregroundMagenta}" })
      hi("NeoTreeGitIgnored", { fg = "${config.theme.foreground3}" })
      hi("NeoTreeGitModified", { fg = "${config.theme.foregroundYellow}" })
      hi("NeoTreeGitUnstaged", { fg = "${config.theme.foregroundYellow}" })
      hi("NeoTreeGitUntracked", { fg = "${config.theme.foreground2}" })
      hi("NeoTreeIndentMarker", { fg = "${config.theme.background3}" })
      hi("NeoTreeMessage", { fg = "${config.theme.foreground4}", attr = "italic" })
      hi("NeoTreeModified", { fg = "${config.theme.foregroundYellow}" })
      hi("NeoTreeRootName", { fg = "${config.theme.foreground}", attr = "bold,italic" })
      hi("NeoTreeSymbolicLinkTarget", { fg = "${config.theme.foregroundBlue}" })
      hi("NeoTreeTabActive", { fg = "${config.theme.foreground}", bg = "${config.theme.background2}", attr = "bold" })
      hi("NeoTreeTabInactive", { fg = "${config.theme.foreground3}", bg = "${config.theme.background}" })
      hi("NeoTreeTabSeparatorActive", { fg = "${config.theme.foreground}", bg = "${config.theme.background2}", attr = "bold" })
      hi("NeoTreeTabSeparatorInactive", { fg = "${config.theme.foreground3}", bg = "${config.theme.background}" })

      hi("CmpItemAbbrDeprecated", { fg = "${config.theme.foreground2}", attr = "strikethrough" })
      hi("CmpItemAbbrMatch", { fg = "${config.theme.foregroundGreen}", attr = "bold,underline" })
      hi("CmpItemAbbrMatchFuzzy", "CmpItemAbbrMatch")
      hi("CmpItemKindVariable", { fg = "${config.theme.foregroundBlue}" })
      hi("CmpItemKindInterface", "CmpItemKindVariable")
      hi("CmpItemKindProperty", "CmpItemKindVariable")
      hi("CmpItemKindText", { fg = "${config.theme.foregroundYellow}" })
      hi("CmpItemKindFunction", { fg = "${config.theme.foregroundMagenta}" })
      hi("CmpItemKindMethod", "CmpItemKindFunction")
      hi("CmpItemKindKeyword", { fg = "${config.theme.foregroundCyan}" })
      hi("CmpItemKindUnit", "CmpItemKindKeyword")

      hi("NoiceFormatEvent", "Normal")
      hi("NoiceFormatKind", "Normal")
      hi("NoiceFormatLevelDebug", "Normal")
      hi("NoiceFormatLevelOff", "Normal")
      hi("NoiceFormatLevelTrace", "Normal")
      hi("NoiceLspProgressTitle", "Normal")

      hi("modelChatMessageAssistant", { fg = "${config.theme.foregroundGreen}" })
      hi("llama_hl_hint", { fg = "${config.theme.foreground3}"})
      hi("llama_hl_info", { fg = "${config.theme.foreground4}"})

      -- e.g. Markdown Code
      hi("@text.literal", { fg = "${config.theme.foreground2}" })

      hi("TSRainbowYellow", { fg = "${config.theme.foregroundYellow}" })
      hi("TSRainbowBlue", { fg = "${config.theme.foregroundBlue}" })
      hi("TSRainbowGreen", { fg = "${config.theme.foregroundGreen}" })
      hi("TSRainbowCyan", { fg = "${config.theme.foregroundCyan}" })
      hi("TSRainbowViolet", { fg = "${config.theme.foregroundGreen}" })

      hi("TreesitterContextSeparator", { fg = "${config.theme.background3}", bg = "${config.theme.background}" })
      hi("TreesitterContextLineNumber", { fg = "${config.theme.foreground4}", bg = "${config.theme.background}" })
      hi("TreesitterContext", { bg = "${config.theme.background}" })

      hi("IlluminatedWordText", { bg = "${config.theme.backgroundYellow}", attr = "underline" })
      hi("IlluminatedWordRead", { bg = "${config.theme.backgroundGreen}", attr = "underline" })
      hi("IlluminatedWordWrite", { bg = "${config.theme.backgroundYellow}", attr = "underline" })

      vim.g.terminal_color_0 = "${config.theme.termBlack}"
      vim.g.terminal_color_1 = "${config.theme.termRed}"
      vim.g.terminal_color_2 = "${config.theme.termGreen}"
      vim.g.terminal_color_3 = "${config.theme.termYellow}"
      vim.g.terminal_color_4 = "${config.theme.termBlue}"
      vim.g.terminal_color_5 = "${config.theme.termMagenta}"
      vim.g.terminal_color_6 = "${config.theme.termCyan}"
      vim.g.terminal_color_7 = "${config.theme.termWhite}"
      vim.g.terminal_color_8 = "${config.theme.termBrightBlack}"
      vim.g.terminal_color_9 = "${config.theme.termBrightRed}"
      vim.g.terminal_color_10 = "${config.theme.termBrightGreen}"
      vim.g.terminal_color_11 = "${config.theme.termBrightYellow}"
      vim.g.terminal_color_12 = "${config.theme.termBrightBlue}"
      vim.g.terminal_color_13 = "${config.theme.termBrightMagenta}"
      vim.g.terminal_color_14 = "${config.theme.termBrightCyan}"
      vim.g.terminal_color_15 = "${config.theme.termBrightWhite}"
    end

    function M.setup()
      require("colors/rti")._setup()

      -- TODO: review HACK
      -- call setup again after 100ms in order to work around autoloaded plugins
      -- that set colors
      vim.defer_fn(function() M._setup() end, 100)
    end

    return M
  '';

  vimTheme = pkgs.writeTextDir "colors/rti.vim" ''
    lua require("colors/rti").setup()
  '';

  lualineTheme = pkgs.writeTextDir "lua/lualine/themes/rti.lua" ''
    return {
      normal = {
        a = { bg = "${config.theme.primary}", fg = "${config.theme.background}", gui = 'none', attr = "bold" },
        b = { bg = "${config.theme.background4}", fg = "${config.theme.foreground}", gui = 'none' },
        c = { bg = "${config.theme.background4}", fg = "${config.theme.foreground}", gui = 'none' },
      },
      insert = {
        a = { bg = "${config.theme.foregroundMagenta}", fg = "${config.theme.background}", gui = 'none', attr = "bold" },
        b = { bg = "${config.theme.background4}", fg = "${config.theme.foreground}", gui = 'none' },
        c = { bg = "${config.theme.background4}", fg = "${config.theme.foreground}", gui = 'none' },
      },
      replace = {
        a = { bg = "${config.theme.foregroundRed}", fg = "${config.theme.background}", gui = 'none', attr = "bold" },
        b = { bg = "${config.theme.background4}", fg = "${config.theme.foreground}", gui = 'none' },
        c = { bg = "${config.theme.background4}", fg = "${config.theme.foreground}", gui = 'none' },
      },
      visual = {
        a = { bg = "${config.theme.backgroundBlue}", fg = "${config.theme.foreground}", gui = 'none', attr = "bold" },
        b = { bg = "${config.theme.background4}", fg = "${config.theme.foreground}", gui = 'none' },
        c = { bg = "${config.theme.background4}", fg = "${config.theme.foreground}", gui = 'none' },
      },
      command = {
        a = { bg = "${config.theme.foregroundYellow}", fg = "${config.theme.background}", gui = 'none', attr = "bold" },
        b = { bg = "${config.theme.background4}", fg = "${config.theme.foreground}", gui = 'none' },
        c = { bg = "${config.theme.background4}", fg = "${config.theme.foreground}", gui = 'none' },
      },
      terminal = {
        a = { bg = "${config.theme.foregroundCyan}", fg = "${config.theme.background}", gui = 'none', attr = "bold" },
        b = { bg = "${config.theme.background4}", fg = "${config.theme.foreground}", gui = 'none' },
        c = { bg = "${config.theme.background4}", fg = "${config.theme.foreground}", gui = 'none' },
      },
      inactive = {
        a = { bg = "${config.theme.background3}", fg = "${config.theme.foreground}", gui = 'none' },
        b = { bg = "${config.theme.background3}", fg = "${config.theme.foreground}", gui = 'none' },
        c = { bg = "${config.theme.background3}", fg = "${config.theme.foreground}", gui = 'none' },
        x = { bg = "${config.theme.background3}", fg = "${config.theme.foreground}", gui = 'none' },
        y = { bg = "${config.theme.background3}", fg = "${config.theme.foreground}", gui = 'none' },
        z = { bg = "${config.theme.background3}", fg = "${config.theme.foreground}", gui = 'none' },
      },
    }
  '';

in
pkgs.stdenvNoCC.mkDerivation {
  name = "colors-rti";
  src = ./.; # TODO: better placeholder?
  installPhase = ''
    mkdir $out
    mkdir $out/colors
    mkdir $out/lua
    mkdir $out/lua/colors
    mkdir $out/lua/lualine
    mkdir $out/lua/lualine/themes
    cp -rv ${vimTheme}/* $out/
    cp -rv ${vimThemeLua}/* $out/
    cp -rv ${lualineTheme}/* $out/
  '';
}

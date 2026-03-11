-- Native Neovim highlights - no external dependencies
local M = {}

-- Import our color utility
local hsl = require('bluloco.colors').hsl

-- Helper function to set highlight
local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Helper function to link highlight groups
local function link(group, target)
  vim.api.nvim_set_hl(0, group, { link = target })
end

-- Apply highlights based on config
function M.setup(config)
  -- Color palette selection based on background
  local dark = {
    -- syntax
    bg                    = hsl("#282C34"),
    bgFloat               = hsl("#21242D"),
    fg                    = hsl("#ABB2BF"),
    cursor                = hsl("#FFCC00"),
    keyword               = hsl("#10B1FE"),
    comment               = hsl("#636D83"),
    punctuation           = hsl("#7A82DA"),
    method                = hsl("#3FC56B"),
    type                  = hsl("#FF6480"),
    string                = hsl("#F9C859"),
    number                = hsl("#FF78F8"),
    constant              = hsl("#9F7EFE"),
    tag                   = hsl("#3691FF"),
    attribute             = hsl("#FF936A"),
    property              = hsl("#CE9887"),
    parameter             = hsl("#8bcdef"),
    label                 = hsl("#50acae"),
    module                = hsl("#FF839B"),
    -- workspace
    primary               = hsl("#3691ff"),
    selection             = hsl("#274670"),
    search                = hsl("#1A7247"),
    diffAdd               = hsl("#105B3D"),
    diffChange            = hsl("#10415B"),
    diffDelete            = hsl("#522E34"),
    added                 = hsl("#177F55"),
    changed               = hsl("#1B6E9B"),
    deleted               = hsl("#A14D5B"),
    diffText              = hsl("#10415B"):lighten(12),
    error                 = hsl("#ff2e3f"),
    errorBG               = hsl("#FDCFD1"),
    warning               = hsl("#da7a43"),
    warningBG             = hsl("#F2DBCF"),
    info                  = hsl("#3691ff"),
    infoBG                = hsl("#D4E3FA"),
    hint                  = hsl("#7982DA"),
    mergeCurrent          = hsl("#4B3D3F"),
    mergeCurrentLabel     = hsl("#604B47"),
    mergeIncoming         = hsl("#2F476B"),
    mergeIncomingLabel    = hsl("#305C95"),
    mergeParent           = hsl(235, 28, 32),
    mergeParentLabel      = hsl(235, 29, 41),
    copilot               = hsl('#95A922'),
    -- terminal
    terminalBlack         = hsl("#42444d"),
    terminalRed           = hsl("#fc2e51"),
    terminalGreen         = hsl("#25a45c"),
    terminalYellow        = hsl("#ff9369"),
    terminalBlue          = hsl("#3375fe"),
    terminalMagenta       = hsl("#9f7efe"),
    terminalCyan          = hsl("#4483aa"),
    terminalWhite         = hsl("#cdd3e0"),
    terminalBrightBlack   = hsl("#8f9aae"),
    terminalBrightRed     = hsl("#ff637f"),
    terminalBrightGreen   = hsl("#3fc56a"),
    terminalBrightYellow  = hsl("#f9c858"),
    terminalBrightBlue    = hsl("#10b0fe"),
    terminalBrightMagenta = hsl("#ff78f8"),
    terminalBrightCyan    = hsl("#5fb9bc"),
    terminalBrightWhite   = hsl("#ffffff"),
    rainbowRed            = hsl("#FF6666"),
    rainbowYellow         = hsl("#f4ff78"),
    rainbowBlue           = hsl("#44A5FF"),
    rainbowOrange         = hsl("#ffa023"),
    rainbowGreen          = hsl("#92f535"),
    rainbowViolet         = hsl("#ff78ff"),
    rainbowCyan           = hsl("#28e4eb"),
    rainbowIndigo         = hsl("#9F7EFE"),
  }

  local light = {
    -- syntax
    bg                    = hsl("#F9F9F9"),
    bgFloat               = hsl("#ECEDEE"),
    fg                    = hsl("#383A42"),
    cursor                = hsl("#F31459"),
    keyword               = hsl("#0098DD"),
    comment               = hsl("#A0A1A7"),
    punctuation           = hsl("#7A82DA"),
    method                = hsl("#23974A"),
    type                  = hsl("#D52753"),
    string                = hsl("#C5A332"),
    number                = hsl("#CE33C0"),
    constant              = hsl("#823FF1"),
    tag                   = hsl("#275FE4"),
    attribute             = hsl("#DF631C"),
    property              = hsl("#A05A48"),
    parameter             = hsl("#40B8C5"),
    label                 = hsl("#047485"),
    module                = hsl("#ee5672"),
    -- workspace
    primary               = hsl("#0099e1"),
    selection             = hsl("#d2ecff"),
    search                = hsl("#b1eacf"),
    diffAdd               = hsl("#c5f6c8"),
    diffChange            = hsl("#C2E4FF"),
    diffDelete            = hsl("#fac1c6"),
    added                 = hsl("#3cbc66"),
    changed               = hsl("#0099e1"),
    deleted               = hsl("#FA7883"),
    diffText              = hsl("#C2E4FF"):darken(4),
    error                 = hsl("#ff0000"),
    errorBG               = hsl("#FCE4E4"),
    warning               = hsl("#ff8f3a"),
    warningBG             = hsl("#FBE4D5"),
    info                  = hsl("#0099e1"),
    infoBG                = hsl("#D2ECFF"),
    hint                  = hsl("#7982DA"),
    mergeCurrent          = hsl("#F1E8E6"),
    mergeCurrentLabel     = hsl("#E5D4D0"),
    mergeIncoming         = hsl("#DFEDF6"),
    mergeIncomingLabel    = hsl("#CAE3F4"),
    mergeParent           = hsl(233, 60, 95),
    mergeParentLabel      = hsl(233, 60, 90),
    copilot               = hsl("#869900"),
    -- terminal
    terminalBlack         = hsl("#373a41"),
    terminalRed           = hsl("#d52652"),
    terminalGreen         = hsl("#239749"),
    terminalYellow        = hsl("#df621b"),
    terminalBlue          = hsl("#275fe4"),
    terminalMagenta       = hsl("#823ef0"),
    terminalCyan          = hsl("#26608c"),
    terminalWhite         = hsl("#b9bac1"),
    terminalBrightBlack   = hsl("#676a77"),
    terminalBrightRed     = hsl("#ff637f"),
    terminalBrightGreen   = hsl("#3cbc66"),
    terminalBrightYellow  = hsl("#c5a231"),
    terminalBrightBlue    = hsl("#0099e0"),
    terminalBrightMagenta = hsl("#ce32c0"),
    terminalBrightCyan    = hsl("#6d92ba"),
    terminalBrightWhite   = hsl("#d3d3d3"),
    rainbowRed            = hsl("#f067f0"),
    rainbowYellow         = hsl("#B3BA00"),
    rainbowBlue           = hsl("#0ab6ff"),
    rainbowOrange         = hsl("#ffa023"),
    rainbowGreen          = hsl("#1fc255"),
    rainbowViolet         = hsl("#a557ff"),
    rainbowCyan           = hsl("#0e91a8"),
    rainbowIndigo         = hsl("#383A42"),
  }

  local t = vim.o.background == "light" and light or dark

  -- Helper function for shading
  local function shade(color, value)
    if vim.o.background == "light" then
      return color:darken(value)
    else
      return color:lighten(value)
    end
  end

  -- Generate shade colors
  t.shade1 = shade(t.bg, 1)
  t.shade2 = shade(t.bg, 2)
  t.shade3 = shade(t.bg, 3)
  t.shade4 = shade(t.bg, 4)
  t.shade5 = shade(t.bg, 5)
  t.shade6 = shade(t.bg, 6)
  t.shade7 = shade(t.bg, 7)
  t.shade8 = shade(t.bg, 8)
  t.shade9 = shade(t.bg, 9)
  t.shade10 = shade(t.bg, 10)
  t.shade20 = shade(t.bg, 20)
  t.shade25 = shade(t.bg, 25)
  t.shade30 = shade(t.bg, 30)
  t.shade40 = shade(t.bg, 40)
  t.shade50 = shade(t.bg, 50)
  t.shade60 = shade(t.bg, 60)
  t.shade70 = shade(t.bg, 70)
  t.shade80 = shade(t.bg, 80)
  t.shade90 = shade(t.bg, 90)

  t.grey3 = t.shade3:mix(t.primary, 3)
  t.grey5 = t.shade5:mix(t.primary, 5)
  t.grey7 = t.shade7:mix(t.primary, 7)
  t.grey10 = t.shade10:mix(t.primary, 10)
  t.grey20 = t.shade20:mix(t.primary, 10)
  t.grey25 = t.shade25:mix(t.primary, 10)
  t.grey30 = t.shade30:mix(t.primary, 10)
  t.grey40 = t.shade40:mix(t.primary, 12)

  t.white = hsl("#ffffff")
  t.green = hsl("#008200")

  -- Set terminal colors if enabled
  if config.terminal == true then
    vim.g.terminal_color_0  = t.terminalBlack.hex
    vim.g.terminal_color_1  = t.terminalRed.hex
    vim.g.terminal_color_2  = t.terminalGreen.hex
    vim.g.terminal_color_3  = t.terminalYellow.hex
    vim.g.terminal_color_4  = t.terminalBlue.hex
    vim.g.terminal_color_5  = t.terminalMagenta.hex
    vim.g.terminal_color_6  = t.terminalCyan.hex
    vim.g.terminal_color_7  = t.terminalWhite.hex
    vim.g.terminal_color_8  = t.terminalBrightBlack.hex
    vim.g.terminal_color_9  = t.terminalBrightRed.hex
    vim.g.terminal_color_10 = t.terminalBrightGreen.hex
    vim.g.terminal_color_11 = t.terminalBrightYellow.hex
    vim.g.terminal_color_12 = t.terminalBrightBlue.hex
    vim.g.terminal_color_13 = t.terminalBrightMagenta.hex
    vim.g.terminal_color_14 = t.terminalBrightCyan.hex
    vim.g.terminal_color_15 = t.terminalBrightWhite.hex
  end

  -- Base highlights
  hl("Normal", { fg = t.fg.hex, bg = t.bg.hex })
  hl("CursorLine", { bg = t.grey7.hex })
  link("CursorColumn", "CursorLine")
  hl("Whitespace", { fg = t.grey10.hex })
  hl("Comment", { fg = t.comment.hex })
  hl("LineNr", { fg = t.comment.hex })
  hl("CursorLineNr", { fg = t.comment.hex })
  hl("Search", { bg = t.search.hex })
  hl("IncSearch", { bg = t.cursor:mix(t.bg, 10).hex, fg = t.bg.hex })
  link("CurSearch", "Search")
  hl("NormalFloat", { bg = t.bgFloat.hex, blend = 5 })
  hl("FloatBorder", { fg = t.punctuation.hex })
  hl("NormalSB", { bg = t.bgFloat.hex })
  hl("ColorColumn", { bg = t.grey5.hex })
  hl("Conceal", {})
  hl("Cursor", { bg = t.cursor.hex, fg = t.bg.hex })
  link("lCursor", "Cursor")
  link("CursorIM", "Cursor")
  hl("Directory", { fg = t.keyword.hex })
  hl("Added", { fg = t.method.hex })
  hl("Changed", { fg = t.tag.hex })
  hl("Removed", { fg = t.type.hex })
  hl("DiffAdd", { bg = t.diffAdd.hex })
  hl("DiffChange", { bg = t.diffChange.hex })
  hl("DiffDelete", { bg = t.diffDelete.hex })
  hl("DiffText", { bg = t.diffText.hex })
  hl("EndOfBuffer", { fg = t.punctuation.hex })
  link("TermCursor", "Cursor")
  hl("TermCursorNC", {})
  hl("ErrorMsg", { fg = t.error.hex })
  hl("VertSplit", { fg = t.grey30.hex })
  link("Winseparator", "VertSplit")
  hl("Folded", { bg = t.shade7.hex, fg = t.tag.hex })
  link("SignColumn", "Normal")
  link("FoldColumn", "SignColumn")
  link("Substitute", "IncSearch")
  hl("MatchParen", { bg = t.punctuation.hex, fg = t.bg.hex })
  link("ModeMsg", "Normal")
  link("MsgArea", "Normal")
  hl("MoreMsg", { fg = t.primary.hex })
  hl("NonText", { fg = t.shade30.hex })
  link("NormalNC", "Normal")
  link("Pmenu", "NormalFloat")
  hl("PmenuSel", { bg = t.selection.hex })
  hl("PmenuSbar", { bg = t.grey5.hex })
  hl("PmenuThumb", { bg = t.punctuation.hex })
  hl("Question", { fg = t.primary.hex })
  hl("QuickFixLine", { bg = t.primary.hex, fg = t.white.hex })
  hl("SpecialKey", { fg = t.attribute.hex })
  hl("StatusLine", { bg = t.grey10.hex })
  hl("StatusLineNC", { bg = t.shade5.hex })
  hl("TabLine", { bg = t.shade3.hex, fg = t.shade30.hex })
  hl("TabLineFill", { bg = t.bg.hex })
  hl("TabLineSel", { bg = t.shade10.hex, sp = t.primary.hex, underline = true })
  hl("File", { fg = t.primary.hex })
  hl("Title", { fg = t.primary.hex })
  hl("Visual", { bg = t.selection.hex })
  hl("VisualNOS", { bg = t.selection.hex })
  hl("WarningMsg", { fg = t.warning.hex })
  hl("WildMenu", { bg = t.selection.hex })

  -- Syntax highlighting
  hl("Constant", { fg = t.constant.hex })
  hl("String", { fg = t.string.hex })
  hl("Character", { fg = t.attribute.hex })
  hl("Number", { fg = t.number.hex })
  hl("Boolean", { fg = t.keyword.hex })
  hl("Identifier", { fg = t.fg.hex })
  hl("Function", { fg = t.method.hex })
  hl("Method", { fg = t.method.hex })
  hl("Property", { fg = t.property.hex })
  link("Field", "Property")
  hl("Parameter", { fg = t.parameter.hex })
  hl("Statement", { fg = t.keyword.hex })
  hl("Punctuation", { fg = t.punctuation.hex })
  hl("Operator", { fg = t.punctuation.hex })
  link("Keyword", "Statement")
  hl("PreProc", { fg = t.keyword.hex })
  hl("Type", { fg = t.type.hex })
  link("Struct", "Type")
  link("Class", "Type")
  link("Special", "Character")
  link("Attribute", "Character")
  hl("Tag", { fg = t.tag.hex })
  hl("Underlined", { underline = true })
  hl("Bold", { bold = true })
  hl("Italic", { italic = true })
  hl("Ignore", { fg = t.bg.hex })
  link("Error", "ErrorMsg")
  hl("Todo", { bg = t.info.hex, fg = t.white.hex })
  hl("WinBar", { fg = t.tag.hex, bold = true })
  hl("WinBarNC", { fg = t.fg.hex })

  -- LSP/Diagnostic
  link("DiagnosticError", "Error")
  link("DiagnosticWarn", "WarningMsg")
  hl("DiagnosticInfo", { fg = t.info.hex })
  hl("DiagnosticHint", { fg = t.hint.hex })
  hl("DiagnosticVirtualTextError", { fg = t.error.hex, bg = t.bg:mix(t.error, 20).hex })
  hl("DiagnosticVirtualTextWarn", { fg = t.warning.hex, bg = t.bg:mix(t.warning, 20).hex })
  hl("DiagnosticVirtualTextInfo", { fg = t.info.hex, bg = t.bg:mix(t.info, 20).hex })
  hl("DiagnosticVirtualTextHint", { fg = t.hint.hex, bg = t.bg:mix(t.hint, 20).hex })
  hl("DiagnosticUnderlineError", { undercurl = true, sp = t.error.hex })
  hl("DiagnosticUnderlineWarn", { undercurl = true, sp = t.warning.hex })
  hl("DiagnosticUnderlineInfo", { undercurl = true, sp = t.info.hex })
  hl("DiagnosticUnderlineHint", { undercurl = true, sp = t.hint.hex })

  -- Treesitter
  hl("@constructor", { fg = t.type.hex })
  hl("@operator", { fg = t.punctuation.hex })
  hl("@punctuation", { fg = t.punctuation.hex })
  hl("@punctuation.bracket", { fg = t.punctuation.hex })
  hl("@punctuation.delimiter", { fg = t.punctuation.hex })
  hl("@punctuation.special", { fg = t.punctuation.hex })
  hl("@symbol", { fg = t.constant.hex })
  hl("@constant", { fg = t.constant.hex })
  hl("@constant.builtin", { fg = t.keyword.hex })
  hl("@comment", { fg = t.comment.hex })
  link("@string.escape", "Character")
  hl("@method", { fg = t.method.hex })
  hl("@function", { fg = t.method.hex })
  hl("@function.call", { fg = t.method.hex })
  hl("@function.builtin", { fg = t.method.hex })
  hl("@parameter", { fg = t.parameter.hex })
  link("@field", "Property")
  link("@property", "Property")
  hl("@label", { fg = t.label.hex })
  link("@type", "Type")
  hl("@type.builtin", { fg = t.keyword.hex })
  link("@type.qualifier", "Statement")
  link("@keyword", "Statement")
  link("@keyword.modifier", "Statement")
  link("@string", "String")
  hl("@namespace", { fg = t.module.hex })
  hl("@number", { fg = t.number.hex })
  link("@annotation", "@label")
  link("@text", "Identifier")
  link("@text.strong", "Bold")
  link("@text.italic", "Italic")
  link("@text.underline", "Underlined")
  hl("@text.title", { fg = t.keyword.hex })
  link("@text.literal", "Property")
  hl("@text.uri", { fg = t.tag.hex, sp = t.tag.hex, underline = true })
  link("@variable", "Identifier")
  link("@variable.constant", "Constant")
  link("@variable.builtin", "Statement")
  link("@tag", "Tag")
  link("@tag.builtin", "Tag")
  hl("@attribute", { fg = t.label.hex })
  hl("@tag.attribute", { fg = t.attribute.hex })
  link("@error", "Error")
  link("@warning", "WarningMsg")
  hl("@info", { fg = t.info.hex })

  -- Language specific overrides
  hl("@label.json", { fg = t.property.hex })
  hl("@label.jsonc", { fg = t.property.hex })
  link("@label.help", "@text.uri")
  hl("@text.uri.html", { underline = true })

  -- Treesitter standard capture groups update
  link("@variable.parameter", "@parameter")
  link("@variable.member", "@field")
  link("@module", "@namespace")
  link("@string.special.symbol", "@symbol")
  link("@markup.strong", "@text.strong")
  link("@markup.underline", "@text.underline")
  link("@markup.heading", "@text.title")
  link("@markup.link.url", "@text.uri")
  link("@markup.raw", "@text.literal")
  link("@markup.list", "@punctuation.special")

  -- Helix capture groups
  link("@function.method", "@method")
  link("@string.special.url", "@text.uri")

  -- LSP semantic highlighting
  link("@lsp.type.comment", "@comment")
  link("@lsp.type.namespace", "@namespace")
  link("@lsp.type.type", "@type")
  link("@lsp.type.typeParameter", "@type")
  link("@lsp.type.class", "@type")
  link("@lsp.type.enum", "@type")
  link("@lsp.type.interface", "@type")
  link("@lsp.type.struct", "@type")
  link("@lsp.type.parameter", "@parameter")
  link("@lsp.type.variable", "@variable")
  link("@lsp.type.property", "@property")
  link("@lsp.type.enumMember", "@constant")
  link("@lsp.type.function", "@function")
  link("@lsp.type.method", "@method")
  link("@lsp.type.label", "@label")
  link("@lsp.type.macro", "@label")
  link("@lsp.type.decorator", "@label")
  link("@lsp.type.string", "@string")
  link("@lsp.type.regexp", "@string")
  link("@lsp.type.keyword", "@keyword")
  link("@lsp.type.number", "@number")
  link("@lsp.type.operator", "@operator")
  link("@lsp.type.event", "@parameter")
  link("@lsp.mod.readonly", "@constant")
  link("@lsp.mod.constant", "@constant")
  link("@lsp.typemod.variable.constant", "@constant")
  link("@lsp.typemod.function.declaration", "@function")
  link("@lsp.typemod.function.readonly", "@function")
  hl("LspInlayHint", { bg = t.shade2.hex, fg = t.shade25.hex })

  -- GUI vim
  hl("VimrDefaultCursor", { fg = t.cursor.hex, bg = t.bg.hex })
  hl("VimrInsertCursor", { fg = t.cursor.hex, bg = t.bg.hex })

  -- GitSigns
  hl("GitSignsAdd", { fg = t.added.hex })
  hl("GitSignsChange", { fg = t.changed.hex })
  hl("GitSignsDelete", { fg = t.deleted.hex })
  link("GitSignsUntracked", "GitSignsAdd")
  link("GitSignsUntrackedNr", "GitSignsUntracked")
  link("GitSignsUntrackedCul", "GitSignsUntracked")
  hl("GitSignsStagedAdd", { bg = t.added.hex, fg = t.bg.hex })
  link("GitSignsStagedAddNr", "GitSignsStagedAdd")
  link("GitSignsStagedAddCul", "GitSignsStagedAdd")
  link("GitSignsStagedUntracked", "GitSignsStagedAdd")
  link("GitSignsStagedUntrackedNr", "GitSignsStagedUntracked")
  link("GitSignsStagedUntrackedCul", "GitSignsStagedUntracked")
  hl("GitSignsStagedDelete", { bg = t.deleted.hex, fg = t.bg.hex })
  link("GitSignsStagedDeleteNr", "GitSignsStagedDelete")
  link("GitSignsStagedDeleteCul", "GitSignsStagedDelete")
  link("GitSignsStagedChangedelete", "GitSignsStagedDelete")
  link("GitSignsStagedChangedeleteNr", "GitSignsStagedChangedelete")
  link("GitSignsStagedChangedeleteCul", "GitSignsStagedChangedelete")
  link("GitSignsStagedTopdelete", "GitSignsStagedDelete")
  link("GitSignsStagedTopdeleteNr", "GitSignsStagedTopdelete")
  link("GitSignsStagedTopdeleteCul", "GitSignsStagedTopdelete")
  hl("GitSignsStagedChange", { bg = t.changed.hex, fg = t.bg.hex })
  link("GitSignsStagedChangeNr", "GitSignsStagedChange")
  link("GitSignsStagedChangeCul", "GitSignsStagedChange")

  -- Bufferline
  link("BufferlineFill", "NormalFloat")

  -- BarBar
  link("BufferCurrent", "Normal")
  link("BufferCurrentIndex", "BufferCurrent")
  link("BufferCurrentIcon", "BufferCurrentIndex")
  link("BufferCurrentMod", "BufferCurrent")
  hl("BufferCurrentSign", { fg = t.keyword.hex, bg = t.bg.hex })
  hl("BufferCurrentTarget", { fg = t.type.hex, bg = t.bg.hex })
  hl("BufferCurrentWARN", { fg = t.warning.hex, bg = t.bg.hex })
  hl("BufferCurrentINFO", { fg = t.info.hex, bg = t.bg.hex })
  hl("BufferCurrentERROR", { fg = t.error.hex, bg = t.bg.hex })
  hl("BufferCurrentHINT", { fg = t.hint.hex, bg = t.bg.hex })

  hl("BufferInactive", { fg = t.shade40.hex, bg = t.bgFloat.hex })
  link("BufferInactiveIcon", "BufferInactive")
  link("BufferInactiveIndex", "BufferInactive")
  link("BufferInactiveMod", "BufferInactive")
  link("BufferInactiveSign", "BufferInactive")
  hl("BufferInactiveTarget", { fg = t.type.hex, bg = t.bgFloat.hex })
  hl("BufferInactiveWARN", { fg = t.warning.hex, bg = t.bgFloat.hex })
  hl("BufferInactiveINFO", { fg = t.info.hex, bg = t.bgFloat.hex })
  hl("BufferInactiveERROR", { fg = t.error.hex, bg = t.bgFloat.hex })
  hl("BufferInactiveHINT", { fg = t.hint.hex, bg = t.bgFloat.hex })

  hl("BufferVisible", { fg = t.fg.hex, bg = t.bgFloat.hex })
  link("BufferVisibleIndex", "BufferVisible")
  link("BufferVisibleIcon", "BufferVisibleIndex")
  link("BufferVisibleMod", "BufferVisible")
  link("BufferVisibleSign", "BufferVisible")
  hl("BufferVisibleTarget", { fg = t.type.hex, bg = t.bgFloat.hex })
  link("BufferVisibleWARN", "BufferInactiveWARN")
  link("BufferVisibleINFO", "BufferInactiveINFO")
  link("BufferVisibleERROR", "BufferInactiveERROR")
  link("BufferVisibleHINT", "BufferInactiveHINT")

  link("BufferAlternate", "BufferInactive")
  link("BufferAlternateIndex", "BufferAlternate")
  link("BufferAlternateIcon", "BufferAlternateIndex")
  link("BufferAlternateMod", "BufferInactiveMod")
  hl("BufferAlternateSign", { fg = t.constant.hex, bg = t.bgFloat.hex })
  hl("BufferAlternateTarget", { fg = t.type.hex, bg = t.bgFloat.hex })
  link("BufferAlternateWARN", "BufferInactiveWARN")
  link("BufferAlternateINFO", "BufferInactiveINFO")
  link("BufferAlternateERROR", "BufferInactiveERROR")
  link("BufferAlternateHINT", "BufferInactiveHINT")

  hl("BufferTabpages", { fg = t.fg.hex, bg = t.bgFloat.hex })
  hl("BufferTabpageFill", { fg = t.bg.hex, bg = t.bgFloat.hex })
  link("BufferOffset", "BufferTabpageFill")

  -- Telescope
  hl("TelescopeMultiSelection", { fg = t.attribute.hex })
  hl("TelescopeMultiIcon", { fg = t.primary.hex })
  link("TelescopeNormal", "NormalFloat")
  hl("TelescopeBorder", { fg = t.punctuation.hex, bg = t.bgFloat.hex, blend = 5 })
  hl("TelescopeMatching", { fg = t.keyword.hex })
  hl("TelescopePromptPrefix", { fg = t.punctuation.hex })
  hl("TelescopePreviewLink", { fg = t.label.hex })
  hl("TelescopePreviewSocket", { fg = t.property.hex })
  hl("TelescopePreviewWrite", { fg = t.type.hex })
  hl("TelescopePreviewExecute", { fg = t.method.hex })
  hl("TelescopePreviewSize", { fg = t.number.hex })
  hl("TelescopePreviewUser", { fg = t.property.hex })
  hl("TelescopePreviewGroup", { fg = t.property.hex })
  hl("TelescopePreviewDate", { fg = t.string.hex })
  link("TelescopeResultsClass", "Class")
  link("TelescopeResultsField", "Field")
  link("TelescopeResultsVariable", "Identifier")
  link("TelescopeResultsSpecialComment", "Comment")

  -- Fzf-lua
  link("FzfLuaNormal", "NormalFloat")
  hl("FzfLuaBorder", { fg = t.punctuation.hex, bg = t.bgFloat.hex, blend = 5 })
  hl("FzfLuaTitle", { fg = t.punctuation.hex, bg = t.bgFloat.hex, blend = 5 })
  link("FzfLuaPreviewNormal", "NormalFloat")
  hl("FzfLuaPreviewBorder", { fg = t.punctuation.hex, bg = t.bgFloat.hex, blend = 5 })
  link("FzfLuaCursorLine", "Visual")
  link("FzfLuaCursorLineNr", "Visual")
  link("FzfLuaHeaderBind", "Character")
  hl("FzfLuaHeaderText", { fg = t.method.hex })
  link("FzfLuaPathColNr", "Number")
  link("FzfLuaPathLineNr", "Number")
  hl("FzfLuaBufName", { fg = t.fg.hex })
  link("FzfLuaBufNr", "Number")
  hl("FzfLuaBufFlagCur", { fg = t.keyword.hex })
  hl("FzfLuaBufFlagAlt", { fg = t.tag.hex })
  hl("FzfLuaTabTitle", { fg = t.parameter.hex })
  hl("FzfLuaTabMarker", { fg = t.keyword.hex })
  hl("FzfLuaFilePart", { fg = t.fg.hex })
  hl("FzfLuaLiveSym", { fg = t.keyword.hex })
  hl("FzfLuaFzfCursorLine", { fg = shade(t.fg, 70).hex, bg = t.selection.hex })
  hl("FzfLuaFzfMatch", { fg = t.keyword.hex })
  link("FzfLuaFzfPointer", "Visual")
  hl("FzfLuaFzfPrompt", { fg = t.punctuation.hex })

  -- LSPSaga
  link("TitleIcon", "Function")
  link("SagaNormal", "NormalFloat")
  link("SagaExpand", "Normal")
  link("SagaCollapse", "SagaExpand")
  link("SagaCount", "Number")
  hl("SagaBeacon", { bg = t.cursor.hex, blend = 70 })
  link("CodeActionNumber", "Statement")
  link("FinderSelection", "Visual")
  link("FinderCount", "Number")
  link("FinderIcon", "Punctuation")
  link("FinderType", "Title")
  link("SagaLightBulb", "Attribute")
  link("OutlineIndent", "Whitespace")
  hl("SagaWinbarFile", { fg = t.terminalCyan.hex })
  hl("SagaWinbarSnippet", { fg = t.label.hex })
  link("SagaWinbarKey", "Property")
  link("SagaWinbarValue", "String")
  link("SagaWinbarEnum", "Type")
  link("SagaWinbarClass", "Type")
  link("SagaWinbarFolder", "Tag")
  link("SagaWinbarEnumMember", "Property")
  link("SagaWinbarNull", "Statement")
  link("SagaWinbarFilename", "SagaWinbarFile")
  hl("SagaWinbarFolderName", {})
  hl("SagaWinbarFileIcon", {})
  hl("SagaWinbarSep", { fg = t.punctuation.hex })

  -- Trouble
  hl("TroubleCount", { fg = t.number.hex })
  hl("TroubleNormal", { bg = t.bgFloat.hex })
  hl("TroubleLocation", { fg = t.attribute.hex })
  hl("TroubleText", {})

  -- Nvim Cmp
  hl("CmpDocumentation", { fg = t.fg.hex, bg = t.bgFloat.hex })
  hl("CmpDocumentationBorder", { fg = t.punctuation.hex, bg = t.bgFloat.hex })
  hl("CmpItemAbbr", { fg = t.fg.hex })
  hl("CmpItemAbbrDeprecated", { fg = t.fg.hex, strikethrough = true })
  hl("CmpItemAbbrMatch", { fg = t.primary.hex })
  hl("CmpItemAbbrMatchFuzzy", { fg = t.primary.hex })
  hl("CmpItemMenu", { fg = t.attribute.hex })
  hl("CmpItemKindText", { fg = t.comment.hex })
  hl("CmpItemKindDefault", { fg = t.fg.hex })
  hl("CmpItemKindKeyword", { fg = t.keyword.hex })
  hl("CmpItemKindVariable", { fg = t.fg.hex })
  hl("CmpItemKindConstant", { fg = t.constant.hex })
  hl("CmpItemKindReference", { fg = t.fg.hex })
  hl("CmpItemKindValue", { fg = t.fg.hex })
  hl("CmpItemKindFunction", { fg = t.method.hex })
  hl("CmpItemKindMethod", { fg = t.method.hex })
  hl("CmpItemKindConstructor", { fg = t.type.hex })
  hl("CmpItemKindClass", { fg = t.type.hex })
  hl("CmpItemKindInterface", { fg = t.type.hex })
  hl("CmpItemKindStruct", { fg = t.type.hex })
  hl("CmpItemKindEvent", { fg = t.label.hex })
  hl("CmpItemKindEnum", { fg = t.type.hex })
  hl("CmpItemKindUnit", { fg = t.number.hex })
  hl("CmpItemKindModule", { fg = t.keyword.hex })
  hl("CmpItemKindProperty", { fg = t.property.hex })
  hl("CmpItemKindField", { fg = t.property.hex })
  hl("CmpItemKindTypeParameter", { fg = t.type.hex })
  hl("CmpItemKindEnumMember", { fg = t.type.hex })
  hl("CmpItemKindOperator", { fg = t.punctuation.hex })
  hl("CmpItemKindSnippet", { fg = t.label.hex })
  hl("CmpItemKindCopilot", { fg = t.copilot.hex })
  hl("CmpItemKindCodeium", { fg = t.copilot.hex })
  hl("CmpItemKindSupermaven", { fg = t.copilot.hex })
  hl("CmpItemKindTabNine", { fg = t.copilot.hex })

  -- Blink Cmp
  hl("BlinkCmpDoc", { fg = t.fg.hex, bg = t.bgFloat.hex })
  hl("BlinkCmpDocBorder", { fg = t.punctuation.hex, bg = t.bgFloat.hex })
  hl("BlinkCmpLabel", { fg = t.fg.hex })
  hl("BlinkCmpLabelDeprecated", { fg = t.fg.hex, strikethrough = true })
  hl("BlinkCmpLabelMatch", { fg = t.primary.hex })
  hl("BlinkCmpLabelDetail", { fg = t.attribute.hex })
  hl("BlinkCmpLabelDescription", { fg = t.attribute.hex })
  hl("BlinkCmpSource", { fg = t.attribute.hex })
  link("BlinkCmpKind", "Special")
  hl("BlinkCmpKindText", { fg = t.comment.hex })
  hl("BlinkCmpKindDefault", { fg = t.fg.hex })
  hl("BlinkCmpKindKeyword", { fg = t.keyword.hex })
  hl("BlinkCmpKindVariable", { fg = t.fg.hex })
  hl("BlinkCmpKindConstant", { fg = t.constant.hex })
  hl("BlinkCmpKindReference", { fg = t.fg.hex })
  hl("BlinkCmpKindValue", { fg = t.fg.hex })
  hl("BlinkCmpKindFunction", { fg = t.method.hex })
  hl("BlinkCmpKindMethod", { fg = t.method.hex })
  hl("BlinkCmpKindConstructor", { fg = t.type.hex })
  hl("BlinkCmpKindClass", { fg = t.type.hex })
  hl("BlinkCmpKindInterface", { fg = t.type.hex })
  hl("BlinkCmpKindStruct", { fg = t.type.hex })
  hl("BlinkCmpKindEvent", { fg = t.label.hex })
  hl("BlinkCmpKindEnum", { fg = t.type.hex })
  hl("BlinkCmpKindUnit", { fg = t.number.hex })
  hl("BlinkCmpKindModule", { fg = t.keyword.hex })
  hl("BlinkCmpKindProperty", { fg = t.property.hex })
  hl("BlinkCmpKindField", { fg = t.property.hex })
  hl("BlinkCmpKindTypeParameter", { fg = t.type.hex })
  hl("BlinkCmpKindEnumMember", { fg = t.type.hex })
  hl("BlinkCmpKindOperator", { fg = t.punctuation.hex })
  hl("BlinkCmpKindSnippet", { fg = t.label.hex })
  hl("BlinkCmpKindCopilot", { fg = t.copilot.hex })
  hl("BlinkCmpKindCodeium", { fg = t.copilot.hex })
  hl("BlinkCmpKindSupermaven", { fg = t.copilot.hex })
  hl("BlinkCmpKindTabNine", { fg = t.copilot.hex })

  -- Nvim illuminate
  hl("IlluminatedWordText", { bg = t.grey7.hex })
  hl("IlluminatedWordRead", { bg = t.grey7.hex })
  hl("IlluminatedWordWrite", { bg = t.grey7.hex })

  -- Cursor word
  hl("CursorWord", { bg = t.grey7.hex })
  hl("CursorWord0", { bg = t.grey7.hex })
  hl("CursorWord1", { bg = t.grey7.hex })

  -- Mason
  link("MasonNormal", "NormalFloat")
  hl("MasonHeader", { bg = t.primary.hex, fg = t.bg.hex })
  hl("MasonHeaderSecondary", { bg = t.constant.hex, fg = t.bg.hex })
  hl("MasonHighlight", { fg = t.primary.hex })
  hl("MasonHighlightBlock", { bg = t.primary.hex, fg = t.bg.hex })
  hl("MasonHighlightBlockBold", { bg = t.primary.hex, fg = t.bg.hex, bold = true })
  hl("MasonHighlightSecondary", { fg = t.constant.hex })
  hl("MasonHighlightBlockSecondary", { bg = t.constant.hex, fg = t.bg.hex })
  hl("MasonHighlightBlockBoldSecondary", { bg = t.constant.hex, fg = t.bg.hex, bold = true })
  link("MasonLink", "@text.uri")
  hl("MasonMuted", { fg = t.shade50.hex })
  hl("MasonMutedBlock", { bg = t.shade40.hex, fg = t.bg.hex })
  hl("MasonMutedBlockBold", { bg = t.shade40.hex, fg = t.bg.hex, bold = true })
  link("MasonError", "Error")
  hl("MasonHeading", { bold = true, underline = true, fg = t.fg.hex })

  -- Which-key
  link("WhichKey", "Character")
  link("WhichKeyGroup", "Tag")
  link("WhichKeySeparator", "Operator")
  link("WhichKeyDesc", "@text.title")

  -- Diffview
  hl("DiffviewStatusAdded", { fg = t.method.hex })
  hl("DiffviewStatusModified", { fg = t.keyword.hex })
  hl("DiffviewStatusRenamed", { fg = t.keyword.hex })
  hl("DiffviewStatusCopied", { fg = t.keyword.hex })
  hl("DiffviewStatusTypeChanged", { fg = t.keyword.hex })
  hl("DiffviewStatusUnmerged", { fg = t.number.hex })
  hl("DiffviewStatusUnknown", { fg = t.property.hex })
  hl("DiffviewStatusDeleted", { fg = t.type.hex })
  hl("DiffviewStatusIgnored", { fg = t.comment.hex })
  hl("DiffviewFilePanelInsertions", { fg = t.added.hex })
  hl("DiffviewFilePanelDeletions", { fg = t.deleted.hex })
  hl("DiffviewFilePanelRootPath", { fg = t.tag.hex })
  hl("DiffviewFilePanelTitle", { fg = t.constant.hex })
  hl("DiffviewFilePanelCounter", { fg = t.attribute.hex })
  hl("DiffviewFilePanelPath", { fg = t.comment.hex })
  hl("DiffviewFilePanelConflicts", { fg = t.number.hex })
  link("DiffviewFolderName", "Directory")
  hl("DiffviewPrimary", { fg = t.keyword.hex })
  hl("DiffviewSecondary", { fg = t.tag.hex })

  -- Vim-fugitive
  hl("diffAdded", { fg = t.method.hex })
  hl("diffRemoved", { fg = t.type.hex })
  link("diffFile", "File")
  hl("diffNewFile", { fg = t.constant.hex })
  hl("diffOldFile", { fg = t.property.hex })
  hl("diffLine", { fg = t.number.hex })
  hl("diffIndexLine", { fg = t.parameter.hex })
  hl("diffSubname", { fg = t.string.hex })

  -- Nvim tree
  hl("NvimTreeNormal", { bg = t.bgFloat.hex })
  hl("NvimTreeNormalNC", { bg = t.bgFloat.hex })
  hl("NvimTreeWindowPicker", { fg = t.fg.hex, bg = t.selection.hex, bold = true })
  hl("NvimTreeIndentMarker", { fg = t.punctuation.hex })
  hl("NvimTreeRootFolder", { fg = t.tag.hex })
  hl("NvimTreeFolderIcon", { fg = t.keyword.hex })
  hl("NvimTreeFolderName", { fg = t.tag.hex })
  hl("NvimTreeOpenedFolderName", { fg = t.keyword.hex })
  hl("NvimTreeSpecialFile", { fg = t.constant.hex })
  hl("NvimTreeExecFile", { fg = t.method.hex })
  hl("NvimTreeGitStaged", { fg = t.method.hex })
  hl("NvimTreeGitDirty", { fg = t.type.hex })
  hl("NvimTreeGitMerge", { fg = t.number.hex })
  hl("NvimTreeGitDeleted", { fg = t.deleted.hex })
  hl("NvimTreeGitNew", { fg = t.method.hex })

  -- Git-conflict
  hl("GitConflictCurrent", { bg = t.mergeCurrent.hex, blend = 5 })
  hl("GitConflictIncoming", { bg = t.mergeIncoming.hex, blend = 5 })
  hl("GitConflictAncestor", { bg = t.mergeParent.hex, blend = 5 })
  hl("GitConflictCurrentLabel", { bg = t.mergeCurrentLabel.hex, blend = 5 })
  hl("GitConflictIncomingLabel", { bg = t.mergeIncomingLabel.hex, blend = 5 })
  hl("GitConflictAncestorLabel", { bg = t.mergeParentLabel.hex, blend = 5 })

  -- Nvim-notify
  link("NotifyBackground", "NormalFloat")
  hl("NotifyERRORBorder", { fg = t.error.hex })
  hl("NotifyWARNBorder", { fg = t.warning.hex })
  hl("NotifyINFOBorder", { fg = t.info.hex })
  hl("NotifyDEBUGBorder", { fg = t.punctuation.hex })
  hl("NotifyTRACEBorder", { fg = t.property.hex })
  link("NotifyERRORIcon", "NotifyERRORBorder")
  link("NotifyWARNIcon", "NotifyWARNBorder")
  link("NotifyINFOIcon", "NotifyINFOBorder")
  link("NotifyDEBUGIcon", "NotifyDEBUGBorder")
  link("NotifyTRACEIcon", "NotifyTRACEBorder")
  link("NotifyERRORTitle", "NotifyERRORBorder")
  link("NotifyWARNTitle", "NotifyWARNBorder")
  link("NotifyINFOTitle", "NotifyINFOBorder")
  link("NotifyDEBUGTitle", "NotifyDEBUGBorder")
  link("NotifyTRACETitle", "NotifyTRACEBorder")

  -- Hlargs
  link("Hlargs", "@parameter")

  -- Virt-column
  link("VirtColumn", "Whitespace")

  -- Indent blankline & rainbow
  hl("RainbowRed", { fg = t.rainbowRed.hex })
  hl("RainbowYellow", { fg = t.rainbowYellow.hex })
  hl("RainbowBlue", { fg = t.rainbowBlue.hex })
  hl("RainbowOrange", { fg = t.rainbowOrange.hex })
  hl("RainbowGreen", { fg = t.rainbowGreen.hex })
  hl("RainbowViolet", { fg = t.rainbowViolet.hex })
  hl("RainbowCyan", { fg = t.rainbowCyan.hex })

  -- Rainbow-delimiter
  hl("RainbowDelimiterRed", { fg = t.rainbowRed.hex })
  hl("RainbowDelimiterYellow", { fg = t.rainbowYellow.hex })
  hl("RainbowDelimiterBlue", { fg = t.rainbowBlue.hex })
  hl("RainbowDelimiterOrange", { fg = t.rainbowOrange.hex })
  hl("RainbowDelimiterGreen", { fg = t.rainbowGreen.hex })
  hl("RainbowDelimiterViolet", { fg = t.rainbowViolet.hex })
  hl("RainbowDelimiterCyan", { fg = t.rainbowCyan.hex })

  -- Snacks.nvim indent
  link("SnacksIndent", "Whitespace")
  link("SnacksIndentScope", "LineNr")
  hl("SnacksIndent1", { fg = t.rainbowRed.hex })
  hl("SnacksIndent2", { fg = t.rainbowYellow.hex })
  hl("SnacksIndent3", { fg = t.rainbowBlue.hex })
  hl("SnacksIndent4", { fg = t.rainbowOrange.hex })
  hl("SnacksIndent5", { fg = t.rainbowGreen.hex })
  hl("SnacksIndent6", { fg = t.rainbowViolet.hex })
  hl("SnacksIndent7", { fg = t.rainbowCyan.hex })
  hl("SnacksIndent8", { fg = t.rainbowIndigo.hex })

  -- Snacks.nvim notifier
  hl("SnacksNotifierBorderError", { fg = t.error.hex })
  hl("SnacksNotifierBorderWarn", { fg = t.warning.hex })
  hl("SnacksNotifierBorderInfo", { fg = t.info.hex })
  hl("SnacksNotifierBorderDebug", { fg = t.punctuation.hex })
  hl("SnacksNotifierBorderTrace", { fg = t.property.hex })
  link("SnacksNotifierIconError", "SnacksNotifierBorderError")
  link("SnacksNotifierIconWarn", "SnacksNotifierBorderWarn")
  link("SnacksNotifierIconInfo", "SnacksNotifierBorderInfo")
  link("SnacksNotifierIconDebug", "SnacksNotifierBorderDebug")
  link("SnacksNotifierIconTrace", "SnacksNotifierBorderTrace")
  link("SnacksNotifierTitleError", "SnacksNotifierBorderError")
  link("SnacksNotifierTitleWarn", "SnacksNotifierBorderWarn")
  link("SnacksNotifierTitleInfo", "SnacksNotifierBorderInfo")
  link("SnacksNotifierTitleDebug", "SnacksNotifierBorderDebug")
  link("SnacksNotifierTitleTrace", "SnacksNotifierBorderTrace")

  -- Snacks.nvim picker
  hl("SnacksPickerInput", { bg = t.bgFloat.hex, blend = 0 })
  hl("SnacksPickerBorder", { fg = t.punctuation.hex, bg = t.bgFloat.hex, blend = 5 })
  hl("SnacksPickerTitle", { fg = t.punctuation.hex, bg = t.bgFloat.hex, blend = 5 })
  hl("SnacksPickerSelected", { fg = t.primary.hex })
  link("SnacksPickerSearch", "Visual")
  hl("SnacksPickerMatch", { fg = t.keyword.hex })
  hl("SnacksPickerPrompt", { fg = t.punctuation.hex })
  link("SnacksPickerCol", "Number")
  link("SnacksPickerRow", "Number")
  hl("SnacksPickerFile", { fg = t.fg.hex })
  link("SnacksPickerDir", "Comment")
  hl("SnacksPickerBufFlags", { fg = t.primary.hex })
  hl("SnacksPickerGitStatusAdded", { fg = t.method.hex })
  hl("SnacksPickerGitStatusModified", { fg = t.keyword.hex })
  hl("SnacksPickerGitStatusRenamed", { fg = t.keyword.hex })
  hl("SnacksPickerGitStatusCopied", { fg = t.keyword.hex })
  hl("SnacksPickerGitStatusUnmerged", { fg = t.number.hex })
  hl("SnacksPickerGitStatusDeleted", { fg = t.type.hex })
  hl("SnacksPickerGitStatusIgnored", { fg = t.comment.hex })
  hl("SnacksPickerGitStatusUntracked", { fg = t.comment.hex })

  -- Neotest
  hl("NeotestPassed", { fg = t.added.hex })
  link("NeotestRunning", "DiagnosticInfo")
  link("NeotestSkipped", "DiagnosticWarn")
  link("NeotestFailed", "DiagnosticError")
  hl("NeotestAdapterName", {})
  hl("NeotestBorder", {})
  link("NeotestDir", "Directory")
  hl("NeotestExpandMarker", {})
  hl("NeotestFile", { fg = t.tag.hex })
  hl("NeotestFocused", {})
  hl("NeotestIndent", {})
  hl("NeotestMarked", {})
  hl("NeotestNamespace", {})
  hl("NeotestWinSelect", {})
  hl("NeotestTarget", {})
  hl("NeotestTest", {})
  hl("NeotestUnknown", {})
  hl("NeotestWatching", { fg = t.constant.hex })

  -- Leap/Flash
  hl("LeapMatch", { fg = t.keyword.hex, underline = true, sp = t.keyword.hex })
  hl("LeapLabel", { bg = t.keyword.hex, fg = t.bg.hex })
  hl("LeapBackdrop", { fg = t.shade40.hex })
  link("FlashMatch", "LeapMatch")
  link("FlashLabel", "LeapLabel")
  link("FlashBackdrop", "LeapBackdrop")

  -- Copilot
  hl("CopilotSuggestion", { fg = t.copilot:mix(t.bg, 20).hex })
  hl("CopilotAnnotation", { fg = t.copilot:mix(t.primary, 50):mix(t.bg, 30).hex })

  -- Basic syntax without treesitter
  -- JavaScript
  link("javaScript", "Identifier")
  link("javaScriptIdentifier", "Statement")
  link("javaScriptFunction", "Statement")
  link("javaScriptParens", "Punctuation")
  link("javaScriptBraces", "Punctuation")
  link("javaScriptNumber", "Number")

  -- TypeScript
  link("typeScriptImport", "Statement")
  link("typeScriptExport", "Statement")
  link("typeScriptIdentifier", "Statement")
  link("typescriptVariable", "Statement")
  link("typeScriptFunction", "Statement")
  hl("typescriptPredefinedType", { fg = t.keyword.hex })
  link("typescriptClassStatic", "Statement")
  link("typescriptNodeGlobal", "Statement")
  link("typescriptExceptions", "Statement")
  link("typeScriptParens", "Punctuation")
  link("typeScriptBraces", "Punctuation")
  link("typescriptTypeBrackets", "Punctuation")
  link("typescriptInterfaceTypeParameter", "Punctuation")
  link("typescriptConditionalType", "Punctuation")
  link("typeScriptNumber", "Number")
  link("typeScriptAliasDeclaration", "Type")
  link("typeScriptTypeReference", "Type")
  link("typeScriptTypeParameter", "Type")
  link("typescriptClassName", "Type")
  link("typescriptClassHeritage", "Type")
  link("typescriptProp", "Property")
  link("typescriptOperator", "Operator")
  link("typescriptBinaryOp", "Operator")
  hl("typescriptDocNotation", { fg = t.shade50.hex })
  link("typescriptDocTags", "typescriptDocNotation")

  -- JSON
  link("jsonKeyword", "Property")
  link("jsonQuote", "String")
  link("jsonBraces", "Punctuation")

  -- HTML
  link("htmlTagName", "Tag")
  link("htmlSpecialTagName", "Tag")
  link("htmlTag", "htmlTagName")
  link("htmlEndTag", "htmlTagName")
  link("htmlTagN", "htmlTagName")
  link("htmlArg", "Special")
  link("htmlSpecialChar", "Constant")

  -- XML
  link("xmlTag", "Tag")
  link("xmlProcessing", "Tag")
  link("xmlProcessingDelim", "Tag")
  link("xmlDoctypeDecl", "Tag")
  link("xmlTagName", "Tag")
  link("xmlDoctype", "Statement")
  link("xmlAttrib", "Attribute")
  link("xmlEqual", "Punctuation")
  link("xmlEntityPunct", "Punctuation")
  link("xmlEntity", "Constant")
  hl("xmlCdataStart", { fg = t.label.hex })

  -- CSS
  link("cssProp", "Property")
  link("cssBraces", "Punctuation")
  link("cssNoise", "Punctuation")
  link("cssSelectorOp", "Punctuation")
  link("cssSelectorOp2", "Punctuation")
  link("cssAttrComma", "Punctuation")
  link("cssClassNameDot", "Punctuation")
  link("cssFunctionComma", "Punctuation")
  link("cssClassName", "Special")
  link("cssIdentifier", "Type")
  link("cssImportant", "Statement")
  link("cssTagName", "Tag")
  hl("cssUrl", { fg = t.string.hex, underline = true })
  link("cssUnitDecorators", "Constant")

  -- Rust
  link("rustModPathSep", "Punctuation")
  link("rustFoldBraces", "Punctuation")
  link("rustBoxPlacementBalance", "Punctuation")
  link("rustSigil", "Punctuation")
  link("rustStorage", "Statement")

  -- Ruby
  link("rubyConstant", "Constant")
  link("rubyCurlyBlockDelimiter", "Punctuation")
  link("rubyInterpolation", "Punctuation")
  link("rubyInterpolationDelimiter", "Punctuation")
  link("rubyStringDelimiter", "String")
  link("rubyKeywordAsMethod", "Function")

  -- Python
  hl("pythonDecorator", { fg = t.label.hex })
  hl("pythonDecoratorName", { fg = t.label.hex })
  link("pythonAttribute", "Property")
  hl("pythonBuiltin", { fg = t.keyword.hex })

  -- YAML
  link("yamlBlockMappingKey", "Property")
  link("yamlKeyValueDelimiter", "Punctuation")
  link("yamlNodeTag", "Statement")

  -- INI
  link("@type.ini", "Title")
  link("dosiniLabel", "Property")
  link("dosiniValue", "String")
  link("dosiniHeader", "Title")
  link("dosiniNumber", "Number")
  link("dosiniComment", "Comment")

  -- Markdown
  link("markdownBoldItalicDelimiter", "Punctuation")
  link("markdownUrITitleDelimiter", "Punctuation")
  link("markdownOrderedListMarker", "Punctuation")
  link("markdownHeadingDelimiter", "Punctuation")
  link("markdownStrikeDelimiter", "Punctuation")
  link("markdownItalicDelimiter", "Punctuation")
  link("markdownIdDeclaration", "Punctuation")
  link("markdownCodeDelimiter", "Punctuation")
  link("markdownBoldDelimiter", "Punctuation")
  link("markdownUrlDelimiter", "Punctuation")
  link("markdownLinkTextDelimiter", "Punctuation")
  link("markdownLinkDelimiter", "Punctuation")
  link("markdownIdDelimiter", "Punctuation")
  link("markdownHeadingRule", "Punctuation")
  link("markdownH6Delimiter", "Punctuation")
  link("markdownH5Delimiter", "Punctuation")
  link("markdownH4Delimiter", "Punctuation")
  link("markdownH3Delimiter", "Punctuation")
  link("markdownH2Delimiter", "Punctuation")
  link("markdownH1Delimiter", "Punctuation")
  link("markdownListMarker", "Punctuation")
  hl("markdownBlockquote", { fg = t.constant.hex })
  hl("markdownUrITitle", {})
  hl("markdownLinkText", { fg = t.constant.hex })
  hl("markdownFootnoteDefinition", { fg = t.number.hex })
  hl("markdownFootnote", { fg = t.number.hex })
  hl("markdownItalic", { italic = true, fg = t.parameter.hex })
  link("markdownRule", "Keyword")
  hl("markdownBold", { bold = true, fg = t.type.hex })
  hl("markdownUrl", { fg = t.tag.hex, sp = t.tag.hex, underline = true })
  hl("markdownLink", { fg = t.tag.hex, sp = t.tag.hex, underline = true })
  hl("markdownCode", { fg = t.property.hex })
  hl("markdownCodeBlock", { fg = t.property.hex })
  hl("markdownId", { fg = t.method.hex })
  hl("markdownH6", { fg = t.keyword.hex })
  hl("markdownH5", { fg = t.keyword.hex })
  hl("markdownH4", { fg = t.keyword.hex })
  hl("markdownH3", { fg = t.keyword.hex })
  hl("markdownH2", { fg = t.keyword.hex })
  hl("markdownH1", { fg = t.keyword.hex })

  -- Apply configuration-specific overrides
  local isGui = vim.fn.has("gui_running") == 1

  -- Transparency
  -- Match original lush behavior: only override Normal, sidebars, and bufferline
  -- Floating windows keep their blend=5 for proper transparency rendering
  if config.transparent == true and not isGui then
    hl("Normal", { fg = t.fg.hex, bg = "NONE" })
    hl("NormalSB", { bg = "NONE" })
    hl("BufferlineFill", { bg = "NONE" })
    hl("TroubleNormal", { bg = "NONE" })
    hl("NvimTreeNormal", { bg = "NONE" })
    hl("NvimTreeNormalNC", { bg = "NONE" })
    hl("BufferInactive", { fg = t.shade40.hex, bg = "NONE" })
    link("BufferVisible", "BufferCurrent")
  end

  -- Italics
  if config.italics == true then
    hl("Statement", { fg = t.keyword.hex, italic = true })
    hl("Boolean", { fg = t.keyword.hex, italic = true })
    hl("Comment", { fg = t.comment.hex, italic = true })
    hl("@tag.attribute", { fg = t.attribute.hex, italic = true })
    hl("@annotation", { fg = t.label.hex, italic = true })
  end

  -- Rainbow headings
  if config.rainbow_headings == true then
    hl("@markup.heading.1", { fg = t.rainbowRed.hex })
    hl("@markup.heading.2", { fg = t.rainbowYellow.hex })
    hl("@markup.heading.3", { fg = t.rainbowBlue.hex })
    hl("@markup.heading.4", { fg = t.rainbowOrange.hex })
    hl("@markup.heading.5", { fg = t.rainbowGreen.hex })
    hl("@markup.heading.6", { fg = t.rainbowViolet.hex })
    hl("markdownH1", { fg = t.rainbowRed.hex })
    hl("markdownH2", { fg = t.rainbowYellow.hex })
    hl("markdownH3", { fg = t.rainbowBlue.hex })
    hl("markdownH4", { fg = t.rainbowOrange.hex })
    hl("markdownH5", { fg = t.rainbowGreen.hex })
    hl("markdownH6", { fg = t.rainbowViolet.hex })
  end

  -- Bufferline specific
  local bufferlineInstalled = pcall(require, 'bufferline')
  if bufferlineInstalled then
    hl("TabLineSel", { bg = t.keyword.hex })
  end
end

return M

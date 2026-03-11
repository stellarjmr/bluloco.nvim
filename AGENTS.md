# Bluloco.nvim Performance Optimization & Dependency Elimination

## Overview
This document outlines the work to eliminate external dependencies and improve performance for the bluloco.nvim colorscheme.

## Current State Analysis

### Dependencies
The project currently has a single external dependency:
- **lush.nvim** - A colorscheme creation tool that provides:
  - HSL color manipulation functions (hsl(), mix(), lighten(), darken(), etc.)
  - Theme DSL for defining highlight groups
  - Theme extension/composition functionality

### Usage of lush.nvim
1. **lua/lush_theme/bluloco.lua** (lines 1-2, 255):
   - Imports lush and lush.hsl
   - Uses HSL functions for color definitions and manipulation
   - Wraps entire theme in `lush(function()...)` DSL

2. **lua/bluloco/init.lua** (lines 2, 35, 51, 65, 87, 95):
   - Imports lush
   - Uses `lush.extends()` for theme modifications (transparency, italics, rainbow headings, bufferline)
   - Calls `lush(theme)` to apply the theme

### Performance Bottlenecks
1. **Runtime overhead**: Lush DSL parsing and processing on every colorscheme load
2. **Dependency loading**: External module dependency adds loading time
3. **Module reloading**: `package.loaded['lush_theme.bluloco'] = nil` forces module reload (line 31 in init.lua)
4. **Unnecessary abstraction**: Theme extension system adds complexity for simple highlight overrides

## Implementation Plan

### 1. Create Native HSL Color Utility
**File**: `lua/bluloco/colors.lua`
- Implement HSL to RGB conversion
- Implement color manipulation functions:
  - `lighten(color, amount)` / `darken(color, amount)`
  - `saturate(color, amount)` / `desaturate(color, amount)`
  - `mix(color1, color2, ratio)`
  - `hsl(h, s, l)` / `hsl(hex_string)`
- Use pure Lua with optimized algorithms
- Cache converted colors to avoid redundant calculations

### 2. Rewrite Theme Using Native Neovim Highlights
**File**: `lua/bluloco/highlights.lua`
- Convert lush DSL theme definitions to data structures
- Use `vim.api.nvim_set_hl()` for setting highlights
- Organize highlights by category (syntax, LSP, treesitter, plugins, etc.)
- Pre-calculate all colors during module load

### 3. Simplify Theme Loading
**File**: `lua/bluloco/init.lua`
- Remove lush dependency
- Replace `lush.extends()` with direct highlight overrides
- Remove unnecessary module reloading
- Apply configuration-based modifications directly

### 4. Update Documentation
**Files**: `README.md`
- Remove lush.nvim from installation instructions
- Update dependency requirements
- Note performance improvements

## Expected Benefits

### Dependency Elimination
- ✅ Zero external dependencies
- ✅ Simpler installation process
- ✅ Reduced potential for version conflicts
- ✅ Smaller total codebase footprint

### Performance Improvements
- ✅ Faster colorscheme loading (eliminate DSL parsing overhead)
- ✅ Reduced memory usage (no lush module loaded)
- ✅ Optimized color calculations (caching, direct computation)
- ✅ Simplified code paths (direct API calls vs abstraction layers)

### Maintainability
- ✅ More straightforward code (native Neovim APIs)
- ✅ Easier debugging (no DSL layer)
- ✅ Better IDE support (standard Lua patterns)
- ✅ Clearer data flow

## Implementation Details

### Color Utility Functions
```lua
-- HSL to RGB conversion with caching
local function hsl(h, s, l)
  -- Convert HSL to RGB
  -- Return hex color string
end

-- Color manipulation
local function lighten(color, amount)
  -- Parse color, adjust lightness, return new color
end

local function mix(color1, color2, ratio)
  -- Blend two colors by ratio
end
```

### Highlight Application
```lua
-- Direct highlight setting
vim.api.nvim_set_hl(0, "Normal", {
  fg = colors.fg,
  bg = colors.bg
})

-- Support for all highlight options
-- fg, bg, sp, bold, italic, underline, etc.
```

### Configuration Overrides
```lua
-- Apply transparency
if config.transparent then
  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  -- ... other transparent backgrounds
end

-- Apply italics
if config.italics then
  vim.api.nvim_set_hl(0, "Comment", { italic = true })
  -- ... other italic styles
end
```

## Testing Strategy
1. Visual comparison: Ensure colors match exactly
2. Performance testing: Measure load time improvements
3. Configuration testing: Verify all config options work
4. Plugin compatibility: Test with supported plugins
5. Both themes: Validate dark and light variants

## Migration Path
This change is **fully backward compatible** for users:
- No API changes required
- Same configuration options
- Same visual appearance
- Only installation instructions change (remove lush dependency)

## Status
- [x] Analysis complete
- [ ] Color utility implementation
- [ ] Theme rewrite
- [ ] Init.lua refactor
- [ ] Documentation updates
- [ ] Testing
- [ ] Release

## Performance Metrics
Will be measured after implementation:
- Colorscheme load time: Before vs After
- Memory usage: Before vs After
- Module load count: Before vs After

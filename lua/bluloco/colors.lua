-- Native HSL color utility module
-- Replaces lush.hsl with zero dependencies

local M = {}

-- Cache for color conversions to improve performance
local color_cache = {}

-- Clamp value between 0 and 1
local function clamp(val)
  return math.max(0, math.min(1, val))
end

-- Clamp value between min and max
local function clamp_range(val, min, max)
  return math.max(min, math.min(max, val))
end

-- Round to integer
local function round(val)
  return math.floor(val + 0.5)
end

-- Convert hue to RGB component
local function hue_to_rgb(p, q, t)
  if t < 0 then t = t + 1 end
  if t > 1 then t = t - 1 end
  if t < 1/6 then return p + (q - p) * 6 * t end
  if t < 1/2 then return q end
  if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
  return p
end

-- Convert HSL to RGB
-- h: 0-360, s: 0-100, l: 0-100
-- Returns r, g, b as 0-255
local function hsl_to_rgb(h, s, l)
  h = h / 360
  s = s / 100
  l = l / 100

  local r, g, b

  if s == 0 then
    r, g, b = l, l, l
  else
    local q = l < 0.5 and l * (1 + s) or l + s - l * s
    local p = 2 * l - q
    r = hue_to_rgb(p, q, h + 1/3)
    g = hue_to_rgb(p, q, h)
    b = hue_to_rgb(p, q, h - 1/3)
  end

  return round(r * 255), round(g * 255), round(b * 255)
end

-- Convert RGB to HSL
-- r, g, b: 0-255
-- Returns h: 0-360, s: 0-100, l: 0-100
local function rgb_to_hsl(r, g, b)
  r, g, b = r / 255, g / 255, b / 255

  local max = math.max(r, g, b)
  local min = math.min(r, g, b)
  local h, s, l = 0, 0, (max + min) / 2

  if max ~= min then
    local d = max - min
    s = l > 0.5 and d / (2 - max - min) or d / (max + min)

    if max == r then
      h = (g - b) / d + (g < b and 6 or 0)
    elseif max == g then
      h = (b - r) / d + 2
    else
      h = (r - g) / d + 4
    end

    h = h / 6
  end

  return round(h * 360), round(s * 100), round(l * 100)
end

-- Convert hex string to RGB
-- Supports #RRGGBB format
local function hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  if #hex == 3 then
    hex = hex:gsub("(%x)", "%1%1")
  end
  return tonumber(hex:sub(1,2), 16),
         tonumber(hex:sub(3,4), 16),
         tonumber(hex:sub(5,6), 16)
end

-- Convert RGB to hex string
local function rgb_to_hex(r, g, b)
  return string.format("#%02X%02X%02X", round(r), round(g), round(b))
end

-- Color object constructor
local function new_color(h, s, l, hex_val)
  local color = {
    h = h,
    s = s,
    l = l,
    hex = hex_val
  }

  -- Lighten color (increase lightness)
  function color.lighten(self, amount)
    local cache_key = string.format("%s_li_%d", self.hex, amount)
    if color_cache[cache_key] then
      return color_cache[cache_key]
    end

    local new_l = clamp_range(self.l + amount, 0, 100)
    local r, g, b = hsl_to_rgb(self.h, self.s, new_l)
    local hex = rgb_to_hex(r, g, b)
    local result = new_color(self.h, self.s, new_l, hex)
    color_cache[cache_key] = result
    return result
  end

  -- Darken color (decrease lightness)
  function color.darken(self, amount)
    local cache_key = string.format("%s_da_%d", self.hex, amount)
    if color_cache[cache_key] then
      return color_cache[cache_key]
    end

    local new_l = clamp_range(self.l - amount, 0, 100)
    local r, g, b = hsl_to_rgb(self.h, self.s, new_l)
    local hex = rgb_to_hex(r, g, b)
    local result = new_color(self.h, self.s, new_l, hex)
    color_cache[cache_key] = result
    return result
  end

  -- Saturate color (increase saturation)
  function color.saturate(self, amount)
    local cache_key = string.format("%s_sa_%d", self.hex, amount)
    if color_cache[cache_key] then
      return color_cache[cache_key]
    end

    local new_s = clamp_range(self.s + amount, 0, 100)
    local r, g, b = hsl_to_rgb(self.h, new_s, self.l)
    local hex = rgb_to_hex(r, g, b)
    local result = new_color(self.h, new_s, self.l, hex)
    color_cache[cache_key] = result
    return result
  end

  -- Desaturate color (decrease saturation)
  function color.desaturate(self, amount)
    local cache_key = string.format("%s_de_%d", self.hex, amount)
    if color_cache[cache_key] then
      return color_cache[cache_key]
    end

    local new_s = clamp_range(self.s - amount, 0, 100)
    local r, g, b = hsl_to_rgb(self.h, new_s, self.l)
    local hex = rgb_to_hex(r, g, b)
    local result = new_color(self.h, new_s, self.l, hex)
    color_cache[cache_key] = result
    return result
  end

  -- Rotate hue
  function color.rotate(self, amount)
    local cache_key = string.format("%s_ro_%d", self.hex, amount)
    if color_cache[cache_key] then
      return color_cache[cache_key]
    end

    local new_h = (self.h + amount) % 360
    local r, g, b = hsl_to_rgb(new_h, self.s, self.l)
    local hex = rgb_to_hex(r, g, b)
    local result = new_color(new_h, self.s, self.l, hex)
    color_cache[cache_key] = result
    return result
  end

  -- Mix with another color
  function color.mix(self, other, ratio)
    ratio = ratio or 50
    local cache_key = string.format("%s_mix_%s_%d", self.hex, other.hex, ratio)
    if color_cache[cache_key] then
      return color_cache[cache_key]
    end

    local weight = ratio / 100
    local r1, g1, b1 = hex_to_rgb(self.hex)
    local r2, g2, b2 = hex_to_rgb(other.hex)

    local r = r1 * (1 - weight) + r2 * weight
    local g = g1 * (1 - weight) + g2 * weight
    local b = b1 * (1 - weight) + b2 * weight

    local h, s, l = rgb_to_hsl(r, g, b)
    local hex = rgb_to_hex(r, g, b)
    local result = new_color(h, s, l, hex)
    color_cache[cache_key] = result
    return result
  end

  -- Absolute lightness
  function color.abs_lighten(self, target)
    return new_color(self.h, self.s, clamp_range(target, 0, 100),
                     rgb_to_hex(hsl_to_rgb(self.h, self.s, target)))
  end

  -- Absolute saturation
  function color.abs_saturate(self, target)
    return new_color(self.h, clamp_range(target, 0, 100), self.l,
                     rgb_to_hex(hsl_to_rgb(self.h, target, self.l)))
  end

  -- Absolute hue
  function color.hue(self, target)
    return new_color(target % 360, self.s, self.l,
                     rgb_to_hex(hsl_to_rgb(target, self.s, self.l)))
  end

  -- Aliases for convenience
  color.li = color.lighten
  color.da = color.darken
  color.sa = color.saturate
  color.de = color.desaturate
  color.ro = color.rotate

  return color
end

-- Main hsl function - accepts hex string or h, s, l values
function M.hsl(h, s, l)
  -- If h is a string, treat it as hex color
  if type(h) == "string" then
    local hex = h
    local cache_key = "hsl_" .. hex
    if color_cache[cache_key] then
      return color_cache[cache_key]
    end

    local r, g, b = hex_to_rgb(hex)
    local hue, sat, light = rgb_to_hsl(r, g, b)
    local result = new_color(hue, sat, light, hex)
    color_cache[cache_key] = result
    return result
  else
    -- Create from h, s, l values
    local cache_key = string.format("hsl_%d_%d_%d", h, s, l)
    if color_cache[cache_key] then
      return color_cache[cache_key]
    end

    local r, g, b = hsl_to_rgb(h, s, l)
    local hex = rgb_to_hex(r, g, b)
    local result = new_color(h, s, l, hex)
    color_cache[cache_key] = result
    return result
  end
end

-- Clear color cache (useful for memory management)
function M.clear_cache()
  color_cache = {}
end

return M

local function get_font()
  return vim.opt.guifont["_value"]
end

function UF(value)
  vim.opt.guifont = string.sub(get_font(), 1, -3) .. value
end

function Increment()
  local font = string.sub(get_font(), -2, -1)
  local font_num = tonumber(font) + 1
  font = tostring(font_num)
  UF(font)
end

function Decrement()
  local font = string.sub(get_font(), -2, -1)
  local font_num = tonumber(font) - 1
  font = tostring(font_num)
  UF(font)
end

Increment()

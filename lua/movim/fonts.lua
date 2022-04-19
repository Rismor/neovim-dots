local function get_font()
  return vim.opt.guifont["_value"]
end

function UF(value)
  local s = get_font()
  local  i,j = string.find(string.reverse(s),"h" )
  vim.opt.guifont = string.sub(get_font(), 1, 0-i) .. value
end

function Increment()
  local s = get_font()
  local  i,j = string.find(string.reverse(s),"h" )
  local font = string.sub(get_font(), 1-i, string.len(s))
  print(font)
  local font_num = tonumber(font) + 1
  font = tostring(font_num)
  UF(font)
end

function Decrement()
  local s = get_font()
  local  i,j = string.find(string.reverse(s),"h" )
  local font = string.sub(get_font(), 1-i, string.len(s))
  local font_num = tonumber(font) - 1
  font = tostring(font_num)
  UF(font)
end

function Print_font()
  local font = string.sub(get_font(), -2, -1)
  print(font)
end

-- local s = get_font()
-- local  i,j = string.find(string.reverse(s),"h" )
-- s = string.sub(s,1,0-i) .. "15"
-- print(s)

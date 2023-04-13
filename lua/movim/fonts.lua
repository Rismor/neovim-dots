local function get_font()
  return vim.opt.guifont["_value"]
end

function UF(value)
  local s = get_font()
  local  i = string.find(string.reverse(s),"h" )
  vim.opt.guifont = string.sub(get_font(), 1, 0-i) .. value
end

function Increment()
  local s = get_font()
  local  i = string.find(string.reverse(s),"h" )
  local font = string.sub(get_font(), 1-i, string.len(s))
  local font_num = tonumber(font) + 1
  font = tostring(font_num)
  UF(font)
end

function Decrement()
  local s = get_font()
  local  i = string.find(string.reverse(s),"h" )
  local font = string.sub(get_font(), 1-i, string.len(s))
  local font_num = tonumber(font) - 1
  font = tostring(font_num)
  UF(font)
end

function Print_font()
  local s = get_font()
  local font = string.sub(s, 1 - string.find(string.reverse(s), "h"), string.len(s))
  print(font)
end
   
function Casc()
  vim.o.guifont = "Cascadia Code,CaskaydiaCove Nerd Font,Apple Color Emoji:h15"
end


function Fira() 
  vim.o.guifont = "Fira Code,CaskaydiaCove Nerd Font,Apple Color Emoji:h15"
end


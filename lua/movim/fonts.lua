local function get_font()
  return vim.opt.guifont["_value"]
end

function UF(value)
  vim.opt.guifont = string.sub(get_font(), 1, -3) .. value
end


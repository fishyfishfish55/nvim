local function set_color(err, data)
  if string.find(data, "prefer-dark") then
    vim.opt.background = "dark"
  elseif string.find(data, "prefer-light") then
    vim.opt.background = "light"
  end
end

local function get_color()
  local result =  vim.system(
    {'gsettings', 'get org.gnome.desktop.interface color-scheme'}
  ):wait()
  return result
end

-- Get initial color
set_color('', get_color())

-- local cmd = vim.system(
--   {'gsettings', 'monitor org.gnome.desktop.interface'},
--   {stdout = set_color}
-- )


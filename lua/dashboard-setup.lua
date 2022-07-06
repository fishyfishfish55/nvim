local db = require('dashboard')
local home = os.getenv('HOME')
db.preview_file_height = 12
db.preview_file_width = 80
db.custom_header = {
	' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
	' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
	' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
	' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
	' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
	' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
	'',
	'',
	'',
	'',
	'',
	'',
}
db.custom_center = {
	{
		icon = '  ',
		desc = 'Load previous session                   ',
		shortcut = 'SPC s l',
		action ='SessionLoad'
	},
	{
		icon = 'ﱐ  ',
		desc = 'New File                                ',
		action =  'DashboardNewFile',
		shortcut = 'SPC f h'
	},
	{
		icon = '  ',
		desc = 'Find  File                              ',
		action = 'Telescope find_files',
		shortcut = 'SPC f f'
	},
	{
		icon = '  ',
		desc ='File Browser                            ',
		action =  'NvimTreeOpen',
		shortcut = 'SPC f b'
	},
	{
		icon = '  ',
		desc = 'Find  word                              ',
		action = 'Telescope live_grep',
		shortcut = 'SPC f w'
	},
	{
		icon = '  ',
		desc = 'Open Personal dotfiles                  ',
		action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
		shortcut = 'SPC f d'
	},
}

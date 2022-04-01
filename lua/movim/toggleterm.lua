local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end
toggleterm.setup({
	open_mapping = [[<c-\>]],
	shade_terminals = false,
	shading_factor = "1",
	direction = "horizontal",
	close_on_exit = true,
	shell = zsh,
	float_opts = {
		border = "curved",
		width = 100,
		height = 50,
	},
	higlights = {
		border = "#252526",
		background = "Normal",
	},
})

local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		mode = "buffers",
		numbers = "ordinal",
		right_mouse_command = "bd!",
		left_mouse_command = "buffer %d",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",

	},
})

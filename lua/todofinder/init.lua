local M = {}

function M.setup(opts)
	opts = opts or {}

	vim.keymap.set("n", "<Leader>p",
		function()
			print("Hello from todofinder!")
		end)
end

return M

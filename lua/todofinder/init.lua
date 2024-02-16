local M = {}

function Todo()
	local files = vim.cmd("grep TODO -lr * --exclude='node_modules/*'")
	print(files)
end

function M.setup()
	vim.api.nvim_create_user_command("TodoFinder", Todo, {})
	vim.api.nvim_create_user_command("QuitVim", function() vim.cmd("q") end, {})
end

return M

local M = {}

function Todo()
	print("TODO: implement")
	local files = vim.api.nvim_exec("grep TODO -lr *")
	print(files)
end

function M.setup()
	vim.api.nvim_create_user_command("TodoFinder", Todo, {})
	vim.api.nvim_create_user_command("QuitVim", function() vim.cmd("q") end, {})
end

return M

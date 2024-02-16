local M = {}

function Todo()
	local files = vim.fn.systemlist("grep TODO -lr *")

	if #files == 0 then
		print("No TODOs found")
		return
	end

	-- Open telescope with the files
	require('telescope.builtin').find_files({ cwd = vim.fn.getcwd(), prompt_title = "TODOs", find_command = { 'grep', '-rl', 'TODO', '.' } })
end

function M.setup()
	vim.api.nvim_create_user_command("TodoFinder", Todo, {})
	vim.api.nvim_create_user_command("QuitVim", function() vim.cmd("q") end, {})
end

return M

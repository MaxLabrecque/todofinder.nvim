local M = {}

function Todo()
	local reg = '[T-t][O-o][D-d][O-o]'
	local command = "grep " .. reg .. " -lr *"
	local files = vim.fn.systemlist(command)

	if #files == 0 then
		print("No TODOs found")
		return
	end

	-- Open telescope with the files
	require('telescope.builtin').find_files({ cwd = vim.fn.getcwd(), prompt_title = "TODOs", find_command = { 'grep', '-rl', reg, '.' } })

	-- Add to buffer list
	local buf_list = {}
	for _, file in ipairs(files) do
		local buf = vim.fn.bufadd(file)
		table.insert(buf_list, buf)
	end
end

function M.setup()
	vim.api.nvim_create_user_command("TodoFinder", Todo, {})
	vim.api.nvim_create_user_command("QuitVim", function() vim.cmd("q") end, {})
end

return M

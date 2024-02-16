local M = {}

function Todo()
	print("TODO: implement")
end

function M.setup()
	vim.api.nvim_create_user_command("FindTodo", Todo, {})
end

return M

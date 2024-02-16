local M = {}

function Todo()
    local files = vim.fn.systemlist("grep TODO -lr *")

    for _, file in ipairs(files) do
        print(file)
    end
end

function M.setup()
    vim.api.nvim_create_user_command("TodoFinder", Todo, {})
    vim.api.nvim_create_user_command("QuitVim", function() vim.cmd("q") end, {})
end

return M

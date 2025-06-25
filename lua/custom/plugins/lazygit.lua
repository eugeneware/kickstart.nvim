-- Enable Lazygit
return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", function()
            local file_dir = vim.fn.expand('%:p:h')
            -- Handle oil.nvim buffers
            if vim.startswith(file_dir, 'oil://') then
                file_dir = string.sub(file_dir, 7) -- Remove 'oil://' prefix
            end
            -- If no current file or empty path, use current working directory
            if file_dir == '' or file_dir == '.' then
                vim.cmd('LazyGit')
            else
                -- Change to the file's directory temporarily
                local original_cwd = vim.fn.getcwd()
                vim.cmd('cd ' .. vim.fn.fnameescape(file_dir))
                vim.cmd('LazyGit')
                -- Restore original directory
                vim.cmd('cd ' .. vim.fn.fnameescape(original_cwd))
            end
        end, desc = "LazyGit (current file's repo)" }
    }
}

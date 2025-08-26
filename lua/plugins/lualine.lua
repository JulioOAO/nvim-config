return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    options = { theme = 'catppuccin' },
    config = function()
        ---@diagnostic disable-next-line
        require('lualine').setup()
    end
}

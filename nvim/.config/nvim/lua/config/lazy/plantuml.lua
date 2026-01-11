return {
    "https://gitlab.com/itaranto/plantuml.nvim",
    config = function()
        require("plantuml").setup({
            renderer = {
                type = "imv",
                options = {
                    dark_mode = false,
                    format = nil,
                }
            },
            render_on_write = true
        })
    end
}

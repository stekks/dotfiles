-- Enable Comment.nvim 
return {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    opts = {
        mappings = {
            basic = true,
            extra = true,
        },
    }
}

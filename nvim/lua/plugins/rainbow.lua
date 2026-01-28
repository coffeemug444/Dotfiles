return {
   "junegunn/rainbow_parentheses.vim",
    config = function()
        vim.g["rainbow#max_level"] = 16
        vim.g["rainbow#pairs"] = {{'(', ')'}, {'[', ']'}, {'{', '}'}} 

        vim.cmd("RainbowParentheses")
    end
}

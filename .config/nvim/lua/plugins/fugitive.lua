return {
   "tpope/vim-fugitive",
   dependencies = { "shumphrey/fugitive-gitlab.vim" },
   config=function()
      vim.g.fugitive_gitlab_domains = { 'https://gitlab.taitradio.net' }
   end
}

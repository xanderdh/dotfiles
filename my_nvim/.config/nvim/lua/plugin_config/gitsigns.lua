return {
  signs = {
    delete = { text = "󰍵" },
    changedelete = { text = "󱕖" },
  },

  -- Ensure gitsigns refreshes after commits by watching the .git directory
  watch_gitdir = {
    interval = 1000, -- check for .git changes every 1s
    follow_files = true,
  },
}

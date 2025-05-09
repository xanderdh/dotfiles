local options = {
  sort_by = "case_sensitive",
  disable_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    width = 60,
    preserve_window_proportions = true,
  },
  renderer = {
    group_empty = true,
    root_folder_label = false,
    highlight_git = true,
    indent_markers = { enable = true },
    icons = {
      glyphs = {
        default = "󰈚",
        folder = {
          --default = "",
          --empty = "",
          --empty_open = "",
          --open = "",
          --symlink = "",
        },
        git = { unmerged = "" },
      },
    },
  },
  filters = { dotfiles = false },
}

require("nvim-tree").setup(options)

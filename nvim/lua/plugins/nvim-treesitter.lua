return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "lua",
        "python",
        "yaml",
    },
    auto_install = false,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
      disable = { "c", "cpp" }
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    require("competitest").setup({
      compile_command = {
        cpp = {
          exec = "clang++",
          args = {
            "-std=c++20",
            "-g",
            "-Wall",
            "-Wextra",
            "-fsanitize=address",
            "-fsanitize=undefined",
            "$(FNAME)",
            "-o",
            "$(FNOEXT)",
          },
        },
      },
    })
  end,
}

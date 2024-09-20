return {
  -- 安装 nvim-dap 和调试插件
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim", -- Mason 用于管理 DAP 服务器
      "rcarriga/nvim-dap-ui", -- DAP UI 用于调试界面
    },
    config = function()
      require("dapui").setup() -- 配置 DAP UI
    end,
  },
  -- 安装 C++ 的调试支持
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local dap = require("dap")
      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = "/home/sweet/.local/share/nvim/mason/packages/cpptools", -- 替换为 cpptools 可执行文件的路径
        options = {
          detached = false,
        },
      }
      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "cppdbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = false,
          setupCommands = {
            {
              text = "-enable-pretty-printing",
              description = "enable pretty printing",
              ignoreFailures = false,
            },
          },
        },
      }
      -- 键位绑定
      vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
    end,
  },
}

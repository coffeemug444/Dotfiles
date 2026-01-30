return {
   "mfussenegger/nvim-dap",
   dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
   },
   config = function()
      local dap = require "dap"
      local ui = require "dapui"

      ui.setup()

      dap.adapters.gdb = {
         type = "executable",
         command = "gdb",
         args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
      }

      dap.configurations.cpp = {
         {
            name = "Launch",
            type = "gdb",
            request = "launch",
            program = function()
               -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
               -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/main')
               return vim.fn.getcwd() .. "/build/main"
            end,
            args = {}, -- provide arguments if needed
            cwd = "${workspaceFolder}",
            stopAtBeginningOfMainSubprogram = true,
         }
      }

      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)
      vim.keymap.set("n", "<F1>", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)

      dap.listeners.before.attach.daptui_config = function ()
         ui.open()
      end
      dap.listeners.before.launch.daptui_config = function ()
         ui.open()
      end
      dap.listeners.before.event_terminated.daptui_config = function ()
         ui.close()
      end
      dap.listeners.before.event_exited.daptui_config = function ()
         ui.close()
      end
   end
}

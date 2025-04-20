local js_based_languages = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

-- ⚠️⚠️⚠️⚠️
-- ⚠️⚠️⚠️⚠️
-- MANUAL SETUP IS REQUIRED!!!
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#javascript
-- ⚠️⚠️⚠️⚠️
-- ⚠️⚠️⚠️⚠️

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      dependencies = {
        "nvim-neotest/nvim-nio",
      },
      config = true,
    },
    { "theHamsta/nvim-dap-virtual-text", config = true },
    -- JS debugger
    {
      "microsoft/vscode-js-debug",
      build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    },
    -- JS Chrome debugger
    {
      "Microsoft/vscode-chrome-debug",
      build = "npm install && npm run build",
    },
    -- PHP debugger
    {
      "xdebug/vscode-php-debug",
      build = "npm install && npm run build",
    },
    {
      "Weissle/persistent-breakpoints.nvim",
      config = function()
        require("persistent-breakpoints").setup({
          load_breakpoints_event = { "BufReadPost" },
        })
      end,
    },
  },
  config = function()
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
    vim.fn.sign_define("DapStopped", {
      text = "▶",
      texthl = "DiagnosticWarn", -- Icon color
      linehl = "DapStoppedLine", -- Line bg color (in combination with the above setting)
    })
    vim.fn.sign_define("DapBreakpoint", {
      text = "B",
      texthl = "DiagnosticHint",
      linehl = "",
      numhl = "",
    })
    vim.fn.sign_define("DapBreakpointCondition", {
      text = "C",
      texthl = "DiagnosticWarn",
      linehl = "",
      numhl = "",
    })
    vim.fn.sign_define("DapLogPoint", {
      text = "L",
      texthl = "DiagnosticInfo",
      linehl = "",
      numhl = "",
    })
    vim.fn.sign_define("DapBreakpointRejected", {
      text = "X",
      texthl = "DiagnosticError",
      linehl = "",
      numhl = "",
    })

    local dap = require("dap")

    dap.adapters["chrome"] = {
      type = "executable",
      command = "node",
      args = { vim.fn.stdpath("data") .. "/lazy/vscode-chrome-debug/out/src/chromeDebug.js", "${port}" },
    }
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = { vim.fn.stdpath("data") .. "/js-debug/src/dapDebugServer.js", "${port}" },
      },
    }
    dap.adapters["php"] = {
      type = "executable",
      command = "node",
      args = { vim.fn.stdpath("data") .. "/lazy/vscode-php-debug/out/phpDebug.js" },
    }

    for _, language in ipairs(js_based_languages) do
      dap.configurations[language] = {
        {
          name = "Attach to Chrome",
          type = "chrome",
          request = "attach",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}",
        },
        {
          name = "Launch file",
          type = "pwa-node",
          request = "launch",
          program = "${file}",
          cwd = "${workspaceFolder}",
          resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
        },
        {
          name = "Debug Vitest Current Test File",
          type = "pwa-node",
          request = "launch",
          autoAttachChildProcesses = true,
          skipFiles = { "<node_internals>/**", "**/node_modules/**" },
          program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
          args = { "run", "${relativeFile}", "--test-timeout=0", "--no-file-parallelism" },
          smartStep = true,
          console = "integratedTerminal",
        },
        {
          name = "Debug Jest Current Test File",
          type = "pwa-node",
          request = "launch",
          cwd = "${workspaceFolder}",
          runtimeArgs = {
            "--inspect-brk",
            "${workspaceFolder}/node_modules/jest/bin/jest.js",
            "--runInBand",
            "${relativeFile}",
          },
          resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
        {
          -- Jest: node --inspect ./node_modules/jest/bin/jest.js --runInBand --watchAll
          -- Vitest: node ./node_modules/vitest/vitest.mjs --inspect-brk --test-timeout=0 --no-file-parallelism
          name = "Attach Debugger to Jest/Vitest",
          type = "pwa-node",
          request = "attach",
          resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" }, -- Needed for jest
          port = 9229,
        },
        -- Maybe this is useful as an example at some point to combine launch and attach
        --   {
        --     type = "pwa-chrome",
        --     request = "launch",
        --     name = "Launch & Debug Chrome",
        --     url = function()
        --       local co = coroutine.running()
        --       return coroutine.create(function()
        --         vim.ui.input({
        --           prompt = "Enter URL: ",
        --           default = "http://localhost:3000",
        --         }, function(url)
        --           if url == nil or url == "" then
        --             return
        --           else
        --             coroutine.resume(co, url)
        --           end
        --         end)
        --       end)
        --     end,
        --     webRoot = vim.fn.getcwd(),
        --     protocol = "inspector",
        --     sourceMaps = true,
        --     userDataDir = false,
        --   },
      }
    end
    dap.configurations["php"] = {
      {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug",
        port = 9003,
      },
    }

    dap.set_log_level("DEBUG")
  end,
}

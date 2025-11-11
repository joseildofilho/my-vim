local jdtls           = vim.fn.expand '$MASON/packages/jdtls'
local jdtlsExecutable = jdtls .. '/jdtls'
local equinox         = jdtls .. '/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar'

local figet           = require 'fidget'

local lombok          = jdtls .. '/lombok.jar'
figet.notify(lombok, vim.log.levels.INFO)

local M = {}

function M:setup()
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  local workspace_dir = vim.fn.stdpath("data") ..
      package.config:sub(1, 1) .. "jdtls-workspace" .. package.config:sub(1, 1) .. project_name
  local os_name = vim.loop.os_uname().sysname
  local config = {
    cmd = {
      jdtlsExecutable,
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xmx1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",
      "-jar", equinox,
      "--jvm-arg=-javaagent:" .. lombok,
      "-configuration",
      jdtls .. "config_" .. (os_name == "Linux" and "linux" or "mac_arm"),
      "-data",
      workspace_dir,
    },

    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" }),

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {},

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
      bundles = {},
    },
  }
  -- This starts a new client & server,
  -- or attaches to an existing client & server depending on the `root_dir`.
  require("jdtls").start_or_attach(config)
end

return M

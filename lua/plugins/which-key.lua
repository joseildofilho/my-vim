--local fiveMinutesInMilli = 5 * 60000
--local fiveMinutesInSec = 5
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
--        local timer = vim.uv.new_timer()
--        timer:start(500, 500, vim.schedule_wrap(function()
--            local openBuffersAndLoaded = vim.fn.getbufinfo { bufloaded = 1 }
--            local idle = true
--            local now = os.time()
--            for _, buf in pairs(openBuffersAndLoaded) do
--                local lastTimeUsed = now - buf.lastused
--                if lastTimeUsed < fiveMinutesInSec then
--                    idle = false
--                    break
--                end
--            end
--
--            if idle then
--                require 'which-key'.show()
--            end
--        end))
    end
}

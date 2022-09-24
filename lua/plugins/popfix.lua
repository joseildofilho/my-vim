local Job = require'plenary.job'

local popfix = {}
local border_chars = {
    TOP_LEFT = '╭',
    TOP_RIGHT = '╮',
    MID_HORIZONTAL = '─',
    MID_VERTICAL = '│',
    BOTTOM_LEFT = '╰',
    BOTTOM_RIGHT = '╯',
}

function popfix.select_services()
    local job = Job:new({
        command = 'kubectl',
        args = {'get', 'pod'}
    })

    job:sync(20000)

    local services 
    local hasErrors = job:stderr_result()[1] ~= Nil
    
    if hasErrors then
        print('Não foi possivel carregar os serviços')
        services = sso_login()
    else
        services = job:result()
    end

    if services ~= Nil and services[1] ~= Nil then
        local opts = build_opts(vim.list_slice(services, 2))
        local popfix = require'popfix':new(opts)
    else
        print('Não foi possivel carregar os serviços')
    end
end

function sso_login()
    local job = Job:new({
        command = 'aws',
        args = {'sso', 'login', '--profile', 'SANDBOX-ENG'}
    })

    job:sync(120000)

    local services = job:result()
    local hasErrors = job:stderr_result()[1] ~= Nil
    print(vim.inspect(job:stderr_result()))

    if hasErrors then
        print('não foi possivel fazer o login')
        return Nil
    end
    return services
end

function build_opts(data)
    local function close_callback(index, line)
        local serviceName = vim.split(line, ' ')
        print(serviceName[1])
        vim.cmd('vsp | terminal kubectl logs -f ' .. serviceName[1])
    end
    return {
       height = 40,
       width = 120,
       mode = 'editor',
       close_on_bufleave = true,
       data = data, -- Read below how to provide this.
       keymaps = {
          i = {
            ['<C-c>'] = function(popup)
               popup:close()
            end,
            ['<Enter>'] = function(popup)
               popup:close()
            end
          },
          n = {
            ['<Cr>'] = function(popup)
               popup:close()
            end
          }
       },
       callbacks = {
          close = close_callback -- automatically calls it when window closes.
       },
       list = {
          border = true,
          numbering = true,
          title = 'NAME---READY---STATUS---RESTARTS---AGE',
          border_chars = border_chars,
          highlight = 'Normal',
          selection_highlight = 'Visual',
          matching_highlight = 'Identifier',
       },
       prompt = {
        border = true,
        numbering = true,
        title = 'Services',
        border_chars = border_chars,
        highlight = 'Normal',
        prompt_highlight = 'Normal'
       }
    }
end


return popfix

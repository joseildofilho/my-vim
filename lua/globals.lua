function P(opts)
    print(vim.inspect(opts))
end

function FORCE_RELOAD(name)
    package.loaded[name] = nil
    return require(name)
end

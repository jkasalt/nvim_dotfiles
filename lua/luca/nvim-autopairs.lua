local npairs_status, npairs = pcall(require, "nvim-autopairs")

if not npairs_status then
    return
end

npairs.setup({
    check_ts = true,
    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.]",
})

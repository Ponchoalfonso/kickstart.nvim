pickers = {
  custom_find_files = function(opts, no_ignore)
    opts = opts or {}
    no_ignore = vim.F.if_nil(no_ignore, false)
    opts.attach_mappings = function(_, map)
      map({ 'n', 'i' }, '<C-h>', function(prompt_bufnr)
        local prompt = require('telescope.actions.state').get_current_line()
        require('telescope.actions').close(prompt_bufnr)
        no_ignore = not no_ignore
        pickers.custom_find_files({ default_text = prompt }, no_ignore)
      end)
      return true
    end

    if no_ignore then
      opts.no_ignore = true
      opts.hidden = true
      opts.prompt_title = 'Find Files <ALL>'
      require('telescope.builtin').find_files(opts)
    else
      opts.prompt_title = 'Find Files'
      require('telescope.builtin').find_files(opts)
    end
  end,
}

return pickers

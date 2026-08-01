return {
  'sindrets/diffview.nvim',
  opts = {
    enhanced_diff_hl = true,
  },
  keys = {
    {
      '|', -- Shift+\\ on a US keyboard
      function()
        if require('diffview.lib').get_current_view() then
          vim.cmd 'DiffviewClose'
        else
          vim.cmd 'DiffviewOpen'
        end
      end,
      desc = 'Toggle Diffview',
    },
  },
}

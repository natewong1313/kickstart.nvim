return {
  'onsails/lspkind.nvim',
  dependencies = {
    'mortepau/codicons.nvim',
  },
  event = 'InsertEnter',
  config = function()
    require('lspkind').init {
      preset = 'codicons',
    }
  end,
}

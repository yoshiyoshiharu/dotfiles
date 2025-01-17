return {
  "yoshiyoshiharu/minitest.nvim",
  event = { "VeryLazy" },
  config = function()
    require('minitest').setup(
      { command = 'docker compose exec web rails test' }
    )
  end
}

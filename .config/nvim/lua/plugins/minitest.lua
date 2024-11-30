return {
  "yoshiyoshiharu/minitest.nvim",
  config = function()
    require('minitest').setup(
      { command = 'docker compose exec web rails test' }
    )
  end
}

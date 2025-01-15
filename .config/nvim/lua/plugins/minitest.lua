return {
  "yoshiyoshiharu/minitest.nvim",
  cmd = { "Minitest" },
  config = function()
    require('minitest').setup(
      { command = 'docker compose exec web rails test' }
    )
  end
}

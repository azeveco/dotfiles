-- return {
--   "github/copilot.vim",
--   enabled = false,
-- }

return {
  "github/copilot.vim",
  branch = "release",
  event = "VeryLazy",
  dependencies = { "giuxtaposition/blink-cmp-copilot" },
}

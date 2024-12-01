-- Show number of usages of a function
return {
  'Wansmer/symbol-usage.nvim',
  event = 'LspAttach',
  opts = {
    vt_position = "end_of_line",
  }
}

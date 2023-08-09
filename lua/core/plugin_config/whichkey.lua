local  whichkey= require("which-key")
local conf = {
  window = {
	  border = "single",
	  position = "bottom"
  }
}

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local mappings = {
}

whichkey.setup(conf)
whichkey.register(mappings,opts)

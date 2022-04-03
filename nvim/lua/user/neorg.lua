require('neorg').setup {
  -- Tell Neorg what modules to load
  load = {
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.norg.concealer"] = {}, -- Allows for use of icons
    ["core.norg.dirman"] = { -- Manage your directories with Neorg
      config = {
        workspaces = {
          atlassian = "~/Documents/neorg/atlassian",
        },
       -- Automatically detect whenever we have entered a subdirectory of a workspace
        autodetect = true,
        -- Automatically change the directory to the root of the workspace every time 
        autochdir = true,
      }
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp" -- We current support nvim-compe and nvim-cmp only
      }
    },
  },
}

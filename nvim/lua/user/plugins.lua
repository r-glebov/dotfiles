local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "54b2e3d58f567983feabaeb9408eccf6b7f32206" } -- Useful lua functions used ny lots of plugins
  use { "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    commit = "8aeb7ad5dc55f8532578211e749261e491b116e9",
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    commit = "d3aad43b3fcf707052f7dd8a7c7072fa69773f3c",
    requires = { { "nvim-lua/plenary.nvim" } },
  }
  use { "natecraddock/telescope-zf-native.nvim", commit = "3f64df2cb1e8c4a399154b21dabb2734a1afb8f1" }

  -- LSP
  use { "neovim/nvim-lspconfig", commit = "2a455c148341c4faf2dd60401397fed35d084c59" } -- enable LSP
  use { "williamboman/nvim-lsp-installer", commit = "f5f6538984b5bc9bccfc544960e05d47304f3c5e" } -- simple to use language server installer
  use { "folke/lua-dev.nvim", commit = "f5c31936fe06fcbeb59b98f69f74f9c2f91abaec" }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    cmd = "TroubleToggle",
    commit = "da61737d860ddc12f78e638152834487eabf0ee5",
  }

  -- Colorschemes
  use { "catppuccin/nvim", as = "catppuccin", commit = "6abbe9e731a8f4121ce0208d489009c8dd696960" }

  -- Autocompletion (cmp plugins)
  use { "hrsh7th/nvim-cmp", commit = "033a817ced907c8bcdcbe3355d7ea67446264f4b" }
  use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
  use { "hrsh7th/cmp-buffer", commit = "12463cfcd9b14052f9effccbf1d84caa7a2d57f0" } -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions

  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "27aeb2e715c32cbb99aa0b326b31739464b61644" }
  use { "sindrets/diffview.nvim", commit = "3ffe4a70c4b434ee933cb869b1706632c4407495" }
  use { "tpope/vim-fugitive", commit = "5920f807f5a52957a6a09dd36aab1c00bfd85455" }

  -- Icons
  use { "kyazdani42/nvim-web-devicons", commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" }

  -- Tree
  use { "kyazdani42/nvim-tree.lua", commit = "b0d27c09b6c923740f7c43d8b01bc69762369592" }

  -- Quickfix
  use { "kevinhwang91/nvim-bqf", commit = "0cc539c52e51d32d8febf1f04c5e7ed5353fead2" }


  -- Undo
  use { "mbbill/undotree", commit = "08e259be24d4476c1ee745dc735eefd44f90efdc" }

  -- Database
  use { "tpope/vim-dadbod", commit = "c2495b008f1adce6d21745b2c4c576eecc985959" }
  use { "kristijanhusak/vim-dadbod-ui", commit = "7bd114b88da4bf8115bd85d70fb531e4b6d72eb7" }

  -- Status Line
  use { "nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" }

  -- Testing
  use { "vim-test/vim-test", commit = "9bd4cd2d772018087d016fa4d35c45c09f13effd" }
  use { "ThePrimeagen/harpoon", commit = "d3d3d22b6207f46f8ca64946f4d781e975aec0fc" }

  -- Dashboard
  use { "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" }

  -- Utilities
  use { "ojroques/vim-oscyank", commit = "360ccdc01b18cd434588c34e15e5ea382b436de8" }
  use { "christianchiarulli/hop.nvim", commit = "b93ed4cea9c7df625d04e41cb15370b5c43cb578" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" }
  use { "AndrewRadev/splitjoin.vim", commit = "4df2b1f4bdaaa3526ff714f5dddb63015a13c511" }
  use { "AndrewRadev/sideways.vim", commit = "ab20cc8a6a7cb95679f99bc4ec724544f9b94c62" }
  use { "AndrewRadev/switch.vim", commit = "900c5d3ee79b1771c5e07bf7290068ea35881756" }
  use { "AndrewRadev/tagalong.vim", commit = "7b8cf57d8b5cbf5ece29e8198e72e8db39d9fe26" }
  use { "andymass/vim-matchup", commit = "976ebfe61b407d0a75d87b4a507bf9ae4ffffbaa" }
  use { "tpope/vim-projectionist", commit = "d4aee3035699b82b3789cee0e88dad0e38c423ab" }
  use { "ray-x/guihua.lua", commit = "f1a52d5faad9d472ee3f30ab08294177ce6a6d41" }
  use { "ray-x/sad.nvim", commit = "3f7f7af8df32136180b39db804d6d1e090996ecf" }
  use { "nvim-neorg/neorg", commit = "535fca8fd422fdedd686825d1f59a4e40e00259e" }
  use { "kkharji/sqlite.lua", commit = "9ccd2a6538d8a201d1ea08784bd866950e1b4130" }
  use {
    "AckslD/nvim-neoclip.lua",
    commit = "5520ad7b24b0c4bc0b5371eef2492e787aa59a3a",
    requires = {
      {'kkharji/sqlite.lua', module = 'sqlite'},
    },
  }
  use { "numToStr/Comment.nvim", commit = "bdf9ca64dcf4cc3c411aaeee4cfba59398d02aa8" }

  -- Snippets
  use { "L3MON4D3/LuaSnip", commit = "52f4aed58db32a3a03211d31d2b12c0495c45580" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "974d79269a5a7f63e973db6a51b081a45750d026" } -- a bunch of snippets to use

  -- Plugin Graveyard

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

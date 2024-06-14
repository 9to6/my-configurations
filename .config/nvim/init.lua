local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

vim.cmd [[
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2
set clipboard=unnamed
let mapleader=","
let maplocalleader=","

"noremap <F3> :Autoformat<CR>
map <silent> <F10> :TagbarToggle<CR>

" NVIM Tree
nnoremap <leader>n :NvimTreeFocus<CR>
nnoremap <leader>t :NvimTreeToggle<CR>
nnoremap <C-n> :NvimTreeFindFile<CR>
"nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-W>. :vertical resize +5<CR>
nnoremap <C-W>, :vertical resize -5<CR>

" Make `jj` and `jk` throw you into normal mode
inoremap jj <esc>
inoremap jk <esc>

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>
" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

vnoremap <Leader>r y:%s/<C-r><C-r>"//g<Left><Left>

" Copy file path to clipboard
nnoremap <leader>cF :let @*=expand("%:p")<CR>
nnoremap <leader>ch :let @*=expand("%:p:h")<CR>
" makrdown preview
nmap <C-p> <Plug>MarkdownPreviewToggle

" Tab shortcut
nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>
xnoremap <Leader>a w !pbcopy<CR>

" FZF
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)
nnoremap <Leader>z :FzfLua grep<CR>
nnoremap <Leader>b :Buffers<CR>

]]

require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = {
      actions = {
        open_file = {
          resize_window = false,
          quit_on_open = true
        }
      }
    },
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
  },
  "tpope/vim-commentary",
  "tpope/vim-fugitive",
  "neovim/nvim-lspconfig",
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
      })
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
    opts = {},
  },
  { "catppuccin/nvim", lazy = false, name = "catppuccin-mocha", priority = 9900 },
})

-- Language server configurations
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

local lspconfig = require('lspconfig')
-- Python
-- npm install -g pyright
lspconfig.pyright.setup {}
-- javascript
-- npm install -g typescript typescript-language-server
lspconfig.tsserver.setup{}
-- Terraform
-- https://github.com/hashicorp/terraform-ls/blob/main/docs/installation.md
lspconfig.terraformls.setup{}
-- C/C++
-- brew install llvm
lspconfig.clangd.setup{}

-- Ruby
-- gem install --user-install solargraph
lspconfig.solargraph.setup{}

-- golang
local util = require('lspconfig/util')
local lastRootPath = nil
local gopath = os.getenv("GOPATH")
if gopath == nil then
  gopath = ""
end
local gopathmod = gopath..'/pkg/mod'
lspconfig.gopls.setup {
  root_dir = function(fname)
    local fullpath = vim.fn.expand(fname, ':p')
    if string.find(fullpath, gopathmod) and lastRootPath ~= nil then
        return lastRootPath
    end
    lastRootPath = util.root_pattern("go.mod", ".git")(fname)
    return lastRootPath
  end,
}

-- Java
-- brew install jdtls
-- mkdir -p ~/.local/share/nvim/lsp_servers/jdtls
-- cd ~/.local/share/nvim/lsp_servers/jdtls
-- curl -LO https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz
-- tar -xvzf jdt-language-server-latest.tar.gz
lspconfig.jdtls.setup{}

vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end,
})


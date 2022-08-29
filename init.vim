set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc
lua << EOF
  require("nvim-tree").setup({
    actions = {
      open_file = {
        resize_window = false,
        quit_on_open = true
      }
    }
  })
EOF

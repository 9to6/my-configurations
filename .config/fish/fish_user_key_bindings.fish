function fish_user_key_bindings
  for mode in insert default visual
      bind -M $mode \cf forward-char
      bind -M $mode \cp up-or-search
      bind -M insert jk "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
  end

  fzf_key_bindings
end


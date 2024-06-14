function hubpr
  # set reviewer Krustuniverse-Klaytn-Group/klaytn-devops
  set reviewer odg0318,iv0rish
  hub pull-request $argv -p -b main -a 9to6 -r $reviewer -F - --edit < PULL_REQUEST_TEMPLATE.md 
end

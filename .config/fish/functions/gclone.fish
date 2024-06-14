function gclone
  git clone https://oauth2:$GITLAB_TOKEN@(echo $argv | awk '{sub("https://", ""); sub(".git", ""); print $0}')
end


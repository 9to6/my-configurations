function ecsssh2
  set task_id "$argv[1]"
  set container_name "$argv[2]"
  set env dev
  set app_code wjoon
  
  if string match -r 'dev' $task_id
    set env dev
  else if string match -r 'stg' $task_id
    set env stg
  else if string match -r 'prd' $task_id
    set env prd
  end

  if string match -r 'wjoon' $task_id
    set app_code wjoon
  else if string match -r 'ski' $task_id
    set app_code ski
  end

  switch $task_id
  case "*dev*" 
    set env dev
  case '*stg*'
    set env stg
  case '*prd*'
    set env prd
  end

  # set -x FZF_DEFAULT_OPTS '--preview "jq -c {}" -m --height 40% --layout=reverse --border --ansi'
  aws ecs execute-command --cluster cz-$env-$app_code \
    --task $task_id \
    --container $container_name \
    --interactive \
    --command "/bin/bash" 
end

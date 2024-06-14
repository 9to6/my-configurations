function ecsssh
  set task_id "$argv[1]"
  set container_name "$argv[2]"
  set env dev
  
  if string match -q "dev" $task_id
    set env dev
  else if string match -q "stg" $task_id
    set env stg
  else if string match -q "prd" $task_id
    set env prd
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
  aws ecs execute-command --cluster lhp-$env-ecs-cluster-cazzle \
    --task $task_id \
    --container $container_name \
    --interactive \
    --command "/bin/bash" 
end

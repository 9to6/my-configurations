function ssm
  # set -x FZF_DEFAULT_OPTS '--preview "jq -c {}" -m --height 40% --layout=reverse --border --ansi'
  set results (aws $argv ec2 describe-instances | jq -c '.[][].Instances[]')
  set selected (echo $results | jq -c 'select(contains({Tags: [{Key: "Name"} ]})) | { instanceId: .InstanceId, name: .Tags[] |select(.Key == "Name")| .Value }' | fzf -i)
  set selectedInstanceId (echo $selected | jq -r .instanceId)
  echo target: $selectedInstanceId
  set instanceId (echo $results | jq --arg v $selectedInstanceId -r '. | select(.InstanceId == $v) | .InstanceId')
  aws  $argv ssm start-session --target $instanceId
end

# function ssm
#   set instanceId (aws ec2 describe-instances | jq -c '.[][].Instances[] | select(contains({Tags: [{Key: "Name"} ]}))' | fzf -i | jq -r .InstanceId)
#   echo $instanceId
#   aws ssm start-session --target $instanceId
# end

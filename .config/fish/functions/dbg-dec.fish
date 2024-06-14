function dbg-dec
  echo $argv[1]
  curl --get --data-urlencode "text=$argv[1]" \
    http://lhp-dev-ecs-common-api.lottehealthcareplatform.internal:19080/common-api/v1/common/db-guard/decrypt
end


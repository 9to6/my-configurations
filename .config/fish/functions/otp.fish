function otp
  set tmp (pass otp $argv) 
  echo $tmp
  echo $tmp | tr -d '\n' | pbcopy
end

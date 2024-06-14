function tarx
  # set filename_without_ext (string sub -r "\.[^.]*\$" $argv[1])
  echo $filename_without_ext
  set filename_without_ext (basename $argv[1]| cut -f 1 -d '.')

  mkdir $filename_without_ext
  tar -C ./$filename_without_ext -xf $argv[1]
end


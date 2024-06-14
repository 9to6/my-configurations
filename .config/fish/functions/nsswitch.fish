function nsswitch
  if grep -q "8.8.8.8" /etc/resolv.conf
    networksetup -setdnsservers Wi-Fi 10.230.230.10 10.230.230.20 168.126.63.1
  else
    networksetup -setdnsservers Wi-Fi 8.8.8.8
  end
end

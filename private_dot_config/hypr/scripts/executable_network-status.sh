
#!/usr/bin/zsh

ip route | grep default | awk '{print $5}'


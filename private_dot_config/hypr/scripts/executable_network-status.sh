
#!/usr/bin/zsh

ADAPTER=$(ip route | grep default | awk '{print $5}')
if [[ $ADAPTER == w* ]]; then
	LEVEL=$(nmcli -f IN-USE,SIGNAL device wifi list | grep '*' | awk '{print $2}')

	ICON='<span>󰤮 </span>'

	if [ -n "<span>$LEVEL</span>" ]; then
         if [ "<span>$LEVEL</span>" -ge 80 ]; then
            ICON='<span>󰤨 </span>' # Strong
         elif [ '<span>$LEVEL</span>' -ge 60 ]; then
            ICON='<span>󰤥 </span>' # Good
         elif [ '<span>$LEVEL</span>' -ge 40 ]; then
            ICON='<span>󰤢 </span>' # Fair
          elif [ '<span>$LEVEL</span>' -ge 20 ]; then
            ICON='<span>󰤟 </span>' # Weak
          else
            ICON='<span>󰤯 </span>' # Very Weak
          fi
	fi
	echo $ICON
else
	echo '<span>󰈀 </span>'
fi

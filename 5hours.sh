wget -O ng.sh https://github.com/kmille36/Docker-Ubuntu-Desktop-NoMachine/raw/main/ngrok.sh > /dev/null 2>&1
chmod +x ng.sh
./ng.sh

function goto {
    label=$1
    cd
    cmd=$(sed -n "/^:[[:blank:]][[:blank:]]*${label}/{:a;n;p;ba};" $0 |
          grep -v ':$')
    eval "$cmd"
    exit
}

: ngrok
clear

./ngrok config add-authtoken 2jzNpyc9c6DspipEJcmaisBwzkF_drLdqmP9ZqFjWerE2xm5
clear

./ngrok http 6900 &>/dev/null &
sleep 1

if curl --silent --show-error http://127.0.0.1:4040/api/tunnels > /dev/null 2>&1; then 
    echo "Ngrok is running..."
else 
    echo "Ngrok Error! Please try again!" 
    sleep 1 
    goto ngrok
fi
docker run --rm -d --network host --privileged --name nomachine-xfce4 -e PASSWORD=123456 -e USER=user --cap-add=SYS_PTRACE --shm-size=0.1g

clear
echo "NoMachine: https://www.nomachine.com/download"
echo "Done! NoMachine Information:"
echo "IP Address:"
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | jq -r '.tunnels[] | select(.proto == "http") | .public_url'

echo "User: user"
echo "Password: 123456"
echo "VM can't connect? Restart Cloud Shell then Re-run script."

seq 1 18540 | while read i; do 
    echo -en "\r Running .     $i s /18540 s"; sleep 0.1
    echo -en "\r Running ..    $i s /18540 s"; sleep 0.1
    echo -en "\r Running ...   $i s /18540 s"; sleep 0.1
    echo -en "\r Running ....  $i s /18540 s"; sleep 0.1
    echo -en "\r Running ..... $i s /18540 s"; sleep 0.1
    echo -en "\r Running     . $i s /18540 s"; sleep 0.1
    echo -en "\r Running  .... $i s /18540 s"; sleep 0.1
    echo -en "\r Running   ... $i s /18540 s"; sleep 0.1
    echo -en "\r Running    .. $i s /18540 s"; sleep 0.1
    echo -en "\r Running     . $i s /18540 s"; sleep 0.1
done

gh codespace stop

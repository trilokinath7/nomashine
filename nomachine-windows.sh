#!/bin/bash

# Set Ngrok authentication token
CRP="2caHuM4JxiJCMEQj8yzgt5ldOFC_2PfmayJjwDRoLneCiA9EB"
./ngrok config add-authtoken $CRP

# Set Ngrok region (us in this case)
CRP="us"
./ngrok tcp --region $CRP 4000 &>/dev/null &

sleep 1
if curl --silent --show-error http://127.0.0.1:4040/api/tunnels  > /dev/null 2>&1; then 
    echo OK
else
    echo "Ngrok Error! Please try again!" && sleep 1 && goto ngrok
fi

docker run --rm -d --network host --privileged --name nomachine-xfce4 \
    -e PASSWORD=123456 -e USER=user --cap-add=SYS_PTRACE --shm-size=8g \
    ashu930559/nomachine-ubuntu-desktop:g

clear
echo "NoMachine: https://www.nomachine.com/download"
echo Done! NoMachine Information:
echo IP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo User: user
echo Passwd: 123456
echo "VM can't connect? Restart Cloud Shell then Re-run script."

# Long running progress bar (optional)
seq 1 72500000000000 | while read i; do 
    echo -en "\r Running .     $i s /72500000000000 s"; sleep 0.1
    echo -en "\r Running ..    $i s /72500000000000 s"; sleep 0.1
    echo -en "\r Running ...   $i s /72500000000000 s"; sleep 0.1
    echo -en "\r Running ....  $i s /72500000000000 s"; sleep 0.1
    echo -en "\r Running ..... $i s /72500000000000 s"; sleep 0.1
    echo -en "\r Running     . $i s /72500000000000 s"; sleep 0.1
    echo -en "\r Running  .... $i s /72500000000000 s"; sleep 0.1
    echo -en "\r Running   ... $i s /72500000000000 s"; sleep 0.1
    echo -en "\r Running    .. $i s /72500000000000 s"; sleep 0.1
    echo -en "\r Running     . $i s /72500000000000 s"; sleep 0.1
done

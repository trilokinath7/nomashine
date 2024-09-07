#!/bin/bash
stty intr ""
stty quit ""
stty susp undef

clear
rm -rf ngrok ngrok.zip ng.sh > /dev/null 2>&1
echo "======================="
echo "Downloading ngrok..."
echo "======================="
wget -O ngrok.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
tar -xvzf ngrok.tgz > /dev/null 2>&1



function goto
{
    label=$1
    cd 
    cmd=$(sed -n "/^:[[:blank:]][[:blank:]]*${label}/{:a;n;p;ba};" $0 | 
          grep -v ':$')
    eval "$cmd"
    exit
}

: ngrok
clear
echo "Go to: https://dashboard.ngrok.com/get-started/your-authtoken"

./ngrok config add-authtoken 2jzNpyc9c6DspipEJcmaisBwzkF_drLdqmP9ZqFjWerE2xm5 
clear
echo "Repo: https://github.com/kmille36/Docker-Ubuntu-Desktop-NoMachine"
echo "======================="
echo "choose ngrok region (for better connection)."
echo "======================="
echo "us - United States (Ohio)"
echo "eu - Europe (Frankfurt)"
echo "ap - Asia/Pacific (Singapore)"
echo "au - Australia (Sydney)"
echo "sa - South America (Sao Paulo)"
echo "jp - Japan (Tokyo)"
echo "in - India (Mumbai)"
read -p "choose ngrok region: " CRP
./ngrok http --region $CRP 6900 &>/dev/null &
sleep 3
if curl --silent --show-error http://127.0.0.1:4040/api/tunnels  > /dev/null 2>&1; then echo OK; else echo "Ngrok Error! Please try again!" && sleep 1 && goto ngrok; fi
clear
# Extract the public URL and make it clickable
echo "IP Address:"
public_url=$(curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*"public_url":"(https:\/\/[^"]*).*/\1/p')
echo "Public URL: $public_url"

seq 1 600 | while read i; do 
    echo -en "\r Running .     $i s /600 s"; sleep 0.1
    echo -en "\r Running ..    $i s /600 s"; sleep 0.1
    echo -en "\r Running ...   $i s /600 s"; sleep 0.1
    echo -en "\r Running ....  $i s /600 s"; sleep 0.1
    echo -en "\r Running ..... $i s /600 s"; sleep 0.1
    echo -en "\r Running     . $i s /600 s"; sleep 0.1
    echo -en "\r Running  .... $i s /600 s"; sleep 0.1
    echo -en "\r Running   ... $i s /600 s"; sleep 0.1
    echo -en "\r Running    .. $i s /600 s"; sleep 0.1
    echo -en "\r Running     . $i s /600 s"; sleep 0.1
done
pkill ngrok


seq 1 18300 | while read i; do 
    echo -en "\r Running .     $i s /18300 s"; sleep 0.1
    echo -en "\r Running ..    $i s /18300 s"; sleep 0.1
    echo -en "\r Running ...   $i s /18300 s"; sleep 0.1
    echo -en "\r Running ....  $i s /18300 s"; sleep 0.1
    echo -en "\r Running ..... $i s /18300 s"; sleep 0.1
    echo -en "\r Running     . $i s /18300 s"; sleep 0.1
    echo -en "\r Running  .... $i s /18300 s"; sleep 0.1
    echo -en "\r Running   ... $i s /18300 s"; sleep 0.1
    echo -en "\r Running    .. $i s /18300 s"; sleep 0.1
    echo -en "\r Running     . $i s /18300 s"; sleep 0.1
done

gh codespace stop

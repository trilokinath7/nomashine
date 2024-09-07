wget -O ng.sh https://github.com/kmille36/Docker-Ubuntu-Desktop-NoMachine/raw/main/ngrok.sh > /dev/null 2>&1
chmod +x ng.sh
./ng.sh


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
read -p "Paste Ngrok Authtoken: " CRP
./ngrok config add-authtoken $CRP
clear
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
./ngrok tcp --region $CRP 4000 &>/dev/null &
sleep 2
if curl --silent --show-error http://127.0.0.1:4040/api/tunnels  > /dev/null 2>&1; then echo OK; else echo "Ngrok Error! Please try again!" && sleep 1 && goto ngrok; fi
docker logs nomashine
clear

curl ifconfig.me
echo
echo

public_url=$(curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p')
echo "Public URL: $public_url"
echo
echo
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
clear

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

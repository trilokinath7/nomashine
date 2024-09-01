seq 1 18540 | while read i; do echo -en "\r Running .     $i s /18540 s";sleep 0.1;echo -en "\r Running ..    $i s /18540 s";sleep 0.1;echo -en "\r Running ...   $i s /18540 s";sleep 0.1;echo -en "\r Running ....  $i s /18540 s";sleep 0.1;echo -en "\r Running ..... $i s /18540 s";sleep 0.1;echo -en "\r Running     . $i s /18540 s";sleep 0.1;echo -en "\r Running  .... $i s /18540 s";sleep 0.1;echo -en "\r Running   ... $i s /18540 s";sleep 0.1;echo -en "\r Running    .. $i s /18540 s";sleep 0.1;echo -en "\r Running     . $i s /18540 s";sleep 0.1; done

gh codespace stop

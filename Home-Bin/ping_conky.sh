#!/bin/sh
    echo -e "\${color}Routers -----------------------------------------------------------------------------------------------\n"
#  echo -e "\n"

#Module1
if ping -c 1 -W 2 192.168.254.254 > /dev/null; then 

    echo "\${color white}Frontier_Gateway_Router 00: \${alignr}\${color green}Ping Success It's Up!\${color}"

else 

    echo "\${color orange}Frontier_Gateway_Router 00: \${alignr}\${color red}Ping Failed It's Down!\${color}"
fi

#Module2
if ping -c 1 -W 2 10.28.93.251 > /dev/null; then 

    echo "\${color white}Bruce_TPL_Router 01: \${alignr}\${color green}Ping Success It's Up!\${color}"

else 

    echo "\${color orange}Bruce_TPL_Router 01: \${alignr}\${color red}Ping Failed It's Down!\${color}"
fi

#Module3
if ping -c 1 -W 2 10.28.93.252 > /dev/null; then 

    echo "\${color white}Wolf359_LSys_E2500_Router 02: \${alignr}\${color green}Ping Success It's Up!\${color}"

else 

    echo "\${color orange}Wolf359_LSys_E2500_Router 02: \${alignr}\${color red}Ping Failed It's Down!\${color}"
fi

#Module4
if ping -c 1 -W 2 10.28.93.253 > /dev/null; then 

    echo "\${color white}Starfleet_LSys_WRT54GS_Router 03: \${alignr}\${color green}Ping Success It's Up!\${color}"

else 

    echo "\${color orange}Starfleet_LSys_WRT54GS_Router 03: \${alignr}\${color red}Ping Failed It's Down!\${color}"
fi

#Module5
#if ping -c 1 -W 2 192.168.0.5 > /dev/null; then 

#    echo "\${color white}Debbie_Puter_192.168.0.5: \${alignr}\${color green}Ping Success It's Up!\${color}"

#else 

#    echo "\${color orange}Debbie_Puter_192.168.0.5: \${alignr}\${color red}Ping Failed It's Down!\${color}"
#fi
# printf '\033[31m[**>ERROR<**]\033[0m\n'

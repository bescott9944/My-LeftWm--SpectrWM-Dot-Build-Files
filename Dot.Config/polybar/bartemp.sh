#!/bin/bash
## My TEMP settings for Polybar 03/06/2021

#TEMP="$(sensors|awk 'BEGIN{i=0;t=0;b=0}/id [0-9]/{b=$4};/Core/{++i;t+=$3}END{if(i>0){printf("%0.1f\n",t/i)}else{sub(/[^0-9.]/,"",b);print b}}')"
#printf "%s %s \\n" "$TEMP"

TEMP2="$(sensors -f k10temp-pci-00c3 | grep 'temp1:' | awk '{print $2}')"
printf "%s %s \\n" "$TEMP2"

#radeon-pci-0100
#Adapter: PCI adapter
#temp1:       +160.7°F  (crit = +248.0°F, hyst = +194.0°F)
#
#fam15h_power-pci-00c4
#Adapter: PCI adapter
#power1:       96.00 W  (crit =  94.99 W)
#
#k10temp-pci-00c3
#Adapter: PCI adapter
#temp1:       +148.5°F  (high = +158.0°F)
#                       (crit = +158.0°F, hyst = +152.6°F)

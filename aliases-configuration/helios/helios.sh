#!/bin/sh

alias helios-ups-online="cat /sys/class/power_supply/gpio-charger/online"
alias helios-ups-status="cat /sys/class/power_supply/gpio-charger/status"
alias helios-ups-level='scale=0;echo "`cat /sys/bus/iio/devices/iio:device0/in_voltage2_raw` * `cat /sys/bus/iio/devices/iio:device0/in_voltage_scale`/1" | bc'

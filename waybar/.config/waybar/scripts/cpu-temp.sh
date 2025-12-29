#!/bin/bash

HWMON_PATH=$(grep -l "k10temp" /sys/class/hwmon/hwmon*/name | head -1)
echo $HWMON_PATH

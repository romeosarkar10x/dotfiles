#!/bin/bash
# AMD GPU load, temperature and VRAM for waybar (custom/gpu, return-type json).

dev=""
for card in /sys/class/drm/card*/device; do
    [[ -r $card/gpu_busy_percent ]] && { dev=$card; break; }
done
[[ -z $dev ]] && { echo '{"text": "n/a", "class": "missing"}'; exit 0; }

busy=$(<"$dev/gpu_busy_percent")
temp=$(( $(cat "$dev"/hwmon/hwmon*/temp1_input) / 1000 ))
used=$(( $(<"$dev/mem_info_vram_used") / 1048576 ))
total=$(( $(<"$dev/mem_info_vram_total") / 1048576 ))

class=normal
(( busy >= 90 || temp >= 85 )) && class=critical
[[ $class == normal ]] && (( busy >= 60 )) && class=warning

printf '{"text": "%d%% %d°", "tooltip": "GPU load %d%%\\nEdge temp %d°C\\nVRAM %d / %d MiB", "class": "%s"}\n' \
    "$busy" "$temp" "$busy" "$temp" "$used" "$total" "$class"

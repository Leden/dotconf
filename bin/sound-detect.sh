#!/bin/bash 

set -e

output_log="$HOME/vision/sounds.log"
noise_threshold=1
raw_folder=/tmp/recs
split_folder=/tmp/recs/split
sox_raw_options="-t raw -r 8k -e signed -b 16"
split_size=$((1024 * 256)) # 256 KB

mkdir -p ${raw_folder} ${split_folder} "$HOME/vision"
rm -f $split_folder/*

test -a ${raw_folder}/in.raw ||  mkfifo ${raw_folder}/in.raw

rec ${sox_raw_options} - >${raw_folder}/in.raw 2>/dev/null &
split -b ${split_size} - <${raw_folder}/in.raw ${split_folder}/piece &


while true
do 
    for raw in $(find ${split_folder} -size ${split_size}c)
    do 
        max_level="$(sox $sox_raw_options "${raw}" -n stats -s 16 2>&1 | awk '/^Max\ level/ {print int($3)}')"
        if [ "$max_level" -gt $noise_threshold ]
        then
            echo -e "$(date +'%F %T')\t$max_level" | tee -a "$output_log"
        fi
        rm "${raw}"
    done
    sleep 1
done

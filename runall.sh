#!/bin/bash

#browsers=(chrome firefox opera)
#resolutions=(720x1280 750x1334 1920x1080 "")
browsers=(chrome)
resolutions=(1920x1080)
for browser in ${browsers[@]}; do
    for resolution in ${resolutions[@]}; do
        figlet "Testing ${browser} - ${resolution}"
        runtest="robot --outputdir testresults/${browser}/${resolution} --variable BROWSER:${browser} --variable RESOLUTION:${resolution} ./"
        $runtest
    done
done
exit 0

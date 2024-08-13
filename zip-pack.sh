#!/bin/sh

mkdir -p output

rm -f MetroidZeroMission_PopTrackerPack.zip
rm -rf output/*

files="images items layouts locations maps scripts manifest.json settings.json"
cp -r $files output

cd output
zip -r ../MetroidZeroMission_PopTrackerPack.zip *

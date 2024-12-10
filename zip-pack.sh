#!/bin/sh

mkdir -p output

rm -f MetroidZeroMission_PopTrackerPack.zip
rm -rf output/*

files="images items layouts locations maps scripts variant_items_on_left variant_items_only manifest.json settings.json"
cp -r $files output

cd output
zip -r ../MetroidZeroMission_PopTrackerPack.zip *

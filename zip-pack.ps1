del MetroidZeroMission_PopTrackerPack.zip
del output\* -Recurse

$files = "images\", "items\", "layouts\", "locations\", "maps\", "scripts\", "variant_items_on_left\", "variant_items_only\", "manifest.json", "settings.json"
foreach($file in $files) {
    Copy-Item $file -Destination output\ -Recurse
}

cd output
7z a -tzip ..\MetroidZeroMission_PopTrackerPack.zip *
cd ..
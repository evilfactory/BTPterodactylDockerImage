#!/bin/bash

./custom_script.sh
if [ ! -z "$COLLECTION" ] 
then 
	echo "Download and update mods from collection? (y/n)"
	read -p "(y/n) " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
		./SteamWorkshopDownloader.linux-x64 downloadcollection --steamcmdpath steamcmd/steamcmd.sh --steamappsfolder Steam --gameid 602960 --output LocalMods --collection $COLLECTION
    fi
fi

if [ ! -z "$ADD_PACKAGES" ] 
then 
    ./SteamWorkshopDownloader.linux-x64 btsetconfigplayer --modfolder LocalMods --configplayerfile config_player.xml
fi 

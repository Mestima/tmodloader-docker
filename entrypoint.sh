#!/usr/bin/env bash

VERSION=2022.08.54.2

if [ -e contents/ModPacks/*/Mods/enabled.json ]; then
  ./startserver.sh
else
  if [ ! -d "Libraries/" ]; then
    echo "No server files detected. Installing..."
    curl -LO https://github.com/tModLoader/tModLoader/releases/download/v${VERSION}/tModLoader.zip
    unzip -o tModLoader.zip
    rm -r tModLoader.zip

    curl -LO https://github.com/Mestima/tmodloader-docker/releases/download/${VERSION}/tmodloader-docker-master.zip
    unzip -o tmodloader-docker-master.zip
    rm -r tmodloader-docker-master.zip
    mkdir contents/ModPacks/
    mkdir contents/Worlds/
    chmod +x startserver.sh
    chmod +x start-tModLoaderServer.sh
      echo "Server setup complete"
  fi
  echo "No modpack detected. Add your modpack to contents/ModPacks/ and restart."
  exit
fi

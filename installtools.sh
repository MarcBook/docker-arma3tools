#!/bin/bash

/root/steamcmd.sh +login $STEAM_USERNAME $STEAM_PASSWORD $STEAM_AUTHCODE +@sSteamCmdForcePlatformType windows +force_install_dir /arma3 +app_update 233800 +quit

unset STEAM_USERNAME
unset STEAM_PASSWORD
unset STEAM_AUTHCODE

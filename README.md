# GCNostalgia
 KDE Plamsa Splash Screen


Ever wanted a Nostalgic Gamecube Splash Screen for your Distro?

Copy to "home/youruserhere/.local/share/plasma/look-and-feel

Colors can be edited in the Splash.qml file in : GCNostalgia/contents/splash

Want the boot sound? Create a login script with the following: 

# #!/bin/bash

# Wait for splash to finish
sleep 5.1  # 5.06 rounded up slightly for reliability

# Play your boot sound
paplay "/home/PutYourUserHere/.config/autostart-scripts/Nintendo_Gamecube_Boot.wav

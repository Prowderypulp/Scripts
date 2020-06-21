#!/bin/bash
hdiutil create -o /tmp/Catalina.cdr -size 8500m -layout SPUD -fs HFS+J
hdiutil attach /tmp/Catalina.cdr.dmg -noverify -nobrowse -mountpoint /Volumes/Catalina
asr restore -source /Applications/Install\ macOS\ Catalina.app/Contents/SharedSupport/BaseSystem.dmg -target /Volumes/Catalina -noprompt -noverify -erase
hdiutil detach /Volumes/macOS\ Base\ System
hdiutil convert /tmp/Catalina.cdr.dmg -format UDTO -o /tmp/Catalina.iso
mv /tmp/Catalina.iso.cdr ~/Desktop/Catalina.iso

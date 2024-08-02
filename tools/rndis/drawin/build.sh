#! /bin/sh

cd HoRNDIS
sudo xcodebuild -sdk macosx -configuration Release
sudo cp -rv build/Release/HoRNDIS.kext /Library/Extensions/
sudo kextload /Library/Extensions/HoRNDIS.kext
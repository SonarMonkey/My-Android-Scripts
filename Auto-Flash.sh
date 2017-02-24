#!/bin/sh

# Author: SonarMonkey
# Device: Nexus 5X
# Script Name: Magic-Setup
# Version: Alpha 0.1
# Created: Friday, February 24, 2017
# Last Updated: Initial Alpha
# Notes: This script must be placed in the same directory as your ROM, GApps, and Root zips, and must be modified if you wish to install more than 3 other mods. The zips containing the ROM, GApps, etc. you wish to flash must be named “ROM.zip” “GApps.zip” etc.

# perform backup and pull it to the host computer

mkdir Local-Backup
adb reboot recovery
adb wait-for-device
adb shell twrp backup SDBOM
adb pull /sdcard/TWRP/BACKUPS Local-Backup


# reboot to recovery and perform initial wipe

adb reboot recovery
adb wait-for-device
adb shell wipe system
adb shell wipe data
adb shell wipe cache
adb shell wipe dalvik
adb reboot recovery
adb wait-for-device


# push necessary files to folder on sdcard of device (modify if your device uses a different sdcard configuration)

adb shell mkdir /sdcard/Setup
adb push ROM.zip /sdcard/Setup
adb push GApps.zip /sdcard/Setup
adb push Kernel.zip /sdcard/Setup
adb push Root.zip /sdcard/Setup
adb push Mod1.zip /sdcard/Setup
adb push Mod2.zip /sdcard/Setup
adb push Mod3.zip /sdcard/Setup


# install all the files and boot

adb shell install /sdcard/Setup/ROM.zip
adb shell install /sdcard/Setup/GApps.zip
adb shell install /sdcard/Setup/Kernel.zip
adb shell install /sdcard/Setup/Root.zip
adb shell install /sdcard/Setup/Mod1.zip
adb shell install /sdcard/Setup/Mod2.zip
adb shell install /sdcard/Setup/Mod3.zip
adb reboot

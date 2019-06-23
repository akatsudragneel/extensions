#Extensions

<p align="center">
 <a href="https://forum.xda-developers.com/nokia-7-plus/themes/magisk-module-nokia-extensions-android-t3865438"><img src="https://img.shields.io/badge/XDA-Thread-orange.svg"></a>
 <a href="https://t.me/NokiaExtensions"><img src="https://img.shields.io/badge/Telegram-Group-blue.svg"></a>
</p>



## Module description

Why should the Chinese have all the fun? This module aims at porting features from the Chinese variants of Nokia phones to the Global variants. **Internet connection is required while flashing!** Files are downloaded using curl.

## Features

__Note:__ If you want to install only some of the following, you can do so. During installation, use the volume keys to select what you want to install and what not to install.

#### 1. AI Floating Touch
  *  The phone will recommend relevant applications according to your usage.
  *  You can also:
     * Use the custom shortcuts to customize the shortcut menu.
     * Use gestures to enrich your interaction with the phone.    

#### 2. App Traffic Control
  * Control the Internet usage (both mobile data and WiFi) by your Apps. Ex: You can restrict internet access to an app completely or allow it to use only WiFi and not mobile data.

#### 3. Data speed indicator
  * Shows your internet speed on the status bar.

#### 4. Evenwell Debloater
  * Systemless-ly remove Evenwell apps.
  * [List of apps and overlays removed](https://github.com/Magisk-Modules-Repo/nokia-extensions/wiki/Evenwell-Debloater).

#### 5. Face Unlock
  * Unlock with a glance. Just lift the phone to unlock, even when the screen is off. Find it under device security settings.
  * Note: Using your face data to unlock your device is less secure than using the pattern, PIN or password. Your device might be unlocked by people who look like you.  

#### 6. Game assistant
  * Enhance your gaming experience.
  * Block notifications and calls for uninterrupted gaming.

#### 7. HyperClip
  * This is a simple and powerful Clipboard Manager.

#### 8. Junk Cleaner
  * Clears cache and junk files.

#### 9. NokiaPure font
  * Change your system font to NokiaPure

#### 10. OTA Updater
  * Install system updates without entering recovery.

#### 11. Screenshot Plus
  * Take long screenshots, edit them on the go.

#### 12. Screen Recorder
  * Supports FHD, HD and SD at 30 and 60 FPS, records audio too.

#### 13. Smart Boost
  * Enjoy gaming without frame drops and hiccups!

#### 14. Task Manager
  * View and end a running task.

#### 15. Virus scan
  * Scan for virus and keep your phone secure.

#### 16. Substratum add-ons
  * One-handed mode
  * Double tap navigation bar/status bar to sleep  
  * Swapping navbar keys (back and recents button)
  * Direct call answer
  * Advanced section in the settings app      
  * Double tap to wake (untested)
  * Clear all button (For Android Pie, you have to set SystemUI as the recents provider using [QuickSwitch](https://github.com/Magisk-Modules-Repo/quickstepswitcher))


## How to's

  * To install the module, flash the zip using Magisk manager and reboot.
  * To uninstall the module, flash the same zip again and reboot.
  * To install an OTA update using OTA updater,
    * Restore your stock boot image from Magisk Manager(Magisk Manager - Uninstall - Restore images). Don't reboot and don't flash the stock boot using fastboot, you'll lose root!
    * Place the OTA update zip file in your internal storage(/storage/emulated/0/).
    * The file has to be renamed correctly. [More info here](https://forum.xda-developers.com/nokia-6/how-to/knowledge-fih-firmware-build-version-t3887411). You can get your current build version from NEX Launcher's Device section.
    * Dial \*#\*#874#\*#\* to install the update.
  * To get the internet speed on the status bar, go to Settings - Network & Internet - Data Usage and toggle Show data speed.
  * To access App traffic control, go to Settings - Network & Internet - Data Usage - App Traffic Control. You can also access it from NEX Launcher.
  * HyperClip will show up when you long press on a text input field.
    * Swipe right to add to favourite.
    * Swipe left to delete or share.
    * Long press to view the full content.
  * To use Screenshot plus and Screen Recorder, add them to Quick Settings.
  * To open AI Floating Touch, Smart boost, Task manager, Junk Cleaner and Virus scan use NEX Launcher.
  * Install nex substratum app using the substratum theme engine like any other theme.
  * You can find the new features under Settings - System - Gestures. You can always use the search bar in settings to find them (search for "gestures").  
  * Note that you might have to reboot twice for changing the navigation bar layout and for double tap to sleep to work.
  * About [OTA Link](https://forum.xda-developers.com/android/apps-games/root-url-ota-update-t3942250)

## Compatibility

  * [![Nokia Phones](https://img.shields.io/badge/Nokia-Android%20phones-blue.svg)](https://www.nokia.com/phones/en_int)
  * [![Magisk](https://img.shields.io/badge/Magisk-18%2B-blue.svg)](https://forum.xda-developers.com/apps/magisk/official-magisk-v7-universal-systemless-t3473445)
  * [![Magisk Manager](https://img.shields.io/badge/Magisk%20Manager-7.1.0%2B-blue.svg)](https://forum.xda-developers.com/apps/magisk/official-magisk-v7-universal-systemless-t3473445)
  * [![Android Oreo](https://img.shields.io/badge/Android-8.1.0-blue.svg)](https://www.android.com/versions/oreo-8-0/)
  * [![Android Pie](https://img.shields.io/badge/Android-9-blue.svg)](https://www.android.com/versions/pie-9-0/)

## Credits
  * **topjohnwu** for [Magisk](https://github.com/topjohnwu/Magisk)
  * **ahrion & zackptg5** for [Unity template](https://github.com/Zackptg5/Unity) and [Volume Key Selector](https://github.com/Zackptg5/Unity-Addons/tree/master/Volume-Key-Selector)
  * **FIH/Evenwell/HMD Global** (whoever it is) for making these apps :P

## Changelog

#### v2.51
  * NEX Launcher can now grab the OTA Update link, when an OTA is available.
  * Abort if not connected to the internet.

#### v2.5
  * New feature - Substratum add-ons, which enables features like one-handed mode, double tap to sleep etc.
  * Curl is now executed in parallel.
  * If a device doesn't have curl, the binary included in the module will be used.
  * NEX Launcher is now installed as a user app.

#### v2.41
  * Hotfix

#### v2.4
  * New feature - Face unlock!
  * NEX Launcher updated to launch face unlock. Find it under device security settings.

#### v2.3
  * Completely redesigned NEX Launcher.
  * Update to latest Unity.
  * Dynamic detection of OTAUpdate app.

#### v2.2
  * Module size is now less than 2 MB. The required files are downloaded during the installation process.
  * NEX Launcher updated to display the skuid.

#### v2.1
  * [Evenwell debloater](https://github.com/Akilesh-T/Evenwell-Debloater) is now merged with Nokia Extensions. Irony is that the former removes apps by Evenwell and the latter adds them.
  * Remove remnant files of NEX Launcher in `/data`

#### v2.0
  * New feature: OTA Updater.
  * Updated NEX Launcher - [Changelog](https://github.com/Akilesh-T/NEX-Launcher/releases/tag/v1.3).
  * Refactored Unity install script.

#### v1.92
  * New feature: Game assistant. (Note that some features may work even without the Game Assistant being a System app)
  * Updated NEX Launcher - [Changelog](https://github.com/Akilesh-T/NEX-Launcher/releases/tag/v1.25).

#### v1.91
  * Update to Unity v4.0
  * Module is now compatible only with Magisk 18.0+ and Magisk manager 7.1.0+

#### v1.9
  * New features - HyperClip and App traffic control!
  * Minor updates to NEX Launcher.

#### v1.8
  * Updated to Unity v3.2
  * Added Volume Key Selector from [Unity Addons](https://github.com/Zackptg5/Unity-Addons)
  * NEX Launcher updated to v1.1
    * Dark theme is here!
    * App font is now NokiaPure!

#### v1.7
  * xz compression is now used to reduce file size.
  * update to Unity v3.1
  * abort installation on Nokia 7.1

#### v1.6
  * Removed Activity Launcher and added my own app - NEX Launcher.
  * Beautified install script.

#### v1.5
  * Move to Unity v2.2
  * compress files to reduce size
  * Added Smart boost, Task manager, Junk Cleaner and Virus scan for Pie.
  * Fixed a few typos.

~~Since Nokia mobile doesn't use the number 4 in their naming scheme (there's no Nokia 4), I'm gonna skip v1.4 too~~

#### v1.3
  * Merge Pie and Oreo files into a single package
  * Users can now select only the files they want to install using volume keys

#### v1.2
  * Added smart boost
  * fixed some FCs

#### v1.1
  * Added more features - Screenshot plus, Screen Recorder, System dashboard
  * Added NokiaPure fonts

#### v1
  * Initial release

## Source code

  * [Module](https://github.com/Magisk-Modules-Repo/nokia-extensions)
  * [NEX Launcher](https://github.com/Akilesh-T/NEX-Launcher)
  * [Nokia Extensions Repo](https://github.com/Akilesh-T/nokia-extensions-repo)

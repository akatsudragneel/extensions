if [ ! $BOOTMODE ]; then
	abort "! Flash using Magisk manager"
fi

curl_ins=$(which curl)
if [ -z $curl_ins ]; then
    ui_print "! curl binary not found..."
    ui_print "  curl inlcuded in the module will be used."
    chmod 0755 $TMPDIR/common/curl
    alias curl="$TMPDIR/common/curl"
fi

MODEL=`getprop ro.product.model`
SKUID=`getprop ro.product.model.num`
RELEASE=`getprop ro.build.version.release`
BRAND=`getprop ro.product.brand`
DEVICE=`getprop ro.product.device`
ui_print " "
ui_print "  Performing device compatibility check..."
ui_print " "
ui_print "  Brand           : "$BRAND
echo     "  Model           : $MODEL"
ui_print "  Codename        : "$DEVICE
ui_print "  Android version : "$RELEASE
ui_print " "

if [ $BRAND != "Nokia" ]; then
	abort "! Brand '"$BRAND"' is not supported"
fi

if [ "$SKUID" = "00CN" ]; then
    abort "! Identified as Chinese variant. Aborting..."
fi

if [ "$DEVICE" = "CTL_sprout" ] || [ $DEVICE = "DPL_sprout" ] || [ $DEVICE = "PAN_sprout" ]; then
	abort "! '"$DEVICE"' is not supported"
fi

if [ $RELEASE != "8.1.0" ] && [ $RELEASE != "9" ]; then
	abort "! Android version '"$RELEASE"' is not supported"
fi

[ "`getenforce`" == "Enforcing" ] && ENFORCE=true || ENFORCE=false

ui_print "  Your device is compatible"
ui_print "  "
ui_print "  "
ui_print "  ..............................."
ui_print "  ..............................."
ui_print "  ..%%....%%...%%%%%%...%%...%%.."
ui_print "  ..%%%%..%%...%%........%%.%%..."
ui_print "  ..%%.%%.%%...%%%%.......%%....."
ui_print "  ..%%..%%%%...%%........%%.%%..."
ui_print "  ..%%....%%...%%%%%%...%%...%%.."
ui_print "  ..............................."
ui_print " "
ui_print "         Extend your Nokia!      "
ui_print "  ..............................."
ui_print " "
ui_print "  |-----------------------------|"
ui_print "  |        NEX inlcudes         |"
ui_print "  |-----------------------------|"
ui_print "  |      AI Floating Touch      |"
ui_print "  |      App Traffic Control    |"
ui_print "  |      Data Speed Indicator   |"
ui_print "  |      Evenwell Debloater     |"
ui_print "  |      Face Unlock            |"
ui_print "  |      Game Assistant         |"
ui_print "  |      HyperClip              |"
ui_print "  |      Junk Cleaner           |"
ui_print "  |      NEX Launcher           |"
ui_print "  |      NokiaPure font         |"
ui_print "  |      OTA Updater            |"
ui_print "  |      ScreenShot Plus        |"
ui_print "  |      Screen Recorder        |"
ui_print "  |      Smart Boost            |"
ui_print "  |      Task Manager           |"
ui_print "  |      Virus Scanner          |"
ui_print "  |-----------------------------|"
ui_print "  |  nex substratum app enables |"
ui_print "  |-----------------------------|"
ui_print "  |      One handed mode        |"
ui_print "  |      Double tap to sleep    |"
ui_print "  |      Swapping navbar keys   |"
ui_print "  |      Direct call answer     |"
ui_print "  |      Advanced settings      |"
ui_print "  |      Double tap to wake     |"
ui_print "  |      Clear all button       |"
ui_print "  |-----------------------------|"
ui_print "  "
ui_print "  "

ui_print "  Make sure that your device remains connected to the Internet!"
ui_print " "
curl -Is https://github.com | head -1 | grep 200
if [ $? -eq 0 ]; then
    ui_print "  Online"
else
    ui_print "  Offline. Please connect your phone to the Internet."
    sleep 5
		curl -Is https://github.com | head -1 | grep 200
		if [ $? -eq 0 ]; then
		    ui_print "  Online"
		else
			abort "! Device is not connected to the internet"
		fi
fi

ui_print " "
ui_print "  Use the Volume keys to select "
ui_print "    what you want to install    "
ui_print " "
ui_print "- Select Options -"
ui_print " "

ui_print "  Do you want to install AI floating touch?"
ui_print "  Vol up = Yes, Vol Down = No"
ui_print " "
if $VKSEL; then
   AI=true
else
   AI=false
fi

ui_print "  Do you want to install App Traffic Control (Firewall)?"
ui_print "  Vol up = Yes, Vol Down = No"
ui_print " "
if $VKSEL; then
   FW=true
else
   FW=false
fi

ui_print "  Do you want to install Data Speed Indicator?"
ui_print "  Vol up = Yes, Vol Down = No"
ui_print " "
if $VKSEL; then
   DS=true
else
   DS=false
fi

ui_print "  Do you want to remove Evenwell bloatware?"
ui_print "  Vol up = Yes, Vol Down = No"
ui_print " "
if $VKSEL; then
   EB=true
else
   EB=false
fi

ui_print "  Do you want to enable Face Unlock?"
ui_print "  Vol up = Yes, Vol Down = No"
ui_print " "
if $VKSEL; then
   FU=true
else
   FU=false
fi

if [ $RELEASE = "9" ]; then

    ui_print "  Do you want to install Game Assistant?"
    ui_print "  Vol up = Yes, Vol Down = No"
    ui_print " "
    if $VKSEL; then
       GA=true
    else
       GA=false
    fi

fi

ui_print "  Do you want to install HyperClip (Clipboard manager)?"
ui_print "  Vol up = Yes, Vol Down = No"
ui_print " "
if $VKSEL; then
   HC=true
else
   HC=false
fi

ui_print "  Do you want to install Junk Cleaner?"
ui_print "  Vol up = Yes, Vol Down = No"
ui_print " "
if $VKSEL; then
    JC=true
else
    JC=false
fi

ui_print "  Do you want to change the system font to NokiaPure?"
ui_print "  Vol up = Yes, Vol Down = No"
ui_print " "
if $VKSEL; then
   NP=true
else
   NP=false
fi

if [ ! -f $ORIGDIR/system/priv-app/OTAUpdate/OTAUpdate.apk ]; then
    ui_print "  Do you want to install OTA Updater?"
    ui_print "  Vol up = Yes, Vol Down = No"
    ui_print " "
    if $VKSEL; then
        OTA=true
    else
        OTA=false
    fi
fi

ui_print "  Do you want to install Screenshot plus?"
ui_print "  Vol up = Yes, Vol Down = No"
ui_print " "
if $VKSEL; then
   SS=true
else
   SS=false
fi

ui_print "  Do you want to install Screen recorder?"
ui_print "  Vol up = Yes, Vol Down = No"
ui_print " "
if $VKSEL; then
   SR=true
else
   SR=false
fi

ui_print "  Do you want to install Smart Boost?"
ui_print "  Vol up = Yes, Vol Down = No"
ui_print " "
if $VKSEL; then
    SB=true
else
    SB=false
fi

ui_print "  Do you want to install Task Manager?"
ui_print "  Vol up = Yes, Vol Down = No"
ui_print " "
if $VKSEL; then
    TM=true
else
    TM=false
fi

ui_print "  Do you want to install Virus Scanner?"
ui_print "  Vol up = Yes, Vol Down = No"
ui_print " "
if $VKSEL; then
    VS=true
else
    VS=false
fi

ui_print "  Do you want to install nex substratum app?"
ui_print "  It enables one-handed mode, double tap to sleep and more."
ui_print "  Vol up = Yes, Vol Down = No"
ui_print " "
if $VKSEL; then
    SUB=true
else
    SUB=false
fi

if [ $RELEASE == "8.1.0" ]; then
    mkdir -p $TMPDIR/system/vendor/cust/overlay/600WW
    OVR=system/vendor/cust/overlay/600WW
fi

if [ $RELEASE == "9" ]; then
    mkdir -p $TMPDIR/system/product/overlay
    OVR=system/product/overlay
fi

baseURL=https://raw.githubusercontent.com/Akilesh-T/nokia-extensions-repo/master

downloadAI(){
    curl -# $baseURL/$RELEASE/AIFloatingTouch.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/AIFloatingTouch.apk &
    curl -# $baseURL/$RELEASE/IntelligentSuggestion.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/IntelligentSuggestion.apk &
    wait
}

downloadFW(){
	curl -# $baseURL/$RELEASE/TrafficControl.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/TrafficControl.apk
}

downloadDS(){
	curl -# $baseURL/$RELEASE/DataSpeedIndicator.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/DataSpeedIndicator.apk &
	curl -# $baseURL/$RELEASE/com.evenwell.dataspeedindicator.overlay.base.600WW.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/com.evenwell.dataspeedindicator.overlay.base.600WW.apk &

	if [ $RELEASE = "8.1.0" ]; then
		curl -# $baseURL/$RELEASE/DataSpeedIndicator/oat/arm64/DataSpeedIndicator.odex --retry 10 --retry-max-time 0 -C - > $TMPDIR/DataSpeedIndicator.odex	&
	    curl -# $baseURL/$RELEASE/DataSpeedIndicator/oat/arm64/DataSpeedIndicator.vdex --retry 10 --retry-max-time 0 -C - > $TMPDIR/DataSpeedIndicator.vdex &
    fi
    wait
}

downloadFU(){
    curl -# $baseURL/common/FacePlusService/FacePlusService.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/FacePlusService.apk
    curl -# $baseURL/common/FacePlusService/lib/arm64/libFaceDetectCA.so --retry 10 --retry-max-time 0 -C - > $TMPDIR/libFaceDetectCA.so
    curl -# $baseURL/common/FacePlusService/lib/arm64/libMegviiUnlock-jni-1.2.so --retry 10 --retry-max-time 0 -C - > $TMPDIR/libMegviiUnlock-jni-1.2.so
    curl -# $baseURL/common/FacePlusService/lib/arm64/libMegviiUnlock.so --retry 10 --retry-max-time 0 -C - > $TMPDIR/libMegviiUnlock.so
    curl -# $baseURL/common/FacePlusService/lib/arm64/libSNPE.so --retry 10 --retry-max-time 0 -C - > $TMPDIR/libSNPE.so
    curl -# $baseURL/common/FacePlusService/lib/arm64/libgnustl_shared.so --retry 10 --retry-max-time 0 -C - > $TMPDIR/libgnustl_shared.so
    curl -# $baseURL/common/FacePlusService/lib/arm64/libmegface_meglive.so --retry 10 --retry-max-time 0 -C - > $TMPDIR/libmegface_meglive.so
    curl -# $baseURL/common/FacePlusService/lib/arm64/libqspower-1.0.0.so --retry 10 --retry-max-time 0 -C - > $TMPDIR/libqspower-1.0.0.so
    curl -# $baseURL/common/FacePlusService/lib/arm64/libsnpe_loader.so --retry 10 --retry-max-time 0 -C - > $TMPDIR/libsnpe_loader.so
    curl -# $baseURL/common/FacePlusService/lib/arm64/libsymphony-cpu.so --retry 10 --retry-max-time 0 -C - > $TMPDIR/libsymphony-cpu.so
    curl -# $baseURL/common/FacePlusService/lib/arm64/libsymphonypower.so --retry 10 --retry-max-time 0 -C - > $TMPDIR/libsymphonypower.so
}

downloadGA(){
	curl -# $baseURL/$RELEASE/GameAssistant.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/GameAssistant.apk
}

downloadHC(){
	curl -# $baseURL/$RELEASE/HyperClip.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/HyperClip.apk &
    curl -# $baseURL/$RELEASE/com.evenwell.hyperclip.overlay.base.600WW.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/com.evenwell.hyperclip.overlay.base.600WW.apk &
    wait
}

downloadJC(){
	curl -# $baseURL/$RELEASE/JunkCleaner/JunkCleaner.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/JunkCleaner.apk &
	curl -# $baseURL/$RELEASE/com.evenwell.memorycleaner.overlay.base.600WW.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/com.evenwell.memorycleaner.overlay.base.600WW.apk &
    curl -# $baseURL/$RELEASE/JunkCleaner/lib/arm64/libTmsdk-2.0.10-mfr.so --retry 10 --retry-max-time 0 -C - > $TMPDIR/libTmsdk-2.0.10-mfr.so &
    if [ $RELEASE = "8.1.0" ]; then
    	curl -# $baseURL/$RELEASE/JunkCleaner/lib/arm64/libdce-1.1.16-mfr.so --retry 10 --retry-max-time 0 -C - > $TMPDIR/libdce-1.1.16-mfr.so &
    fi
    if [ $RELEASE = "9" ]; then
    	curl -# $baseURL/$RELEASE/JunkCleaner/lib/arm64/libdce-1.1.18-mfr.so --retry 10 --retry-max-time 0 -C - > $TMPDIR/libdce-1.1.18-mfr.so &
    fi
    wait
}

downloadNL(){
	curl -# $baseURL/common/NEXLauncher.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/NEXLauncher.apk
}

downloadNP(){
	curl -# $baseURL/common/Roboto-Bold.ttf --retry 10 --retry-max-time 0 -C - > $TMPDIR/Roboto-Bold.ttf &
    curl -# $baseURL/common/Roboto-Italic.ttf --retry 10 --retry-max-time 0 -C - > $TMPDIR/Roboto-Italic.ttf &
    curl -# $baseURL/common/Roboto-Regular.ttf --retry 10 --retry-max-time 0 -C - > $TMPDIR/Roboto-Regular.ttf &
    curl -# $baseURL/common/Roboto-BoldItalic.ttf --retry 10 --retry-max-time 0 -C - > $TMPDIR/Roboto-BoldItalic.ttf &
    wait
}

downloadOTA(){
	curl -# $baseURL/$RELEASE/OTAUpdate.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/OTAUpdate.apk
}

downloadSS(){
	curl -# $baseURL/$RELEASE/ScreenShotPlus.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/ScreenShotPlus.apk &
    curl -# $baseURL/$RELEASE/com.nbc.screenshotplus.overlay.base.600WW.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/com.nbc.screenshotplus.overlay.base.600WW.apk &
    wait
}

downloadSR(){
	curl -# $baseURL/$RELEASE/ScreenRecorder.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/ScreenRecorder.apk &
	curl -# $baseURL/$RELEASE/com.nbc.android.screenrecord.overlay.base.600WW.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/com.nbc.android.screenrecord.overlay.base.600WW.apk &
    if [ $RELEASE = "8.1.0" ]; then
    	  curl -# $baseURL/$RELEASE/ScreenRecorder/oat/arm64/ScreenRecorder.odex --retry 10 --retry-max-time 0 -C - > $TMPDIR/ScreenRecorder.odex &
        curl -# $baseURL/$RELEASE/ScreenRecorder/oat/arm64/ScreenRecorder.vdex --retry 10 --retry-max-time 0 -C - > $TMPDIR/ScreenRecorder.vdex &
    fi
    wait
}

downloadSB(){
	  curl -# $baseURL/$RELEASE/SmartBoost.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/SmartBoost.apk
    curl -# $baseURL/$RELEASE/etc/permissions/SmartBoostFramework.xml --retry 10 --retry-max-time 0 -C - > $TMPDIR/SmartBoostFramework.xml
    curl -# $baseURL/$RELEASE/etc/SmartBoostCfg --retry 10 --retry-max-time 0 -C - > $TMPDIR/SmartBoostCfg
    curl -# $baseURL/$RELEASE/framework/SmartBoostFramework.jar --retry 10 --retry-max-time 0 -C - > $TMPDIR/SmartBoostFramework.jar
    curl -# $baseURL/$RELEASE/framework/oat/arm/SmartBoostFramework.odex --retry 10 --retry-max-time 0 -C - > $TMPDIR/arm_SmartBoostFramework.odex
    curl -# $baseURL/$RELEASE/framework/oat/arm/SmartBoostFramework.vdex --retry 10 --retry-max-time 0 -C - > $TMPDIR/arm_SmartBoostFramework.vdex
    curl -# $baseURL/$RELEASE/framework/oat/arm64/SmartBoostFramework.odex --retry 10 --retry-max-time 0 -C - > $TMPDIR/arm64_SmartBoostFramework.odex
    curl -# $baseURL/$RELEASE/framework/oat/arm64/SmartBoostFramework.vdex --retry 10 --retry-max-time 0 -C - > $TMPDIR/arm64_SmartBoostFramework.vdex
}

downloadTM(){
	curl -# $baseURL/$RELEASE/TaskManager.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/TaskManager.apk
}

downloadVS(){
	  curl -# $baseURL/$RELEASE/VirusScan/VirusScan.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/VirusScan.apk &
    curl -# $baseURL/$RELEASE/VirusScan/lib/arm64/libams-1.2.6-mfr.so --retry 10 --retry-max-time 0 -C - > $TMPDIR/VS_libams-1.2.6-mfr.so &
    curl -# $baseURL/$RELEASE/VirusScan/lib/arm64/libdce-1.1.16-mfr.so --retry 10 --retry-max-time 0 -C - > $TMPDIR/VS_libdce-1.1.16-mfr.so &
    curl -# $baseURL/$RELEASE/VirusScan/lib/arm64/libTmsdk-2.0.10-mfr.so --retry 10 --retry-max-time 0 -C - > $TMPDIR/VS_libTmsdk-2.0.10-mfr.so &
    wait
}

downloadSUB(){
	curl -# $baseURL/common/nex-substratum.apk --retry 10 --retry-max-time 0 -C - > $TMPDIR/nex-substratum.apk
}

if $AI; then
    ui_print " "
    ui_print "+ Downloading AI Floating Touch..."
    downloadAI
    ui_print "  Installing AI floating touch..."
    AI_APK=$TMPDIR/AIFloatingTouch.apk
    mkdir -p $TMPDIR/system/priv-app/AIFloatingTouch
    cp -f $AI_APK $TMPDIR/system/priv-app/AIFloatingTouch/AIFloatingTouch.apk
    IS_APK=$TMPDIR/IntelligentSuggestion.apk
    mkdir -p $TMPDIR/system/priv-app/IntelligentSuggestion
    cp -f $IS_APK $TMPDIR/system/priv-app/IntelligentSuggestion/IntelligentSuggestion.apk
    ui_print "  done!"
else
    ui_print " "
    ui_print "- AI floating touch is not installed"
fi

if $FW; then
	ui_print " "
	ui_print "+ Downloading App Traffic Control..."
	downloadFW
    ui_print "  Installing App Traffic Control..."
    FW_APK=$TMPDIR/TrafficControl.apk
    mkdir -p $TMPDIR/system/priv-app/TrafficControl
    cp -f $FW_APK $TMPDIR/system/priv-app/TrafficControl/TrafficControl.apk
    ui_print "  done!"

else
    ui_print " "
    ui_print "- App Traffic Control is not installed"
fi

if $DS; then
	ui_print " "
	ui_print "+ Downloading Data Speed Indicator..."
	downloadDS
    ui_print "  Installing Data Speed Indicator..."
    DS_APK=$TMPDIR/DataSpeedIndicator.apk
    DS_APK_O=$TMPDIR/com.evenwell.dataspeedindicator.overlay.base.600WW.apk
    mkdir -p $TMPDIR/system/priv-app/DataSpeedIndicator
    cp -f $DS_APK $TMPDIR/system/priv-app/DataSpeedIndicator/DataSpeedIndicator.apk
    cp -f $DS_APK_O $TMPDIR/$OVR/com.evenwell.dataspeedindicator.overlay.base.600WW.apk
    if [ $RELEASE = "8.1.0" ]; then
        mkdir -p $TMPDIR/system/priv-app/DataSpeedIndicator/oat/arm64
        DS_APK_OD=$TMPDIR/DataSpeedIndicator.odex
        DS_APK_VD=$TMPDIR/DataSpeedIndicator.vdex
        cp -f $DS_APK_OD $TMPDIR/system/priv-app/DataSpeedIndicator/oat/arm64/DataSpeedIndicator.odex
        cp -f $DS_APK_VD $TMPDIR/system/priv-app/DataSpeedIndicator/oat/arm64/DataSpeedIndicator.vdex
    fi
    ui_print "  done!"

else
    ui_print " "
    ui_print "- Data Speed Indicator is not installed"
fi

if $EB; then
    ui_print " "
    ui_print "- Removing some Evenwell apps..."

    a1=APRUploadService
    a2=AutoRegistration
    a3=BatteryProtect
    a4=CPClient
    a5=CustManager
    a6=DataAgent
    a7=DataGo
    a8=DbgCfgTool
    a9=DeviceMonitorControl
    a10=NPS
    a11=PermissionDetection
    a12=PowerMonitor
    a13=PowerSaverG3
    a14=PushAgentWW
    a15=RetailDemoApp
    a16=RetailDemoLauncher
    a17=StabilityMonitor
    a18=StatsdLogger
    a19=WeatherProvider
    a20=WeatherService
    i=1
    while [ $i -lt 21 ]; do
        APK=$(eval echo "\${a${i}}")
        if [ -d $ORIGDIR/system/priv-app/$APK ]; then
            mktouch $TMPDIR/system/priv-app/$APK/.replace "$APK"
        fi
        i=`expr $i + 1`
    done

    b1=com.evenwell.AprUploadService.data.overlay.base.600WW.apk
    b2=com.evenwell.CPClient.overlay.base.600WW.apk
    b3=com.evenwell.DbgCfgTool.overlay.base.600WW.apk
    b4=com.evenwell.DeviceMonitorControl.data.overlay.base.600WW.apk
    b5=com.evenwell.PowerMonitor.overlay.base.600WW.apk
    b6=com.evenwell.UsageStatsLogReceiver.data.overlay.base.600WW.apk
    b7=com.evenwell.autoregistration.overlay.base.600WW.apk
    b8=com.evenwell.batteryprotect.overlay.base.600WW.apk
    b9=com.evenwell.custmanager.data.overlay.base.600WW.apk
    b10=com.evenwell.dataagent.overlay.base.600WW.apk
    b11=com.evenwell.nps.overlay.base.600WW.apk
    b12=com.evenwell.permissiondetection.overlay.base.600WW.apk
    b13=com.evenwell.powersaving.g3.overlay.base.600WW.apk
    b14=com.evenwell.providers.weather.overlay.base.600WW.apk
    b15=com.evenwell.pushagent.overlay.base.600WW.apk
    b16=com.evenwell.retaildemoapp.overlay.base.600WW.apk
    b17=com.evenwell.stbmonitor.data.overlay.base.600WW.apk
    b18=com.evenwell.weatherservice.overlay.base.600WW.apk
    b19=com.hmdglobal.datago.overlay.base.600WW.apk
    b20=com.hmdglobal.appstore.overlay.base.600WW.apk
    b21=com.hmdglobal.US601.messaging.overlay.base.600WW.apk
    j=1
    while [ $j -lt 22 ]; do
        OVERLAY=$(eval echo "\${b${j}}")
        if [ -f $ORIGDIR/system/product/overlay/$OVERLAY ]; then
        mktouch $TMPDIR/system/product/overlay/$OVERLAY
        fi
        j=`expr $j + 1`
    done
else
    ui_print " "
    ui_print "+ Evenwell apps are not removed"
fi

if $FU; then
    ui_print " "
    ui_print "+ Downloading Face Plus Service..."
    downloadFU
    ui_print "  Installing Face Plus Service..."
    FU_APK=$TMPDIR/FacePlusService.apk
    mkdir -p $TMPDIR/system/priv-app/FacePlusService/lib/arm64
    cp -f $FU_APK $TMPDIR/system/priv-app/FacePlusService/FacePlusService.apk
    cp -f $TMPDIR/libFaceDetectCA.so $TMPDIR/system/priv-app/FacePlusService/lib/arm64/libFaceDetectCA.so
    cp -f $TMPDIR/libMegviiUnlock-jni-1.2.so $TMPDIR/system/priv-app/FacePlusService/lib/arm64/libMegviiUnlock-jni-1.2.so
    cp -f $TMPDIR/libMegviiUnlock.so $TMPDIR/system/priv-app/FacePlusService/lib/arm64/libMegviiUnlock.so
    cp -f $TMPDIR/libSNPE.so $TMPDIR/system/priv-app/FacePlusService/lib/arm64/libSNPE.so
    cp -f $TMPDIR/libgnustl_shared.so $TMPDIR/system/priv-app/FacePlusService/lib/arm64/libgnustl_shared.so
    cp -f $TMPDIR/libmegface_meglive.so $TMPDIR/system/priv-app/FacePlusService/lib/arm64/libmegface_meglive.so
    cp -f $TMPDIR/libqspower-1.0.0.so $TMPDIR/system/priv-app/FacePlusService/lib/arm64/libqspower-1.0.0.so
    cp -f $TMPDIR/libsnpe_loader.so $TMPDIR/system/priv-app/FacePlusService/lib/arm64/libsnpe_loader.so
    cp -f $TMPDIR/libsymphony-cpu.so $TMPDIR/system/priv-app/FacePlusService/lib/arm64/libsymphony-cpu.so
    cp -f $TMPDIR/libsymphonypower.so $TMPDIR/system/priv-app/FacePlusService/lib/arm64/libsymphonypower.so
    ui_print "  done!"
else
    ui_print " "
    ui_print "- Face Unlock not enabled"
fi

if $GA; then
    ui_print " "
    ui_print "+ Downloading Game Assistant..."
    downloadGA
    ui_print "  Installing Game Assistant..."
    GA_APK=$TMPDIR/GameAssistant.apk
    mkdir -p $TMPDIR/system/priv-app/GameAssistant
    cp -f $GA_APK $TMPDIR/system/priv-app/GameAssistant/GameAssistant.apk
    ui_print "  done!"

else
    ui_print " "
    ui_print "- Game Assistant is not installed"
fi

if $HC; then
	ui_print " "
	ui_print "+ Downloading Hyper Clip..."
	downloadHC
    ui_print "  Installing Hyper Clip..."
    HC_APK=$TMPDIR/HyperClip.apk
    HC_OVR=$TMPDIR/com.evenwell.hyperclip.overlay.base.600WW.apk
    mkdir -p $TMPDIR/system/priv-app/HyperClip
    cp -f $HC_APK $TMPDIR/system/priv-app/HyperClip/HyperClip.apk
    cp -f $HC_OVR $TMPDIR/$OVR/com.evenwell.hyperclip.overlay.base.600WW.apk
    ui_print "  done!"
else
    ui_print " "
    ui_print "- HyperClip is not installed"
fi

if $JC; then
	ui_print " "
	ui_print "+ Downloading Junk Cleaner..."
	downloadJC
    ui_print "  Installing Junk Cleaner..."
    JC_APK=$TMPDIR/JunkCleaner.apk
    JC_APK_O=$TMPDIR/com.evenwell.memorycleaner.overlay.base.600WW.apk
    JC_APK_L2=$TMPDIR/libTmsdk-2.0.10-mfr.so
    mkdir -p $TMPDIR/system/priv-app/JunkCleaner/lib/arm64
    cp -f $JC_APK $TMPDIR/system/priv-app/JunkCleaner/JunkCleaner.apk
    cp -f $JC_APK_O $TMPDIR/$OVR/com.evenwell.memorycleaner.overlay.base.600WW.apk
    cp -f $JC_APK_L2 $TMPDIR/system/priv-app/JunkCleaner/lib/arm64/libTmsdk-2.0.10-mfr.so
    if [ $RELEASE = "8.1.0" ]; then
        JC_APK_L1=$TMPDIR/libdce-1.1.16-mfr.so
        cp -f $JC_APK_L1 $TMPDIR/system/priv-app/JunkCleaner/lib/arm64/libdce-1.1.16-mfr.so
    fi
    if [ $RELEASE = "9" ]; then
        JC_APK_L1=$TMPDIR/libdce-1.1.18-mfr.so
        cp -f $JC_APK_L1 $TMPDIR/system/priv-app/JunkCleaner/lib/arm64/libdce-1.1.18-mfr.so
    fi
    ui_print "  done!"
else
    ui_print " "
    ui_print "- Junk Cleaner is not installed"
fi

if [ "$AI" = "true" ] || [ "$FW" = "true" ] || [ "$FU" = "true" ] || [ "$GA" = "true" ] || [ "$SR" = "true" ] || [ "$JC" = "true" ] || [ "$TM" = "true" ] || [ "$SB" = "true" ] || [ "$VS" = "true" ]; then
    ui_print " "
    $ENFORCE && setenforce 0
    nex_ins=$(find /data/app -type d -name "app.akilesh.nex[^.substratum]*")
    if [ ! -z "$nex_ins" ]; then
        ui_print "- Uninstalling the old nex app..."
        pm uninstall app.akilesh.nex
    fi
    ui_print "+ Downloading NEX Launcher..."
    downloadNL
    ui_print "  Installing NEX Launcher..."
    pm install $TMPDIR/NEXLauncher.apk
    $ENFORCE && setenforce 1
fi

if $NP; then
	ui_print " "
	ui_print "+ Downloading Nokia Pure fonts..."
	downloadNP
    ui_print "  Changing system font to NokiaPure..."
    NP_B=$TMPDIR/Roboto-Bold.ttf
    NP_I=$TMPDIR/Roboto-Italic.ttf
    NP_BI=$TMPDIR/Roboto-BoldItalic.ttf
    NP_R=$TMPDIR/Roboto-Regular.ttf
    mkdir -p $TMPDIR/system/fonts
    cp -rf $NP_B $TMPDIR/system/fonts/Roboto-Bold.ttf
    cp -rf $NP_I $TMPDIR/system/fonts/Roboto-Italic.ttf
    cp -rf $NP_BI $TMPDIR/system/fonts/Roboto-BoldItalic.ttf
    cp -rf $NP_R $TMPDIR/system/fonts/Roboto-Regular.ttf
    ui_print "  done!"

else
    ui_print " "
    ui_print "- NokiaPure font is not applied"
fi

if $OTA; then
	ui_print " "
	ui_print "+ Downloading OTA Updater..."
	downloadOTA
    ui_print "  Installing OTA Updater..."
    OTA_APK=$TMPDIR/OTAUpdate.apk
    mkdir -p $TMPDIR/system/priv-app/OTAUpdate
    cp -f $OTA_APK $TMPDIR/system/priv-app/OTAUpdate/OTAUpdate.apk
    ui_print "  done!"

else
    ui_print " "
    ui_print "- OTA Updater is not installed"
fi

if $SS; then
	ui_print " "
	ui_print "+ Downloading ScreenShot Plus..."
	downloadSS
    ui_print "  Installing ScreenShot Plus..."
    SS_APK=$TMPDIR/ScreenShotPlus.apk
    SS_APK_O=$TMPDIR/com.nbc.screenshotplus.overlay.base.600WW.apk
    mkdir -p $TMPDIR/system/priv-app/ScreenShotPlus
    cp -f $SS_APK $TMPDIR/system/priv-app/ScreenShotPlus/ScreenShotPlus.apk
    cp -f $SS_APK_O $TMPDIR/$OVR/com.nbc.screenshotplus.overlay.base.600WW.apk
    ui_print "  done!"
else
    ui_print " "
    ui_print "- ScreenShot Plus is not installed"
fi

if $SR; then
	ui_print " "
	ui_print "+ Downloading Screen Recorder..."
	downloadSR
    ui_print "  Installing Screen Recorder..."
    SR_APK=$TMPDIR/ScreenRecorder.apk
    SR_APK_O=$TMPDIR/com.nbc.android.screenrecord.overlay.base.600WW.apk
    mkdir -p $TMPDIR/system/priv-app/ScreenRecorder
    cp -f $SR_APK $TMPDIR/system/priv-app/ScreenRecorder/ScreenRecorder.apk
    cp -f $SR_APK_O $TMPDIR/$OVR/com.nbc.android.screenrecord.overlay.base.600WW.apk
    if [ $RELEASE = "8.1.0" ]; then
        SR_APK_OD=$TMPDIR/ScreenRecorder.odex
        SR_APK_VD=$TMPDIR/ScreenRecorder.vdex
        mkdir -p $TMPDIR/system/priv-app/ScreenRecorder/oat/arm64
        cp -f $SR_APK_OD $TMPDIR/system/priv-app/ScreenRecorder/oat/arm64/ScreenRecorder.odex
        cp -f $SR_APK_VD $TMPDIR/system/priv-app/ScreenRecorder/oat/arm64/ScreenRecorder.vdex
    fi
    ui_print "  done!"
else
    ui_print " "
    ui_print "- Screen Recorder is not installed"
fi

if $SB; then
	ui_print " "
	ui_print "+ Downloading Smart Boost..."
	downloadSB
    ui_print "  Installing Smart Boost..."
    SM_APK=$TMPDIR/SmartBoost.apk
    SB_PER=$TMPDIR/SmartBoostFramework.xml
    SB_CFG=$TMPDIR/SmartBoostCfg
    SB_FM=$TMPDIR/SmartBoostFramework.jar
    SB_OD1=$TMPDIR/arm_SmartBoostFramework.odex
    SB_VD1=$TMPDIR/arm_SmartBoostFramework.vdex
    SB_OD2=$TMPDIR/arm64_SmartBoostFramework.odex
    SB_VD2=$TMPDIR/arm64_SmartBoostFramework.vdex
    mkdir -p $TMPDIR/system/priv-app/SmartBoost
    mkdir -p $TMPDIR/system/etc/permissions
    mkdir -p $TMPDIR/system/framework/oat/arm
    mkdir -p $TMPDIR/system/framework/oat/arm64
    cp -f $SM_APK $TMPDIR/system/priv-app/SmartBoost/SmartBoost.apk
    cp -f $SB_PER $TMPDIR/system/etc/permissions/SmartBoostFramework.xml
    cp -f $SB_CFG $TMPDIR/system/etc/SmartBoostCfg
    cp -f $SB_FM $TMPDIR/system/framework/SmartBoostFramework.jar
    cp -f $SB_OD1 $TMPDIR/system/framework/oat/arm/SmartBoostFramework.odex
    cp -f $SB_VD1 $TMPDIR/system/framework/oat/arm/SmartBoostFramework.vdex
    cp -f $SB_OD2 $TMPDIR/system/framework/oat/arm64/SmartBoostFramework.odex
    cp -f $SB_VD2 $TMPDIR/system/framework/oat/arm64/SmartBoostFramework.vdex
    ui_print "  done!"
else
    ui_print " "
    ui_print "- Smart Boost is not installed"
fi

if $TM; then
	ui_print " "
	ui_print "+ Downloading Task Manager..."
	downloadTM
    ui_print "  Installing Task Manager..."
    TM_APK=$TMPDIR/TaskManager.apk
    mkdir -p $TMPDIR/system/priv-app/TaskManager
    cp -f $TM_APK $TMPDIR/system/priv-app/TaskManager/TaskManager.apk
    ui_print "  done!"
else
    ui_print " "
    ui_print "- Task Manager is not installed"
fi

if $VS; then
	ui_print " "
	ui_print "+ Downloading Virus Scanner..."
	downloadVS
    ui_print "  Installing Virus Scanner..."
    VS_APK=$TMPDIR/VirusScan.apk
    VS_APK_L1=$TMPDIR/VS_libams-1.2.6-mfr.so
    VS_APK_L2=$TMPDIR/VS_libdce-1.1.16-mfr.so
    VS_APK_L3=$TMPDIR/VS_libTmsdk-2.0.10-mfr.so
    mkdir -p $TMPDIR/system/priv-app/VirusScan/lib/arm64
    cp -f $VS_APK $TMPDIR/system/priv-app/VirusScan/VirusScan.apk
    cp -f $VS_APK_L1 $TMPDIR/system/priv-app/VirusScan/lib/arm64/libams-1.2.6-mfr.so
    cp -f $VS_APK_L2 $TMPDIR/system/priv-app/VirusScan/lib/arm64/libdce-1.1.16-mfr.so
    cp -f $VS_APK_L2 $TMPDIR/system/priv-app/VirusScan/lib/arm64/libTmsdk-2.0.10-mfr.so
    ui_print "  done!"
else
    ui_print " "
    ui_print "- Virus Scanner is not installed"
fi

if $SUB; then
	ui_print " "
    $ENFORCE && setenforce 0
	sub_ins=$(find /data/app -type d -name "projekt.substratum-*")
	if [ -z "$sub_ins" ]; then
		ui_print "! Please install substratum theme engine from play store."
    fi
    ui_print "+ Downloading nex substratum app..."
    downloadSUB
    ui_print "  Installing..."
    pm install -r $TMPDIR/nex-substratum.apk
    $ENFORCE && setenforce 1
else
    ui_print " "
	ui_print "- nex substratum app not installed"
fi

ui_print " "

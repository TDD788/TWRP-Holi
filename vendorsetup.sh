FDEVICE1="holi"
CURR_DEVICE="holi"

RED_BACK="\e[101m"
RED="\e[91m"
RESET="\e[0m"
GREEN="\e[92m"

echo "Important Value"
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL="C"
	
echo "General Configurations"
export OF_MAINTAINER="IamAzmathullaShaikh"
export FOX_BUILD_TYPE="Stable"
export FOX_VERSION="R12.1_1"
export FOX_VARIANT="AOSP"

# Binaries & Tools
#export FOX_CUSTOM_BINS_TO_SDCARD=3
export FOX_USE_NANO_EDITOR=1
export FOX_REPLACE_BUSYBOX_PS=1
export FOX_USE_SED_BINARY=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_UNZIP_BINARY=1
export FOX_USE_XZ_UTILS=1

echo "Target Device"
export FOX_TARGET_DEVICES="holi, CPH2467, NordCE3Lite"
export TARGET_DEVICE_ALT="holi, CPH2467, NordCE3Lite"
export FOX_BUILD_DEVICE="holi"
	
export_build_vars(){
	echo -e "${GREEN}Exporting build vars from the holi tree${RESET}"
        #Important Build Flags
        export FOX_VANILLA_BUILD=1
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export FOX_DELETE_AROMAFM=0
	export OF_CLOCK_POS=1
        export OF_CHECK_OVERWRITE_ATTEMPTS=1
	export OF_QUICK_BACKUP_LIST="/system_root;/vendor;/data;/boot;"
	export OF_STATUS_INDENT_RIGHT=48
	export OF_STATUS_INDENT_LEFT=48
	export OF_WIPE_METADATA_AFTER_DATAFORMAT=1
	export OF_OPTIONS_LIST_NUM=8
	export FOX_DELETE_INITD_ADDON=1 # !- Causes bootloops sometimes -!
	export FOX_ENABLE_APP_MANAGER=1
        export OF_USE_SYSTEM_FINGERPRINT=0
        
	# Security Configurations
	export OF_ADVANCED_SECURITY=1
	
	# Tools and Utilities Configurations
	export OF_OTA_BACKUP_STOCK_BOOT_IMAGE=1
	export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
	export OF_USE_LZ4_COMPRESSION=1
	export OF_ENABLE_FS_COMPRESSION=1
	export OF_HIDE_NOTCH=1
	
	# Specific Features Configurations
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=0
        export OF_ENABLE_LPTOOLS=1
	export FOX_NO_SAMSUNG_SPECIAL=0
	export OF_PATCH_AVB20=1
	export OF_SUPPORT_VBMETA_AVB2_PATCHING=1
	export OF_SCREEN_H=2400
        export OF_NO_SPLASH_CHANGE=1

	# File Paths Configurations
	export OF_FL_PATH1="/system/flashlight"
	export OF_FL_PATH2=""
	export OF_FLASHLIGHT_ENABLE=1
	
	# maximum permissible splash image size
	# (in kilobytes); do *NOT* increase!
	export OF_SPLASH_MAX_SIZE=128
 
	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
	  export | grep "FOX" >> $FOX_BUILD_LOG_FILE
	  export | grep "OF_" >> $FOX_BUILD_LOG_FILE
	  export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
	  export | grep "TW_" >> $FOX_BUILD_LOG_FILE
	fi
}

set_env_var(){
        echo -e "${RED_BACK}Environment Variable CURR_DEVICE not set... Aborting${RESET}"
        echo "Set to the codename of the device you're building for"
        echo -e "${GREEN}Example :${RESET}"
        echo " export CURR_DEVICE=holi"
        exit 1
}

var_not_eq(){
        echo -e "${RED_BACK}CURR_DEVICE not equal to holi${RESET}"
        echo -e "${RED_BACK}CURR_DEVICE = $CURR_DEVICE${RESET}"
        echo -e "${RED}If this is a mistake, then export CURR_DEVICE to the correct codename${RESET}"
        echo -e "${RED}Skipping holi specific build vars...${RESET}"
}

case "$CURR_DEVICE" in
  "$FDEVICE1")
    export_build_vars;
    ;;
  "")
    set_env_var
    ;;
  *)
    var_not_eq
    ;;
esac

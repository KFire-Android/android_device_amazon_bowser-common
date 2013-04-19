BOWSER_COMMON_FOLDER := device/amazon/bowser-common

# inherit from common
-include device/amazon/omap4-common/BoardConfigCommon.mk

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Camera
TI_OMAP4_CAMERAHAL_VARIANT := true
#TI_CAMERAHAL_DEBUG_ENABLED := true
#TI_CAMERAHAL_VERBOSE_DEBUG_ENABLED := true
#TI_CAMERAHAL_DEBUG_FUNCTION_NAMES := true
USE_CAMERA_STUB := false

# inherit from the proprietary version
-include vendor/amazon/bowser-common/BoardConfigVendor.mk

# Kernel
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := mem=1G console=/dev/null rootdelay=2 init=/init androidboot.console=ttyO2 androidboot.hardware=bowser vmalloc=496M
TARGET_BOOTLOADER_BOARD_NAME := bowser

# Connectivity - Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
#BOARD_HOSTAPD_DRIVER             := NL80211
#BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV            := bcm43239_a0
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
#WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcmdhd.bin"
#WIFI_DRIVER_FW_PATH_P2P          := "/vendor/firmware/fw_bcmdhd_p2p.bin"
#WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcmdhd_apsta.bin"
PRODUCT_WIRELESS_TOOLS           := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 929038336
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12949893120
BOARD_FLASH_BLOCK_SIZE := 131072

# Custom DOMX
TI_CUSTOM_DOMX_PATH := $(BOWSER_COMMON_FOLDER)/domx
DOMX_PATH := $(BOWSER_COMMON_FOLDER)/domx

# Graphics
BOARD_EGL_CFG := $(BOWSER_COMMON_FOLDER)/prebuilt/egl.cfg
BOARD_CREATE_AMAZON_HDCP_KEYS_SYMLINK := true

# Recovery
TARGET_RECOVERY_INITRC := $(BOWSER_COMMON_FOLDER)/recovery/init.recovery.rc
TARGET_RECOVERY_PRE_COMMAND := "echo 0 > /sys/block/mmcblk0boot0/force_ro; echo -n 7 | dd of=/dev/block/mmcblk0boot0 bs=1 count=1 seek=4104 ; sync; \#"

# TWRP Config
#TW_NO_REBOOT_BOOTLOADER := true
#TW_NO_REBOOT_RECOVERY := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
#BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_ALWAYS_RMRF := true
TARGET_USERIMAGES_USE_EXT4 := true
TW_CUSTOM_POWER_BUTTON := 107
TW_BRIGHTNESS_PATH := /sys/class/backlight/bowser/brightness
TW_MAX_BRIGHTNESS := 254
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/bq27541
# ICS ril version
LEGACY_RIL := true

BOWSER_COMMON_FOLDER := device/amazon/bowser-common
COMMON_FOLDER := device/amazon/omap4-common
TARGET_BOOTLOADER_BOARD_SUBTYPE := jem

$(call inherit-product, $(COMMON_FOLDER)/common.mk)

PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi


# Hardware HALs
PRODUCT_PACKAGES += \
    hwcomposer.bowser \
    lights.bowser \
    power.bowser \
    camera.bowser \
    audio.primary.bowser \
    audio.hdmi.bowser

# BT
PRODUCT_PACKAGES += \
    uim-sysfs \
    brcm_patchram_plus

# Rootfs
PRODUCT_COPY_FILES += \
    $(BOWSER_COMMON_FOLDER)/init.bowser.usb.rc:root/init.bowser.usb.rc \
    $(BOWSER_COMMON_FOLDER)/ueventd.bowser.rc:root/ueventd.bowser.rc

# Prebuilts /system/bin
PRODUCT_COPY_FILES += \
    $(BOWSER_COMMON_FOLDER)/prebuilt/bin/battery_log.sh:/system/bin/battery_log.sh \
    $(BOWSER_COMMON_FOLDER)/prebuilt/bin/cond_start_ril:/system/bin/cond_start_ril \
    $(BOWSER_COMMON_FOLDER)/prebuilt/bin/emmc_init.sh:/system/bin/emmc_init.sh \
    $(BOWSER_COMMON_FOLDER)/prebuilt/bin/temperature_log.sh:/system/bin/temperature_log.sh \
    $(BOWSER_COMMON_FOLDER)/prebuilt/bin/thermal_setup.sh:/system/bin/thermal_setup.sh

# Prebuilts /system/etc
PRODUCT_COPY_FILES += \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/audio_policy.conf:/system/etc/audio_policy.conf \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/media_codecs.xml:/system/etc/media_codecs.xml \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/vold.fstab:/system/etc/vold.fstab \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/smc_normal_world_android_cfg.ini:/system/etc/smc_normal_world_android_cfg.ini

# postrecoveryboot for recovery
PRODUCT_COPY_FILES += \
    $(BOWSER_COMMON_FOLDER)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, $(BOWSER_COMMON_FOLDER)/prebuilt/camera/vendor-camera.mk)
$(call inherit-product-if-exists, $(BOWSER_COMMON_FOLDER)/bcmdhd-wifi/bcmdhd-wifi.mk)
$(call inherit-product-if-exists, $(COMMON_FOLDER)/imgtec/sgx-imgtec-bins-544.mk)

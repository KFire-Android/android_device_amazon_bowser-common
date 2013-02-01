COMMON_FOLDER := device/amazon/omap4-common
BOWSER_COMMON_FOLDER := device/amazon/bowser-common

$(call inherit-product, $(COMMON_FOLDER)/common.mk)

DEVICE_PACKAGE_OVERLAYS += $(BOWSER_COMMON_FOLDER)/overlay/aosp

PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi


#    audio.primary.bowser \
#    audio.hdmi.bowser
# Hardware HALs
PRODUCT_PACKAGES += \
    hwcomposer.bowser \
    lights.bowser \
    power.bowser \
    camera.bowser \

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

# TI OMAP4
PRODUCT_PACKAGES += \
    libdomx \
    libOMX_Core \
    libOMX.TI.DUCATI1.VIDEO.H264E \
    libOMX.TI.DUCATI1.VIDEO.H264SVCE \
    libOMX.TI.DUCATI1.VIDEO.VC1E \
    libOMX.TI.DUCATI1.VIDEO.MPEG4E \
    libOMX.TI.DUCATI1.VIDEO.DECODER \
    libOMX.TI.DUCATI1.VIDEO.DECODER.secure \
    libOMX.TI.DUCATI1.VIDEO.CAMERA \
    libOMX.TI.DUCATI1.MISC.SAMPLE \
    libstagefrighthw \
    libI420colorconvert \
    libtiutils \
    libcamera \
    libion_ti \
    libomxcameraadapter \
    smc_pa_ctrl \
    tf_daemon \
    libtf_crypto_sst

#$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, $(BOWSER_COMMON_FOLDER)/prebuilt/camera/vendor-camera.mk)
$(call inherit-product-if-exists, $(BOWSER_COMMON_FOLDER)/bcmdhd-wifi/bcmdhd-wifi.mk)
$(call inherit-product-if-exists, $(COMMON_FOLDER)/imgtec/sgx-imgtec-bins-544.mk)

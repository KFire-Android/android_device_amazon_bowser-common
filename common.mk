COMMON_FOLDER := device/amazon/omap4-common
BOWSER_COMMON_FOLDER := device/amazon/bowser-common

$(call inherit-product, $(COMMON_FOLDER)/common.mk)

DEVICE_PACKAGE_OVERLAYS += $(BOWSER_COMMON_FOLDER)/overlay/aosp

# Hardware HALs
PRODUCT_PACKAGES += \
    hwcomposer.bowser \
    lights.bowser \
    power.bowser \
    camera.bowser \
    audio.primary.bowser \
    audio.hdmi.bowser \
    audio.r_submix.default

# BT
PRODUCT_PACKAGES += \
    uim-sysfs \
    libbt-vendor

# Wifi
PRODUCT_PACKAGES += \
    lib_driver_cmd_bcmdhd \
    libnetcmdiface

# Sensors
PRODUCT_PACKAGES += \
    sensors.omap4 \
    libinvensense_hal \
    libmllite \
    libmplmpu \

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \

# Prebuilts
PRODUCT_COPY_FILES += \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/audio_policy.conf:/system/etc/audio_policy.conf \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/media_codecs.xml:/system/etc/media_codecs.xml \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/mixer_paths.xml:/system/etc/mixer_paths.xml \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/smc_normal_world_android_cfg.ini:/system/etc/smc_normal_world_android_cfg.ini \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(BOWSER_COMMON_FOLDER)/prebuilt/usr/idc/AtmelTouch.idc:system/usr/idc/AtmelTouch.idc \
    $(BOWSER_COMMON_FOLDER)/prebuilt/usr/idc/cyttsp4-i2c.idc:system/usr/idc/cyttsp4-i2c.idc \
    $(BOWSER_COMMON_FOLDER)/prebuilt/usr/keylayout/bu52061.kl:system/usr/keylayout/bu52061.kl \
    $(BOWSER_COMMON_FOLDER)/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl\
    $(BOWSER_COMMON_FOLDER)/prebuilt/usr/keylayout/twl6030_pwrbutton.kl:system/usr/keylayout/twl6030_pwrbutton.kl \
    $(BOWSER_COMMON_FOLDER)/prebuilt/vendor/etc/audio_effects.conf:/system/vendor/etc/audio_effects.conf

# Prebuilts /system/etc/bluetooth
PRODUCT_COPY_FILES += \
    $(BOWSER_COMMON_FOLDER)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Recovery
PRODUCT_COPY_FILES += \
    $(BOWSER_COMMON_FOLDER)/twrp.fstab:recovery/root/etc/twrp.fstab

$(call inherit-product-if-exists, vendor/amazon/bowser-common/bowser-common-vendor.mk)

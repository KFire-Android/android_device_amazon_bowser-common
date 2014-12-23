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

# Device settings
PRODUCT_PROPERTY_OVERRIDES += \
    persist.demo.hdmirotationlock=true \
    persist.lab126.touchnoisereject=1 \
    ro.nf.profile=2 \
    ro.nf.level=512 \
    omap.audio.power=PingPong \
    dolby.audio.sink.info=speaker \
    ro.camera.sound.forced=0 \
    ro.camera.video_size=1280x720

# Dalvik VM settings
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heapsize=384m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=8m

# BT
PRODUCT_PACKAGES += \
    uim-sysfs \
    libbt-vendor

# Sensors
PRODUCT_PACKAGES += \
    sensors.omap4 \
    libinvensense_hal \
    libmllite \
    libmplmpu \

# Rootfs
PRODUCT_COPY_FILES += \
    $(BOWSER_COMMON_FOLDER)/init.bowser-common.rc:/root/init.bowser-common.rc

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \

# Prebuilts
PRODUCT_COPY_FILES += \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/audio_policy.conf:/system/etc/audio_policy.conf \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/media_codecs.xml:/system/etc/media_codecs.xml \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/mixer_paths.xml:/system/etc/mixer_paths.xml \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/smc_normal_world_android_cfg.ini:/system/etc/smc_normal_world_android_cfg.ini \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(BOWSER_COMMON_FOLDER)/prebuilt/usr/idc/AtmelTouch.idc:system/usr/idc/AtmelTouch.idc \
    $(BOWSER_COMMON_FOLDER)/prebuilt/usr/idc/cyttsp4-i2c.idc:system/usr/idc/cyttsp4-i2c.idc \
    $(BOWSER_COMMON_FOLDER)/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl\
    $(BOWSER_COMMON_FOLDER)/prebuilt/vendor/etc/audio_effects.conf:/system/vendor/etc/audio_effects.conf

# Prebuilts /system/etc/bluetooth
PRODUCT_COPY_FILES += \
    $(BOWSER_COMMON_FOLDER)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

$(call inherit-product-if-exists, vendor/amazon/bowser-common/bowser-common-vendor.mk)

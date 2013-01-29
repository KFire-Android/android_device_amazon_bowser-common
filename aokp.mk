# Inherit device configuration for AMZ Jem
$(call inherit-product, device/amazon/jem/full_jem.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common_tablet.mk)

DEVICE_PACKAGE_OVERLAYS += device/amazon/jem/overlay/aokp

# Setup device specific product configuration.
PRODUCT_NAME := aokp_jem
PRODUCT_DEVICE := jem
PRODUCT_BRAND := Android
PRODUCT_MODEL := Amazon Kindle Fire
PRODUCT_MANUFACTURER := Amazon
PRODUCT_RELEASE_NAME := KFireHD

PRODUCT_COPY_FILES +=  \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1280_800.zip:system/media/bootanimation.zip


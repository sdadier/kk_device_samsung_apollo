## Specify phone tech before including full_phone

$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
TARGET_SCREEN_HEIGHT := 400
TARGET_SCREEN_WIDTH := 240
$(call inherit-product, vendor/cm/config/mini.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/apollo/full_apollo.mk)

# Overrides
PRODUCT_NAME := cm_apollo
PRODUCT_DEVICE := apollo
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := apollo
PRODUCT_MANUFACTURER := Samsung
PRODUCT_CHARACTERISTICS := phone

PRODUCT_RELEASE_NAME := Galaxy3
PRODUCT_VERSION_DEVICE_SPECIFIC := -apollo

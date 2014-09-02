# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

## Note: this file and all of its includes are parsed before any
## BoardConfig files. 3.0 Kernel & ath6kl configuration must be set here.

# Memory
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true 

# BT
PRODUCT_PACKAGES += \
    bdaddr_read 

# Display
PRODUCT_PACKAGES += \
    gralloc.s5p6442 \
    libGLES_fimg \
    sensors.s5p6442 \
    lights.s5p6442 \
    libhealthd.s5p6442 \
    camera.s5p6442 \
    hwcomposer.s5p6442 \
    libs3cjpeg \
    akmd.free \
    Superuser \
    su

# Media
PRODUCT_PACKAGES += \
    libstagefrighthw 

# Other
PRODUCT_PACKAGES += \
    CMFileManager \
    make_ext4fs \
    setup_fs

# WebKit
PRODUCT_PACKAGES += \
    libwebcore

# Device-specific packages
PRODUCT_PACKAGES += \
    SamsungServiceMode

# Usb accessory
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Webkit (classic webview provider)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.webview.provider=classic

## Hardware properties
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/platform.xml:system/etc/permissions/platform.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml 

## Audio
PRODUCT_PACKAGES += \
    audio_policy.s5p6442 \
    audio.primary.s5p6442 \
    audio.usb.default \
    audio.a2dp.default \
    libaudioutils

# Misc
PRODUCT_PACKAGES += \
    libnetcmdiface

## Other
PRODUCT_PACKAGES += \
    brcm_patchram_plus 

## Media
PRODUCT_COPY_FILES += \
    device/samsung/apollo/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf

## Media Profiles
PRODUCT_COPY_FILES += \
    hardware/samsung/exynos3/s5pc110/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry \
    device/samsung/apollo/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/apollo/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml

## Keymap
PRODUCT_COPY_FILES += \
    device/samsung/apollo/prebuilt/usr/keylayout/qt602240_ts_input.kl:system/usr/keylayout/qt602240_ts_input.kl \
    device/samsung/apollo/prebuilt/usr/keylayout/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl \
    device/samsung/apollo/prebuilt/usr/keylayout/sec_headset.kl:system/usr/keylayout/sec_headset.kl 

## Keychar
PRODUCT_COPY_FILES += \
    device/samsung/apollo/prebuilt/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/samsung/apollo/prebuilt/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/samsung/apollo/prebuilt/usr/keychars/qt602240_ts_input.kcm.bin:system/usr/keychars/qt602240_ts_input.kcm.bin \
    device/samsung/apollo/prebuilt/usr/keychars/s3c-keypad.kcm.bin:system/usr/keychars/s3c-keypad.kcm.bin \
    device/samsung/apollo/prebuilt/usr/keychars/sec_jack.kcm.bin:system/usr/keychars/sec_jack.kcm.bin 

## Touchscreen
PRODUCT_COPY_FILES += \
    device/samsung/apollo/prebuilt/usr/idc/qt602240_ts_input.idc:system/usr/idc/qt602240_ts_input.idc

# ril
PRODUCT_COPY_FILES += \
    device/samsung/apollo/prebuilt/ril/libril.so:system/lib/libril.so \
    device/samsung/apollo/prebuilt/ril/libsec-ril.so:system/lib/libsec-ril.so \
    device/samsung/apollo/prebuilt/ril/rild:system/bin/rild

# GPS conf
PRODUCT_COPY_FILES += \
    device/samsung/apollo/prebuilt/gps/libsecril-client.so:system/lib/libsecril-client.so \
    device/samsung/apollo/prebuilt/gps/libsecgps.so:system/lib/libsecgps.so \
    device/samsung/apollo/prebuilt/gps/gps.s5p6442.so:system/lib/hw/gps.s5p6442.so \
    device/samsung/apollo/prebuilt/etc/gps.conf:system/etc/gps.conf

## Camera
PRODUCT_COPY_FILES += \
    device/samsung/apollo/prebuilt/camera/libsamsungcamera.so:system/lib/vendor-camera \
    device/samsung/apollo/prebuilt/camera/libsecjpeg.so:system/lib/libsecjpeg.so

# bluetooth
PRODUCT_COPY_FILES += \
        device/samsung/apollo/prebuilt/bluetooth/bcm4329.hcd:system/vendor/firmware/bcm4329.hcd

# wifi
PRODUCT_COPY_FILES += \
        device/samsung/apollo/prebuilt/wifi/bcm4329_aps.bin:system/etc/wifi/bcm4329_aps.bin \
        device/samsung/apollo/prebuilt/wifi/bcm4329_mfg.bin:system/etc/wifi/bcm4329_mfg.bin \
        device/samsung/apollo/prebuilt/wifi/bcm4329_sta.bin:system/etc/wifi/bcm4329_sta.bin \
        device/samsung/apollo/prebuilt/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
        device/samsung/apollo/prebuilt/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt 
#	device/samsung/apollo/prebuilt/etc/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
#	device/samsung/apollo/prebuilt/etc/nvram_net.txt:system/etc/wifi/nvram_net.txt \
#	device/samsung/apollo/prebuilt/etc/fw_bcm4329.bin:system/etc/wifi/fw_bcm4329.bin \
#	device/samsung/apollo/prebuilt/etc/fw_bcm4329_apsta.bin:system/etc/wifi/fw_bcm4329_apsta.bin 

#	device/samsung/apollo/prebuilt/etc/wifi.conf:system/etc/wifi/wifi.conf

# SELinux
BOARD_SEPOLICY_DIRS += device/samsung/apollo/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts

### BEGIN: Common properties

# Dalvik
#PRODUCT_PROPERTY_OVERRIDES += \
#    dalvik.vm.dexopt-flags=m=y \
#    dalvik.vm.execution-mode=int:jit \
#    dalvik.vm.heapsize=32m 
#    dalvik.vm.jit.codecachesize=0 \
#    dalvik.vm.dexopt-flags=v=a,o=v,m=y,u=y

## Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.checkjni=false \
    dalvik.vm.checkjni=0 \
    dalvik.vm.debug.alloc=0 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.execution-mode=int:fast \
    dalvik.vm.jit.codecachesize=0 

#   dalvik.vm.dexopt-flags=v=a,o=v,m=y,u=y \
#    dalvik.vm.heapstartsize=4m \
#    dalvik.vm.heapgrowthlimit=24m \
#    dalvik.vm.heapsize=48m \
#    dalvik.vm.execution-mode=int:jit


## Development & ADB authentication settings
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.debuggable=1 \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=0

#    persis.sys.prefer_16bpp=1 \
#    debug.enabletr=false \
#    debug.hwui.render_dirty_regions=false \
#    persist.sys.strictmode.visual=false \
#    ro.bq.gpu_to_cpu_unsupported=1 \
#    debug.sf.no_hw_vsync=1 \
#    debug.hwui.print_config=true <
#    persist.sys.force_highendgfx=true \
#    ro.opengles.surface.rgb565=true \
#    ro.systemui.use_gl_wallpaper=0

## Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    debug.sf.no_hw_vsync=1 \
    debug.gr.numframebuffers=2 \
    persist.sys.prefer_16bpp=1 \
    persist.sys.use_dithering=0 \
    ro.systemui.use_gl_wallpaper=0 \
    ro.zygote.disable_gl_preload=true \
    ro.hwui.layer_cache_size=0 \
    debug.hwui.render_dirty_regions=false \
    persist.sys.disable_zram=1 

## Loop ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.delay=3000 \
    ro.telephony.call_ring.multiple=false

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

## Other
PRODUCT_PROPERTY_OVERRIDES += \
    DEVICE_PROVISIONED=1 \
    dev.sfbootcomplete=0 \
    ro.config.play.bootsound=0 \
    ro.setupwizard.enable_bypass=1

## RIL, telephony
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=ApolloRIL \
    ro.telephony.ril.v3=icccardstatus,datacall,signalstrength,facilitylock \
    ro.telephony.sends_barcount=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2 \
    ro.ril.enable.managed.roaming=1 \
    mobiledata.interfaces=pdp0,eth0,gprs,ppp0 \
    persist.sys.led_trigger=none \
    ro.telephony.default_network=0 

## SELinux - we're not ready for enforcing mode yet
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=disabled

## USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.service.adb.enable=1 \
    persist.sys.usb.config=adb,mass_storage \
    ro.vold.umsdirtyratio=20

## WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.ap.interface=wl0.1 \
    wifi.interface=eth0  \
    wifi.supplicant_scan_interval=60

# Stagefright
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=false \
    media.stagefright.enable-scan=false \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

### END: Common properties

# Install/Uninstall google apps
MINI_GAPPS := true
$(call inherit-product, vendor/google/gapps_armv6_tiny.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Common assets
PRODUCT_AAPT_CONFIG := ldpi mdpi normal
PRODUCT_LOCALES := en_US en_IN fr_FR it_IT es_ES et_EE de_DE nl_NL cs_CZ \
    pl_PL ja_JP zh_TW zh_CN zh_HK ru_RU ko_KR nb_NO es_US da_DK el_GR tr_TR \
    pt_PT pt_BR rm_CH sv_SE bg_BG ca_ES en_GB fi_FI hr_HR hu_HU in_ID iw_IL \
    lt_LT lv_LV ro_RO sk_SK sl_SI sr_RS uk_UA vi_VN tl_PH ar_EG fa_IR sw_TZ \
    ms_MY af_ZA zu_ZA en_XA ar_XB fr_CA mn_MN hy_AM az_AZ ka_GE

# Half-res bootanimation : TARGET_BOOTANIMATION_HALF_RES := true

## MDPI assets
PRODUCT_AAPT_CONFIG := normal mdpi ldpi
PRODUCT_AAPT_PREF_CONFIG := ldpi

## Inherit overlays
$(call inherit-product, device/ldpi-common/ldpi.mk)
DEVICE_PACKAGE_OVERLAYS += device/samsung/apollo/overlay

# GPS
$(call inherit-product, device/common/gps/gps_eu_supl.mk)


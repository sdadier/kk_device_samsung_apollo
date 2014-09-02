# Copyright (C) 2007 The Android Open Source Project
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

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

# Target
TARGET_ARCH            					:= arm
TARGET_ARCH_LOWMEM     					:= true
TARGET_ARCH_VARIANT    					:= armv6-vfp
TARGET_ARCH_VARIANT_CPU 				:= arm1176jzf-s
TARGET_BOARD_PLATFORM  					:= s5p6442
TARGET_ARCH_VARIANT_FPU 				:= vfp
TARGET_CPU_ABI         					:= armeabi
TARGET_CPU_ABI2        					:= armeabi-v6l
TARGET_CPU_VARIANT     					:= arm11
TARGET_NO_BOOTLOADER   					:= true
TARGET_NO_RADIOIMAGE   					:= true
ARCH_ARM_HAVE_VFP      					:= true
ARCH_ARM_HAVE_TLS_REGISTER 				:= true

# Kernel ramdisk compression tool
MINIGZIP								:= $(shell which lzma)

# Kernel source
#TARGET_KERNEL_CUSTOM_TOOLCHAIN				:= arm-eabi-4.10
TARGET_KERNEL_SOURCE					:= kernel/samsung/apollo-2.6.32
TARGET_SPECIFIC_HEADER_PATH				:= device/samsung/apollo/include
TARGET_KERNEL_CONFIG					:= apollo-2.6.32_defconfig
BOARD_KERNEL_BASE						:= 0x22000000
BOARD_KERNEL_PAGESIZE 					:= 4096
#TARGET_PREBUILT_KERNEL 				:= device/samsung/apollo/kernel
TARGET_NO_SEPARATE_RECOVERY				:= true
TARGET_PROVIDES_INIT_TARGET_RC				:= true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK			:= true

# Custom bootimg (recovery merged into boot ramdisk)
BOARD_CUSTOM_BOOTIMG_MK					:= device/samsung/apollo/apollo-bootimg.mk

# Graphics
TARGET_BOARD_PLATFORM_GPU 				:= fimg
BOARD_USE_LEGACY_TOUCHSCREEN			:= true
BOARD_EGL_CFG							:= device/samsung/apollo/egl.cfg
#USE_OPENGL_RENDERER					:= true
#BOARD_GPU_DRIVERS					:= openfimg
#BOARD_EGL_NEEDS_LEGACY_FB 				:= true
#BOARD_FRAMEBUFFER_FORCE_FORMAT 			:= HAL_PIXEL_FORMAT_RGB_565
BOARD_USE_BGRA_8888             		        := true
BOARD_USE_MHEAP_SCREENSHOT 				:= true
BOARD_USE_NASTY_PTHREAD_CREATE_HACK 			:= true
BOARD_EGL_WORKAROUND_BUG_10194508 			:= true
#TARGET_DOESNT_USE_FENCE_SYNC				:= true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE 			:= true
TARGET_AVOID_DRAW_TEXTURE_EXTENSION 			:= true
TARGET_NO_HW_VSYNC 					:= true
COMMON_GLOBAL_CFLAGS 					+= -DBINDER_COMPAT
#COMMON_GLOBAL_CFLAGS					+= -DNO_RGBX_8888
#COMMON_GLOBAL_CFLAGS					+= -DEGL_NEEDS_FNW
HWUI_COMPILE_FOR_PERF                   := true

# Javascript, Browser and Webkit
WITH_JIT                				:= true
ENABLE_JSC_JIT          				:= true
JS_ENGINE               				:= v8
HTTP                    				:= chrome
TARGET_FORCE_CPU_UPLOAD 				:= true

## Webkit
ENABLE_WEBGL 						:= true
TARGET_WEBKIT_USE_MORE_MEMORY 				:= true
BOARD_USE_SKIA_LCDTEXT 					:= true

## Fonts
MINIMAL_FONT_FOOTPRINT 					:= true

## Camera
USE_CAMERA_STUB 					:= false
#TARGET_DISABLE_ARM_PIE        	  			:= true
BOARD_NEEDS_MEMORYHEAPPMEM      			:= true
BOARD_CAMERA_DEVICE 					:= /dev/video0
COMMON_GLOBAL_CFLAGS					+= -DNEEDS_VECTORIMPL_SYMBOLS

## Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES 				:= libhealthd.s5p6442

# TARGET_DISABLE_TRIPLE_BUFFERING can be used to disable triple buffering
# on per target basis. On crespo it is possible to do so in theory
# to save memory, however, there are currently some limitations in the
# OpenGL ES driver that in conjunction with disable triple-buffering
# would hurt performance significantly (see b/6016711)
# TARGET_DISABLE_TRIPLE_BUFFERING := true

## Wi-Fi
USE_LEGACY_SOFTAP                			:= true
WPA_SUPPLICANT_VERSION     		      		:= VER_0_8_X
BOARD_WLAN_DEVICE                			:= bcm4329
BOARD_WPA_SUPPLICANT_DRIVER      			:= WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB 			:= lib_driver_cmd_wext
WIFI_DRIVER_MODULE_PATH          			:= "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_MODULE_ARG         		  		:= "firmware_path=/system/etc/wifi/bcm4329_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt dhd_watchdog_ms=10 dhd_poll=1"
WIFI_DRIVER_MODULE_NAME          			:= "bcm4329"
WIFI_DRIVER_FW_PATH_STA 	 				:= "/system/etc/wifi/bcm4329_sta.bin"
WIFI_DRIVER_FW_PATH_AP		 				:= "/system/etc/wifi/bcm4329_aps.bin"
WIFI_DRIVER_FW_PATH_P2P						:= "/system/etc/wifi/bcm4329_aps.bin"
WIFI_DRIVER_FW_PATH_PARAM       	 		:= "/sys/module/bcm4329/parameters/firmware_path"
BOARD_WLAN_DEVICE_REV            			:= bcm4329
WIFI_BAND                        			:= 802_11_ABG
BOARD_LEGACY_NL80211_STA_EVENTS  			:= true

#BOARD_WPA_SUPPLICANT_DRIVER			:= WEXT
#WPA_SUPPLICANT_VERSION				:= VER_0_8_X
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB		:= lib_driver_cmd_bcmdhd
#BOARD_WLAN_DEVICE					:= bcmdhd
#BOARD_WLAN_DEVICE_REV				:= bcm4329
#WIFI_DRIVER_MODULE_PATH				:= "/system/lib/modules/bcmdhd.ko"
#WIFI_DRIVER_FW_PATH_AP				:= "/system/etc/wifi/bcm4329_aps.bin"
#WIFI_DRIVER_FW_PATH_STA				:= "/system/etc/wifi/bcm4329_sta.bin"
#WIFI_DRIVER_FW_PATH_P2P				:= "/system/etc/wifi/bcm4329_aps.bin"
#WIFI_DRIVER_MODULE_ARG				:= "firmware_path=/system/etc/wifi/bcm4329_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt dhd_watchdog_ms=10 dhd_poll=1"
#WIFI_DRIVER_MODULE_NAME				:= "bcmdhd"

## RIL
TARGET_PROVIDES_LIBRIL 					:= true
BOARD_USES_LEGACY_RIL 					:= true
BOARD_FORCE_RILD_AS_ROOT 				:= true
BOARD_MOBILEDATA_INTERFACE_NAME 			:= "pdp0"
BOARD_RIL_CLASS 					:= ../../../device/samsung/apollo/ril/
BOARD_USES_FROYO_RILCLIENT 				:= true

## UMS
TARGET_USE_CUSTOM_LUN_FILE_PATH 			:= "/sys/devices/platform/s3c-usbgadget/gadget/lun0/file"
BOARD_UMS_LUNFILE 					:= /sys/devices/platform/s3c-usbgadget/gadget/lun0/file
BOARD_USE_USB_MASS_STORAGE_SWITCH 			:= true

# Bluetooth
BOARD_HAVE_BLUETOOTH 					:= true
BOARD_HAVE_BLUETOOTH_BCM 				:= true
BOARD_HAVE_SAMSUNG_BLUETOOTH			:= true
#BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR 		:= device/samsung/apollo/bluetooth
BOARD_BLUEDROID_VENDOR_CONF 				:= device/samsung/apollo/libbt_vndcfg.txt

## Device specific libs
TARGET_PROVIDES_LIBAUDIO 				:= true
TARGET_PROVIDES_LIBLIGHT 				:= true

## Audio: combo device supported
BOARD_COMBO_DEVICE_SUPPORTED 				:= true

## Samsung has weird framebuffer
TARGET_NO_INITLOGO 					:= true

## Fix colors in panorama mode
BOARD_CPU_COLOR_CONVERT 				:= true

## Recovery
TARGET_RECOVERY_LCD_BACKLIGHT_PATH			:=  \"/sys/class/leds/lcd-backlight/brightness\"
BOARD_USES_BML_OVER_MTD					:= true
#BOARD_RECOVERY_SWIPE                    		:= true
BOARD_USES_BOOTMENU 					:= false
BOARD_PROVIDES_BOOTMODE 				:= true
BOARD_CUSTOM_RECOVERY_KEYMAPPING 			:= ../../device/samsung/apollo/recovery/recovery_keys.c
BOARD_HAS_DATADATA 					:= false
BOARD_SDEXT_DEVICE 					:= /dev/block/mmcblk0p2
BOARD_SDEXT_FILESYSTEM 					:= auto
BOARD_HAS_PARAMFS 					:= false
BOARD_HAS_SDCARD_INTERNAL 				:= false
BOARD_HAS_DOWNLOAD_MODE 				:= true
BOARD_RECOVERY_IGNORE_BOOTABLES 			:= true
BOARD_LDPI_RECOVERY 					:= true
#BOARD_RECOVERY_HANDLES_MOUNT 				:= true
TARGET_ROOT_IS_RECOVERY 				:= true
TARGET_RECOVERY_FSTAB 					:= device/samsung/apollo/ramdisk/fstab.apollo
TARGET_NO_SEPARATE_RECOVERY				:= true
RECOVERY_FSTAB_VERSION 					:= 2

## Bootanimation
TARGET_BOOTANIMATION_PRELOAD 				:= true
TARGET_BOOTANIMATION_TEXTURE_CACHE 			:= true

TARGET_OTA_EXTRAS_FILE 					:= device/samsung/apollo/releasetools-extras-tiny.txt

## Kernel, bootloader
TARGET_BOOTLOADER_BOARD_NAME 				:= apollo
TARGET_OTA_ASSERT_DEVICE 				:= apollo

## Recovery
TARGET_RECOVERY_PIXEL_FORMAT 				:= BGRA_8888
BOARD_LDPI_RECOVERY 					:= true
BOARD_USE_CUSTOM_RECOVERY_FONT 				:= "<font_7x16.h>"

## TEMPORARY HACK: skip building external/chromium_org/
PRODUCT_PREBUILT_WEBVIEWCHROMIUM 			:= yes



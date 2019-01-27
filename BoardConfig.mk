#
# Copyright (C) 2017-2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PATH := device/samsung/a5ultexx

# Includes
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Architecture/platform
TARGET_ARCH := arm
BOARD_VENDOR := samsung
FORCE_32_BIT := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv8-a
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno306
TARGET_CPU_CORTEX_A53 := true
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a53
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Asserts
TARGET_OTA_ASSERT_DEVICE := a5ulte,a5ultexx,a5lte,a53gxx,a53g,a5ltexx,a5ltedd,a5ultektt,a5ultelgt,a5lteub,a5ultekx,a5ulteskt,a5ultebmc,a5ultedv,a5ltezt

# Audio
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_SND_MONITOR := true
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_GENERIC_AUDIO := true
TARGET_USES_QCOM_MM_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1
USE_CUSTOM_MIXER_PATHS := true
USE_CUSTOM_AUDIO_PLATFORM_INFO := true

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_BTNV := true
BLUETOOTH_HCI_USE_MCT := true

# Bootloader
TARGET_NO_BOOTLOADER := true

# Camera
BOARD_CAMERA_SENSORS := imx135 s5k5e3yx
BOARD_GLOBAL_CFLAGS += -DMETADATA_CAMERA_SOURCE
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_PROVIDES_CAMERA_HAL := true
TARGET_USE_VENDOR_CAMERA_EXT := true
TARGET_USES_QTI_CAMERA_DEVICE := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# Compile libhwui in performance mode
HWUI_COMPILE_FOR_PERF := true

# Dexpreopt
ifeq ($(HOST_OS),linux)
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false
      WITH_DEXPREOPT := true
endif

# Display
OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U | 0x02000000U
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true

# Exclude serif fonts for saving system.img size.
EXCLUDE_SERIF_FONTS := true

# Encryption
TARGET_HW_DISK_ENCRYPTION := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# FM
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
TARGET_QCOM_NO_FM_FIRMWARE := true
BOARD_HAVE_QCOM_FM := true

# GPS
TARGET_NO_RPC := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_a5

# Kernel
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_DTBTOOL_ARGS := -2
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=enforcing
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_SOURCE := kernel/samsung/msm8916
TARGET_KERNEL_CONFIG := msm8916_sec_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8916_sec_a5u_eur_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig

# Kernel - Toolchain
KERNEL_TOOLCHAIN := $(PWD)/prebuilts/gcc/linux-x86/arm/arm-eabi-7.2/bin
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Malloc implementation
MALLOC_SVELTE := true

# Media
TARGET_QCOM_MEDIA_VARIANT := caf
TARGET_USES_MEDIA_EXTENSIONS := true

# Network Routing
TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE := true

# Partition sizes/ Filesystems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 13631488
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 167286400
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_PERSISTIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2336096256
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12775813120
BOARD_FLASH_BLOCK_SIZE := 131072

# Legacy BLOB Support
TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/bin/mediaserver=23 \
    /system/bin/mm-qcamera-daemon=23 \
    /system/vendor/bin/hw/rild=27

# Power
TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(DEVICE_PATH)/power/power_ext.c

# Qcom
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# RIL
TARGET_RIL_VARIANT := caf
BOARD_PROVIDES_LIBRIL := true

# SELinux
include device/qcom/sepolicy-legacy/sepolicy.mk
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Manifest
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

# Security patch
VENDOR_SECURITY_PATCH := 2017-08-01

# Shims
TARGET_LD_SHIM_LIBS := \
    /system/lib/libmmjpeg_interface.so|libboringssl-compat.so \
    /system/lib/libsec-ril.so|libsec-ril_shim.so \
    /system/lib/libsec-ril-dsds.so|libsec-ril_shim.so \
    /system/vendor/lib/libizat_core.so|libizat_core_shim.so \
    /system/vendor/lib/libqomx_jpegenc.so|libboringssl-compat.so

# Vold
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_MAX_PARTITIONS := 65
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wi-Fi
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_PROVIDES_WCNSS_QMI := true
PRODUCT_VENDOR_MOVE_ENABLED := true
TARGET_DISABLE_WCNSS_CONFIG_COPY := true
TARGET_USES_QCOM_WCNSS_QMI := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_HIDL_FEATURE_DISABLE_AP_MAC_RANDOMIZATION := true

# Inherit from proprietary files
include vendor/samsung/a5ultexx/BoardConfigVendor.mk

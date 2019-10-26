#
# Copyright (C) 2017-2018 The LineageOS Project
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
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_PATH := device/samsung/a5ultexx

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay
PRODUCT_ENFORCE_RRO_TARGETS := framework-res

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

# AdvancedDisplay
PRODUCT_PACKAGES += \
    AdvancedDisplay

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_amplifier.msm8916 \
    audio.primary.msm8916 \
    audio.primary.default \
    audio.r_submix.default \
    audio.usb.default \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libaudio-resampler \
    tinymix \
    tinypcminfo \
    tinyplay \
    tinycap \
    libtinycompress

# Audio configuration file
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/acdb/Bluetooth_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/Bluetooth_cal.acdb \
    $(DEVICE_PATH)/audio/acdb/General_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/General_cal.acdb \
    $(DEVICE_PATH)/audio/acdb/Global_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/Global_cal.acdb \
    $(DEVICE_PATH)/audio/acdb/Handset_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/Handset_cal.acdb \
    $(DEVICE_PATH)/audio/acdb/Hdmi_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/Hdmi_cal.acdb \
    $(DEVICE_PATH)/audio/acdb/Headset_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/Headset_cal.acdb \
    $(DEVICE_PATH)/audio/acdb/Speaker_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/Speaker_cal.acdb \
    $(DEVICE_PATH)/audio/Tfa9895.cnt:$(TARGET_COPY_OUT_SYSTEM)/etc/Tfa9895.cnt \
    $(DEVICE_PATH)/audio/audio_effects.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_effects.conf \
    $(DEVICE_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(DEVICE_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(DEVICE_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml 

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor

# BoringSSL Hacks
PRODUCT_PACKAGES += \
    libboringssl-compat

# Camera
PRODUCT_PACKAGES += \
    camera.msm8916 \
    Snap

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/external_camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/external_camera_config.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

# Display
PRODUCT_PACKAGES += \
    gralloc.msm8916 \
    hwcomposer.msm8916 \
    libgenlock \
    libtinyxml \
    memtrack.msm8916 \
    copybit.msm8916 \
    libjni_livedisplay

# Doze
PRODUCT_PACKAGES += \
    SamsungDoze

# Exclude AudioFX
TARGET_EXCLUDES_AUDIOFX := true

# FM
PRODUCT_PACKAGES += \
    FMRadio \
    qcom.fmradio

# FS
PRODUCT_PACKAGES += \
    fsck.f2fs \
    mkfs.f2fs

# GPS Configs
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/gps/flp.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/flp.conf \
    $(DEVICE_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/gps.conf \
    $(DEVICE_PATH)/configs/gps/izat.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/izat.conf \
    $(DEVICE_PATH)/configs/gps/sap.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/sap.conf

# GPS
PRODUCT_PACKAGES += \
    com.android.location.provider \
    com.android.location.provider.xml \
    gps.msm8916 \
    libizat_core_shim

# Keylayout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/keylayout/sec_touchkey.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_touchkey.kl \
    $(DEVICE_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    $(DEVICE_PATH)/keylayout/Synaptics_HID_TouchPad.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/Synaptics_HID_TouchPad.idc \
    $(DEVICE_PATH)/keylayout/Synaptics_RMI4_TouchPad_Sensor.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/Synaptics_RMI4_TouchPad_Sensor.idc

# Keymaster
PRODUCT_PACKAGES += \
    keystore.msm8916

# Lights
PRODUCT_PACKAGES += \
    lights.msm8916

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Media
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    $(DEVICE_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml

# Misc
PRODUCT_PACKAGES += \
    curl \
    libbson \
    libcurl \
    libkeyutils \
    tcpdump

# NFC
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/nfc/nfcee_access.xml:$(TARGET_COPY_OUT_VENDOR)/etc/nfcee_access.xml \
    $(DEVICE_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(DEVICE_PATH)/configs/nfc/libnfc-sec-hal.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/libnfc-sec-hal.conf

PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag \
    com.android.nfc_extras

# Permissions
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.dsi.ant.antradio_library.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.live_wallpaper.xml

# Radio
PRODUCT_PACKAGES += \
    libsec-ril_shim \
    libsecnativefeature \
    libxml2 \
    libcnefeatureconfig \
    librmnetctl \
    macloader

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.class_main.sh \
    init.qcom.early_boot.sh \
    init.qcom.fm.sh \
    init.qcom.post_boot.sh \
    init.qcom.rc \
    init.qcom.sh \
    init.qcom.uicc.sh \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    init.qcom.recovery.rc \
    ueventd.qcom.rc

# RIL
PRODUCT_PACKAGES += \
    libril \
    librilutils \
    rild

# Seccomp
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

# Security configuration file
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/sec_config:$(TARGET_COPY_OUT_SYSTEM)/etc/sec_config

# Sensor HAL
PRODUCT_PACKAGES += \
    sensors.msm8916

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/sensors/_hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/_hals.conf

# Telephony
PRODUCT_PACKAGES += \
    qti-telephony-common \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Shipping API level (for CTS backward compatibility)
PRODUCT_SHIPPING_API_LEVEL := 19

# System Properties
$(call inherit-product, device/samsung/a5ultexx/system_prop.mk)

# Thermal
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf

# Touch issue workaround
PRODUCT_PACKAGES += \
    InputDisabler

# Wi-Fi
PRODUCT_PACKAGES += \
    libwcnss_qmi \
    wcnss_service \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(DEVICE_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(DEVICE_PATH)/configs/wifi/WCNSS_cfg.dat:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_cfg.dat \
    $(DEVICE_PATH)/configs/wifi/WCNSS_qcom_wlan_nv.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Inherit from vendor
$(call inherit-product-if-exists, vendor/samsung/a5ultexx/a5ultexx-vendor.mk)

# Inhert dalvik heap values from aosp
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

###===============================================######
##HIDL packages

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.audio.effect@2.0-service

# A2DP
PRODUCT_PACKAGES += \
    android.hardware.bluetooth.a2dp@1.0-impl \
    android.hardware.bluetooth.a2dp@1.0-service

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    camera.device@3.2-impl

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    android.hardware.gnss@1.0-service

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service

# Live Display
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service.samsung-qcom

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl \
    android.hardware.nfc@1.0-service

# Power HAL
PRODUCT_PACKAGES += \
    android.hardware.power@1.1-service-qti

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl \
    android.hardware.renderscript@1.0-service

# Sensor HAL
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@1.0-service

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.a5-common

# Trust
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service

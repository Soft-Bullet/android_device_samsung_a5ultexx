# RIL
PRODUCT_PROPERTY_OVERRIDES += \
      rild.libpath=/system/vendor/lib/libsec-ril.so \
      persist.radio.rat_on=combine \
      ril.subscription.types=NV,RUIM \
      ro.ril.telephony.nstrings=7 \
      ro.telephony.default_network=9 \
      ro.product_ship=true \
      ro.ril.transmitpower=true \
      persist.radio.add_power_save=1 \
      persist.radio.no_wait_for_card=1 \
      persist.radio.apm_sim_not_pwdn=1 \
      persist.radio.use_se_table_only=1 \
      persist.radio.jbims=1 \
      telephony.lteOnGsmDevice=1 \
      ro.ril.telephony.mqanelements=6 \
      ro.telephony.call_ring.multiple=0 \
      ro.telephony.ril.config=simactivation

# Netmgrd
PRODUCT_PROPERTY_OVERRIDES += \
     ro.use_data_netmgrd=false \
     persist.data.netmgrd.qos.enable=false

# Display
PRODUCT_PROPERTY_OVERRIDES += \
      ro.sf.lcd_density=320 \
      debug.sf.gpu_comp_tiling=1 \
      debug.composition.type=c2d \
      debug.mdpcomp.idletime=600 \
      persist.hwc.mdpcomp.enable=true \
      persist.hwc.ptor.enable=true \
      debug.sf.enable_gl_backpressure=1 \
      debug.enable.sglscale=1 \
      ro.surface_flinger.use_vr_flinger=false \
      ro.surface_flinger.protected_contents=true \
      ro.surface_flinger.use_smart_90_for_video=true \
      ro.surface_flinger.set_display_power_timer_ms=10000 \
      ro.surface_flinger.set_touch_timer_ms=5000 \
      ro.surface_flinger.set_idle_timer_ms=9000 \
      ro.opengles.version=196608 \
      debug.hwui.use_buffer_age=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3

# Enable EGL image tracking on SF for b/137514000
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.enable_egl_image_tracker=1

# Bug: 68943050
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.latch_unsignaled=1

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
      ro.config.max_starting_bg=8 \
      ro.vendor.extension_library=libqti-perfd-client.so \
      ro.core_ctl_min_cpu=0 \
      ro.core_ctl_max_cpu=4 \
      ro.min_freq_0=800000

# Boot
PRODUCT_PROPERTY_OVERRIDES += \
    sys.vendor.shutdown.waittime=500 \
    ro.build.shutdown_timeout=0

# Audio offload
PRODUCT_PROPERTY_OVERRIDES += \
      vendor.audio.tunnel.encode=false \
      qcom.hw.aac.encoder=false \
      vendor.audio.offload.buffer.size.kb=32 \
      vendor.audio.offload.gapless.enabled=true \
      audio.offload.min.duration.secs=30

# Fluence
PRODUCT_PROPERTY_OVERRIDES += \
     persist.vendor.audio.fluence.speaker=true \
     persist.vendor.audio.fluence.voicecall=true \
     persist.vendor.audio.fluence.voicerec=false \
     ro.vendor.audio.sdk.fluencetype=none \
     ro.vendor.audio.sdk.ssr=false \
     persist.audio.dirac.speaker=true

# Audio voice recording
PRODUCT_PROPERTY_OVERRIDES += \
     vendor.voice.path.for.pcm.voip=true \
     vendor.voice.playback.conc.disabled=true \
     vendor.voice.record.conc.disabled=true \
     vendor.voice.record.conc.disabled=true \
     vendor.voice.voip.conc.disabled=true

# Media
PRODUCT_PROPERTY_OVERRIDES += \
     debug.stagefright.ccodec=0 \
     debug.stagefright.omx_default_rank=0 \
     debug.stagefright.omx_default_rank.sw-audio=1 \
     vendor.mediacodec.binder.size=6 \
     mm.enable.smoothstreaming=true \
     drm.service.enabled=1 \
     vidc.enc.narrow.searchrange=1\
     media.aac_51_output_enabled=true \
     media.stagefright.legacyencoder=true \
     media.stagefright.less-secure=true \
     ro.config.vc_call_vol_steps=15 \
     ro.config.media_vol_steps=25

# Memory optimizations
PRODUCT_PROPERTY_OVERRIDES += \
     ro.vendor.qti.sys.fw.bservice_enable=true \
     ro.vendor.qti.am.reschedule_service=true

# Wi-Fi
PRODUCT_PROPERTY_OVERRIDES += \
     wifi.interface=wlan0 \
     wifi.direct.interface=p2p0

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
     persist.bluetooth.bluetooth_audio_hal.disabled=true \
     ro.qualcomm.bt.hci_transport=smd \
     vendor.qcom.bluetooth.soc=pronto \
     ro.qualcomm.bluetooth.ftp=true \
     ro.qualcomm.bluetooth.hfp=true \
     ro.qualcomm.bluetooth.hsp=true \
     ro.qualcomm.bluetooth.map=true \
     ro.qualcomm.bluetooth.nap=true \
     ro.qualcomm.bluetooth.opp=true \
     ro.qualcomm.bluetooth.pbap=true \
     qcom.bluetooth.soc=smd \
     ro.bluetooth.dun=true \
     ro.bluetooth.hfp.ver=1.7 \
     ro.bluetooth.sap=true \
     bluetooth.hfp.client=1

# NFC
PRODUCT_PROPERTY_OVERRIDES += \
     ro.nfc.fw_dl_on_boot=false

# Misc.
PRODUCT_PROPERTY_OVERRIDES += \
     ro.chipname=MSM8916 \
     ro.warmboot.capability=1 \
     ro.qualcomm.cabl=0 \
     ro.qualcomm.svi=1 \

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
     persist.loc.nlp_name=com.qualcomm.location \
     ro.qc.sdk.izat.premium_enabled=0 \
     ro.qc.sdk.izat.service_mask=0x0 \
     persist.gps.qmienabled=true \
     persist.gps.qc_nlp_in_use=1 \
     ro.gps.agps_provider=1 \
     ro.pip.gated=0

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
      persist.hwc.mdpcomp.enable=true \
      debug.composition.type=c2d \
      debug.mdpcomp.logs=0 \
      debug.sf.hw=1 \
      debug.egl.hw=1

# Time
PRODUCT_PROPERTY_OVERRIDES += \
     persist.timed.enable=true

# Misc.
PRODUCT_PROPERTY_OVERRIDES += \
     dalvik.vm.dex2oat-flags=--no-watch-dog

# Treble Misc.
PRODUCT_PROPERTY_OVERRIDES += \
     camera.disable_treble=true

# ZRAM
PRODUCT_PROPERTY_OVERRIDES += \
     ro.config.zram=true

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
     debug.camcorder.disablemeta=true

# WiDi
PRODUCT_PROPERTY_OVERRIDES += \
     persist.debug.wfd.enable=1 \
     persist.sys.wfd.virtual=0
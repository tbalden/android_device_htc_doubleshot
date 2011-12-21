#
# Copyright (C) 2011 The CyanogenMod Project
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

# First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_COPY_FILES += \
    device/htc/doubleshot/init:root/init \
    device/htc/doubleshot/init.doubleshot.rc:root/init.doubleshot.rc \
    device/htc/doubleshot/init.doubleshot.usb.rc:root/init.doubleshot.usb.rc \
    device/htc/doubleshot/init.rc:root/init.rc \
    device/htc/doubleshot/ueventd.doubleshot.rc:root/ueventd.doubleshot.rc \
    device/htc/doubleshot/ueventd.rc:root/ueventd.rc


#Toushcreen config files
PRODUCT_COPY_FILES += \
    device/htc/doubleshot/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \

#Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/doubleshot/doubleshot-vendor.mk)

#Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    keyguard.no_require_sim=true \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# Disable visual strict mode, even on eng builds
PRODUCT_DEFAULT_PROPERTY += \
persist.sys.strictmode.visual=0

DEVICE_PACKAGE_OVERLAYS += device/htc/doubleshot/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \

# GSM voicemail config xml file
PRODUCT_COPY_FILES += \
    device/htc/doubleshot/voicemail-conf.xml:system/etc/voicemail-conf.xml

PRODUCT_PACKAGES += \
    librpc.msm7x30 \
    lights.msm7x30 \
    sensors.doubleshot \
    overlay.default \
    hwcomposer.default \
    gralloc.msm8660 \
    audio_policy.msm7x30 \
    audio.primary.msm7x30 \
    audio.a2dp.default \
    gps.doubleshot

# missing packages
PRODUCT_PACKAGES += \
    Mms \
    Stk \
    Superuser

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/doubleshot/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/doubleshot/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/doubleshot/keychars/doubleshot-keypad.kcm.bin:system/usr/keychars/doubleshot-keypad.kcm.bin \
    device/htc/doubleshot/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/doubleshot/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/doubleshot/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/doubleshot/keylayout/doubleshot-keypad.kl:system/usr/keylayout/doubleshot-keypad.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/doubleshot/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/doubleshot/firmware/vidc_1080p.fw:system/etc/firmware/vidc_1080p.fw \
    device/htc/doubleshot/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/htc/doubleshot/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
    device/htc/doubleshot/gps.conf:system/etc/gps.conf

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/doubleshot/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/doubleshot/dsp/AIC3254_REG_XD.csv:system/etc/AIC3254_REG_XD.csv \
    device/htc/doubleshot/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/doubleshot/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/doubleshot/dsp/HP_Audio.csv:system/etc/HP_Audio.csv \
    device/htc/doubleshot/dsp/HP_Video.csv:system/etc/HP_Video.csv \
    device/htc/doubleshot/dsp/SPK_Combination.csv:system/etc/SPK_Combination.csv \
    device/htc/doubleshot/dsp/soundimage/Sound_Bass_Booster.txt:system/etc/soundimage/Sound_Bass_Booster.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Blues.txt:system/etc/soundimage/Sound_Blues.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Classical.txt:system/etc/soundimage/Sound_Classical.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Country.txt:system/etc/soundimage/Sound_Country.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Dolby_A_HP.txt:system/etc/soundimage/Sound_Dolby_A_HP.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Dolby_A_SPK.txt:system/etc/soundimage/Sound_Dolby_A_SPK.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Dolby_V_HP.txt:system/etc/soundimage/Sound_Dolby_V_HP.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Dolby_V_SPK.txt:system/etc/soundimage/Sound_Dolby_V_SPK.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Dualmic.txt:system/etc/soundimage/Sound_Dualmic.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Dualmic_EP.txt:system/etc/soundimage/Sound_Dualmic_EP.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Dualmic_SPK.txt:system/etc/soundimage/Sound_Dualmic_SPK.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Jazz.txt:system/etc/soundimage/Sound_Jazz.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Latin.txt:system/etc/soundimage/Sound_Latin.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_New_Age.txt:system/etc/soundimage/Sound_New_Age.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Piano.txt:system/etc/soundimage/Sound_Piano.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Pop.txt:system/etc/soundimage/Sound_Pop.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_R_B.txt:system/etc/soundimage/Sound_R_B.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Rock.txt:system/etc/soundimage/Sound_Rock.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_SRS_A_HP.txt:system/etc/soundimage/Sound_SRS_A_HP.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_SRS_A_SPK.txt:system/etc/soundimage/Sound_SRS_A_SPK.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_SRS_V_HP.txt:system/etc/soundimage/Sound_SRS_V_HP.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_SRS_V_SPK.txt:system/etc/soundimage/Sound_SRS_V_SPK.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Treble_Booster.txt:system/etc/soundimage/Sound_Treble_Booster.txt \
    device/htc/doubleshot/dsp/soundimage/Sound_Vocal_Booster.txt:system/etc/soundimage/Sound_Vocal_Booster.txt

# Additional NAM Audio DSP Profiles to NAM Package
PRODUCT_COPY_FILES += \
    device/htc/doubleshot/nam/default.acdb:system/etc/nam/default.acdb \
    device/htc/doubleshot/nam/default_org.acdb:system/etc/nam/default_org.acdb \
    device/htc/doubleshot/nam/AdieHWCodec.csv:system/etc/nam/AdieHWCodec.csv \
    device/htc/doubleshot/nam/AIC3254_REG_DualMic_MCLK.csv:system/etc/nam/AIC3254_REG_DualMic_MCLK.csv \
    device/htc/doubleshot/nam/CodecDSPID_MCLK.txt:system/etc/nam/CodecDSPID_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Treble_Booster_MCLK.txt:system/etc/nam/Sound_Treble_Booster_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Vocal_Booster_MCLK.txt:system/etc/nam/Sound_Vocal_Booster_MCLK.txt \
    device/htc/doubleshot/nam/Sound_SRS_A_SPK_MCLK.txt:system/etc/nam/Sound_SRS_A_SPK_MCLK.txt \
    device/htc/doubleshot/nam/Sound_SRS_V_HP_MCLK.txt:system/etc/nam/Sound_SRS_V_HP_MCLK.txt \
    device/htc/doubleshot/nam/Sound_SRS_V_SPK_MCLK.txt:system/etc/nam/Sound_SRS_V_SPK_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Jazz_MCLK.txt:system/etc/nam/Sound_Jazz_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Latin_MCLK.txt:system/etc/nam/Sound_Latin_MCLK.txt \
    device/htc/doubleshot/nam/Sound_New_Age_MCLK.txt:system/etc/nam/Sound_New_Age_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Original_MCLK.txt:system/etc/nam/Sound_Original_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Piano_MCLK.txt:system/etc/nam/Sound_Piano_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Pop_MCLK.txt:system/etc/nam/Sound_Pop_MCLK.txt \
    device/htc/doubleshot/nam/Sound_R_B_MCLK.txt:system/etc/nam/Sound_R_B_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Rock_MCLK.txt:system/etc/nam/Sound_Rock_MCLK.txt \
    device/htc/doubleshot/nam/Sound_SRS_A_HP_MCLK.txt:system/etc/nam/Sound_SRS_A_HP_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Dualmic_SPK_MCLK.txt:system/etc/nam/Sound_Dualmic_SPK_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Dualmic_EP_MCLK.txt:system/etc/nam/Sound_Dualmic_EP_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Dualmic_MCLK.txt:system/etc/nam/Sound_Dualmic_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Dolby_A_SPK_MCLK.txt:system/etc/nam/Sound_Dolby_A_SPK_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Dolby_HP_MCLK.txt:system/etc/nam/Sound_Dolby_HP_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Dolby_Spk_MCLK.txt:system/etc/nam/Sound_Dolby_Spk_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Dolby_V_HP_MCLK.txt:system/etc/nam/Sound_Dolby_V_HP_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Dolby_V_SPK_MCLK.txt:system/etc/nam/Sound_Dolby_V_SPK_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Dolby_A_HP_MCLK.txt:system/etc/nam/Sound_Dolby_A_HP_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Bass_Booster_MCLK.txt:system/etc/nam/Sound_Bass_Booster_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Blues_MCLK.txt:system/etc/nam/Sound_Blues_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Classical_MCLK.txt:system/etc/nam/Sound_Classical_MCLK.txt \
    device/htc/doubleshot/nam/Sound_Country_MCLK.txt:system/etc/nam/Sound_Country_MCLK.txt

PRODUCT_COPY_FILES += \
    device/htc/doubleshot/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    device/htc/doubleshot/modules/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/htc/doubleshot/modules/cifs.ko:system/lib/modules/cifs.ko \
    device/htc/doubleshot/modules/tun.ko:system/lib/modules/tun.ko \
    device/htc/doubleshot/modules/nls_utf8.ko:system/lib/modules/nls_utf8.ko

LOCAL_KERNEL := device/htc/doubleshot/kernel/kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# stuff common to all HTC phones
#$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

# common msm7x30 configs
#$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# we have enough storage spdoubleshot to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# use high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml

# media profiles and capabilities spec
#$(call inherit-product, device/htc/doubleshot/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/doubleshot/media_htcaudio.mk)

#$(call inherit-product-if-exists, vendor/htc/doubleshot/doubleshot-vendor.mk)


# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \
    device/htc/doubleshot/proprietary/libcamera.so:obj/lib/libcamera.so \
    device/htc/doubleshot/proprietary/libaudioalsa.so:obj/lib/libaudioalsa.so

# All the blobs necessary for doubleshot
PRODUCT_COPY_FILES += \
    device/htc/doubleshot/proprietary/akmd:/system/bin/akmd \
    device/htc/doubleshot/proprietary/awb_camera:/system/bin/awb_camera \
    device/htc/doubleshot/proprietary/bma150_usr:/system/bin/bma150_usr \
    device/htc/doubleshot/proprietary/htc_ebdlogd:/system/bin/htc_ebdlogd \
    device/htc/doubleshot/proprietary/logcat2:/system/bin/logcat2 \
    device/htc/doubleshot/proprietary/lsc_camera:/system/bin/lsc_camera \
    device/htc/doubleshot/proprietary/rmt_storage:/system/bin/rmt_storage \
    device/htc/doubleshot/proprietary/snd8k:/system/bin/snd8k \
    device/htc/doubleshot/proprietary/sound8x60:/system/bin/sound8x60 \
    device/htc/doubleshot/proprietary/sh:/system/bin/sh \
    device/htc/doubleshot/proprietary/AudioBTID.csv:/system/etc/AudioBTID.csv \
    device/htc/doubleshot/proprietary/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \
    device/htc/doubleshot/proprietary/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \
    device/htc/doubleshot/proprietary/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \
    device/htc/doubleshot/proprietary/libq3dtools_adreno200.so:/system/lib/egl/libq3dtools_adreno200.so \
    device/htc/doubleshot/proprietary/libaudioalsa.so:/system/lib/libaudioalsa.so \
    device/htc/doubleshot/proprietary/libgsl.so:/system/lib/libgsl.so \
    device/htc/doubleshot/proprietary/libcamera.so:/system/lib/libcamera.so \
    device/htc/doubleshot/proprietary/libgemini.so:/system/lib/libgemini.so \
    device/htc/doubleshot/proprietary/libhtc_acoustic.so:/system/lib/libhtc_acoustic.so \
    device/htc/doubleshot/proprietary/libhtc_ril.so:/system/lib/libhtc_ril.so \
    device/htc/doubleshot/proprietary/libmmipl.so:/system/lib/libmmipl.so \
    device/htc/doubleshot/proprietary/libmmjpeg.so:/system/lib/libmmjpeg.so \
    device/htc/doubleshot/proprietary/liboemcamera.so:/system/lib/liboemcamera.so

PRODUCT_NAME := htc_doubleshot
PRODUCT_DEVICE := doubleshot
PRODUCT_MODEL := HTC myTouch_4G_Slide
PRODUCT_MANUFACTURER := HTC

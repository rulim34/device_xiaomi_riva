#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2019 The LineageOS Project
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
#

# Inherit from common msm8937-common
$(call inherit-product, device/xiaomi/msm8937-common/msm8937.mk)

DEVICE_PATH := device/xiaomi/riva

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \

# Properties
-include $(DEVICE_PATH)/vendor_prop.mk

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(DEVICE_PATH)/audio/mixer_paths_qrd_sku2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_sku2.xml \

# Camera
PRODUCT_PACKAGES += \
    camera.msm8937 \
    Snap

# Consumerir HIDL
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

# Keylayout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/keylayout/ft5346.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/ft5346.kl \
    $(DEVICE_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(DEVICE_PATH)/keylayout/goodix-ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/goodix-ts.kl \
    $(DEVICE_PATH)/keylayout/msm8920-sku7-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/msm8920-sku7-snd-card_Button_Jack.kl

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml \

# Recovery
PRODUCT_PACKAGES += \
    librecovery_updater_riva

# Sensors
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf

# Shims
PRODUCT_PACKAGES += \
    libcamera_shim

# Soong
PRODUCT_SOONG_NAMESPACES += \
    device/xiaomi/riva

# VNDK
PRODUCT_PACKAGES += \
    libstdc++.vendor \
    libwui \

# Inherit common proprietary files
$(call inherit-product-if-exists, vendor/xiaomi/riva/riva-vendor.mk)

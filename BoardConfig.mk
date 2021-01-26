#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2018-2019 The LineageOS Project
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
-include device/xiaomi/msm8937-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/riva

# Assert
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt
TARGET_OTA_ASSERT_DEVICE := riva

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml

# Kernel
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CONFIG := rova_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/msm8917
TARGET_KERNEL_VERSION := 4.9
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_CLANG_VERSION := proton
KERNEL_TOOLCHAIN := $(shell pwd)/prebuilts/clang/host/linux-x86/clang-proton/bin
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-gnu-

# Partitions
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26301931008
BOARD_VENDORIMAGE_PARTITION_SIZE   := 536870912
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_riva
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Security patch level
VENDOR_SECURITY_PATCH := 2020-06-05

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Tap2Wake
TARGET_TAP_TO_WAKE_NODE := "/proc/gesture/onoff"

# Treble
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
BOARD_VNDK_VERSION := current
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_VENDOR_MOVE_ENABLED := true

# Inherit the common proprietary files
-include vendor/xiaomi/riva/BoardConfigVendor.mk

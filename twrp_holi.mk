#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/qualcomm/holi

# Release name
PRODUCT_RELEASE_NAME := holi

# Inherit from holi device
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Assert
TARGET_OTA_ASSERT_DEVICE := holi

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := holi
PRODUCT_NAME := twrp_holi
PRODUCT_BRAND := qualcomm
PRODUCT_MODEL := qualcomm
PRODUCT_MANUFACTURER := qualcomm

# Make Dir For Inherit From Stock
dir.recovery = /system/bin
[recovery]
namespace.default.isolated = false
namespace.default.search.paths = /system/${LIB}


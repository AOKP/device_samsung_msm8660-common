# Copyright (C) 2012 The CyanogenMod Project
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

TARGET_SPECIFIC_HEADER_PATH := device/samsung/msm8660-common/include

# Platform
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_CPU_VARIANT := scorpion
TARGET_CPU_SMP := true

# inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

# Wifi related defines
WIFI_BAND := 802_11_ABG
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
BOARD_HAVE_SAMSUNG_WIFI := true

WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME     := "dhd"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/system/etc/wifi/bcmdhd_p2p.bin"

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := device/samsung/msm8660-common/rootdir/etc/fstab.qcom
RECOVERY_FSTAB_VERSION := 2

# Adreno configuration
BOARD_EGL_CFG := device/samsung/msm8660-common/configs/egl.cfg

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/msm8660-common/bluetooth/vnd_msm8660.txt
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false

# GPS
BOARD_HAVE_NEW_QC_GPS := true

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 28
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Camera
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_HARDWARE -DQCOM_BSP_CAMERA_ABI_HACK
BOARD_CAMERA_USE_MM_HEAP := true

# Workaround to avoid issues with legacy liblights on QCOM platforms
TARGET_PROVIDES_LIBLIGHT := true

# Audio
BOARD_HAVE_SAMSUNG_AUDIO := true
BOARD_QCOM_VOIP_ENABLED := true

# QCOM enhanced A/V
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# To handle radio version checks
TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/msm8660-common

# Use legacy MM heap behavior
TARGET_DISPLAY_INSECURE_MM_HEAP := true

# Use retire fence from MDP driver
TARGET_DISPLAY_USE_RETIRE_FENCE := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/msm8660-common/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    property_contexts \
    te_macros \
    bridge.te \
    camera.te \
    conn_init.te \
    device.te \
    dhcp.te \
    domain.te \
    drmserver.te \
    file.te \
    kickstart.te \
    init.te \
    mediaserver.te \
    mpdecision.te \
    netmgrd.te \
    property.te \
    qmux.te \
    rild.te \
    rmt.te \
    sensors.te \
    surfaceflinger.te \
    system.te \
    tee.te \
    thermald.te \
    ueventd.te \
    wpa_supplicant.te


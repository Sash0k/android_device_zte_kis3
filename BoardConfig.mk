# config.mk
#
# Product-specific compile-time definitions.
#

ifeq ($(TARGET_ARCH),)
TARGET_ARCH := arm
endif

USE_CAMERA_STUB := true

TARGET_USES_AOSP := false
# Compile with msm kernel
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_HAS_QC_KERNEL_SOURCE := true

-include $(QCPATH)/common/msm8610/BoardConfigVendor.mk

#TODO: Fix-me: Setting TARGET_HAVE_HDMI_OUT to false
# to get rid of compilation error.
TARGET_HAVE_HDMI_OUT := false
TARGET_USES_OVERLAY := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RPC := true

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_HARDWARE_3D := false
TARGET_BOARD_PLATFORM := msm8610
TARGET_BOOTLOADER_BOARD_NAME := MSM8610
TARGET_ARCH_LOWMEM := true

# Enables Adreno RS driver
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DAP := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true
AUDIO_FEATURE_DISABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_DISABLED_SSR := true

# Kernel
KERNEL_DEFCONFIG := msm8610-zte_defconfig
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 androidboot.selinux=permissive
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000

TARGET_SPECIFIC_HEADER_PATH += device/zte/kis3/include

BOARD_EGL_CFG := device/zte/kis3/egl.cfg

# Partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_CACHEIMAGE_PARTITION_SIZE := 33554432
BOARD_PERSISTIMAGE_PARTITION_SIZE := 5242880
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 73400320
BOARD_USBIMAGE_PARTITION_SIZE_KB := 1048576
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Enable suspend during charger mode
BOARD_CHARGER_ENABLE_SUSPEND := true

TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_USES_INTERACTION_BOOST := false

# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := true

HAVE_FT_FW_UPGRADE := true

# Resource manager for audio-video usecases
BOARD_USES_RESOURCE_MANAGER:= true

TARGET_INIT_VENDOR_LIB := libinit_msm

# Board specific SELinux policy variable definitions
BOARD_SEPOLICY_DIRS := \
       device/qcom/common/sepolicy

BOARD_SEPOLICY_UNION := \
       netd.te

TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_msm

PRODUCT_BOOT_JARS := $(subst $(space),:,$(PRODUCT_BOOT_JARS))

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"

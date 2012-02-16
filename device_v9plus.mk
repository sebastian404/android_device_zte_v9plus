$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/zte/v9plus/v9plus-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/v9plus/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/zte/v9plus/recovery_kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel\
    device/zte/v9plus/recovery/sbin/rmt_storage_recovery:/root/sbin/rmt_storage_recovery\
    device/zte/v9plus/recovery/sbin/recovery.sh:/root/sbin/recovery.sh\
    device/zte/v9plus/recovery/etc/usb.conf:/root/usb.conf
    
$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := generic_v9plus
PRODUCT_DEVICE := v9plus
PRODUCT_BRAND := zte

pathmap_INCL := recovery:device/zte/v9plus/recovery


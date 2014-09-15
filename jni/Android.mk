LOCAL_PATH := $(call my-dir)/../

include $(CLEAR_VARS)
LOCAL_MODULE                  := kdump
LOCAL_MODULE_TAGS             := optional
LOCAL_C_INCLUDES              := $(LOCAL_PATH)/include
LOCAL_SRC_FILES               := $(LOCAL_PATH)/kdump/kdump.c
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_STATIC_LIBRARIES        := libc
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE      := mrom_libutil_kt
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES  := $(LOCAL_PATH)/util_lib/include
LOCAL_SRC_FILES   := $(LOCAL_PATH)/util_lib/compute_ip_checksum.c util_lib/sha256.c
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE                  := kexec
LOCAL_MODULE_TAGS             := optional
LOCAL_C_INCLUDES              := $(LOCAL_PATH)/include \
                                 $(LOCAL_PATH)/util_lib/include \
                                 $(LOCAL_PATH)/kexec/arch/arm/include \
                                 $(LOCAL_PATH)/kexec/libfdt \
                                 external/zlib
LOCAL_SRC_FILES               := $(LOCAL_PATH)/kexec/kexec.c kexec/ifdown.c \
                                 $(LOCAL_PATH)/$(LOCAL_PATH)/kexec/kexec-elf.c kexec/kexec-elf-exec.c \
                                 $(LOCAL_PATH)/kexec/kexec-elf-core.c \
                                 $(LOCAL_PATH)/kexec/kexec-elf-rel.c \
                                 $(LOCAL_PATH)/kexec/kexec-elf-boot.c \
                                 $(LOCAL_PATH)/kexec/kexec-iomem.c \
                                 $(LOCAL_PATH)/kexec/firmware_memmap.c \
                                 $(LOCAL_PATH)/kexec/crashdump.c kexec/crashdump-xen.c \
                                 $(LOCAL_PATH)/kexec/phys_arch.c kexec/lzma.c \
                                 $(LOCAL_PATH)/kexec/zlib.c kexec/proc_iomem.c \
                                 $(LOCAL_PATH)/kexec/virt_to_phys.c \
                                 $(LOCAL_PATH)/kexec/arch/arm/phys_to_virt.c \
                                 $(LOCAL_PATH)/kexec/add_segment.c kexec/add_buffer.c \
                                 $(LOCAL_PATH)/kexec/arch_reuse_initrd.c \
                                 $(LOCAL_PATH)/kexec/arch_init.c \
                                 $(LOCAL_PATH)/kexec/arch/arm/kexec-elf-rel-arm.c \
                                 $(LOCAL_PATH)/kexec/arch/arm/kexec-zImage-arm.c \
                                 $(LOCAL_PATH)/kexec/arch/arm/kexec-uImage-arm.c \
                                 $(LOCAL_PATH)/kexec/arch/arm/kexec-arm.c \
                                 $(LOCAL_PATH)/kexec/arch/arm/crashdump-arm.c \
                                 $(LOCAL_PATH)/kexec/kexec-uImage.c kexec/purgatory.c \
                                 $(LOCAL_PATH)/kexec/fs2dt.c \
                                 $(LOCAL_PATH)/kexec/libfdt/fdt.c kexec/libfdt/fdt_ro.c \
                                 $(LOCAL_PATH)/kexec/libfdt/fdt_rw.c kexec/libfdt/fdt_strerror.c \
                                 $(LOCAL_PATH)/kexec/libfdt/fdt_sw.c kexec/libfdt/fdt_wip.c
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_STATIC_LIBRARIES        := mrom_libutil_kt libz libc
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_UNSTRIPPED_PATH := $(TARGET_OUT_EXECUTABLES_UNSTRIPPED)
LOCAL_LDLIBS += -lz
include $(BUILD_EXECUTABLE)

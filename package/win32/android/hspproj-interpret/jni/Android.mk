LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := openhsp_dish35b3
LOCAL_CFLAGS := -D__ANDROID__ -Wno-psabi -DHSPNDK -DHSPEMBED -DHSPDISH -DHSPNDK2
LOCAL_CPPFLAGS  += -fexceptions -Wno-write-strings
LOCAL_C_INCLUDES += ../../hsplib-interpret

LOCAL_SRC_FILES := \
../../hsplib-interpret/hsp_native_app_glue.c \
../../hsplib-interpret/javafunc.cpp \
../../hsplib-interpret/main.c \
../../hsplib-interpret/hsp3ndk.cpp \
../../hsplib-interpret/hsp3/hsp3.cpp \
../../hsplib-interpret/hsp3/hsp3code.cpp \
../../hsplib-interpret/hsp3embed/misc.cpp \
../../hsplib-interpret/hsp3/dpmread.cpp \
../../hsplib-interpret/hsp3/hsp3debug.cpp \
../../hsplib-interpret/hsp3/hsp3gr_dish.cpp \
../../hsplib-interpret/hsp3/hsp3int.cpp \
../../hsplib-interpret/hsp3/hspvar_core.cpp \
../../hsplib-interpret/hsp3/hspvar_double.cpp \
../../hsplib-interpret/hsp3/hspvar_int.cpp \
../../hsplib-interpret/hsp3/hspvar_label.cpp \
../../hsplib-interpret/hsp3/hspvar_str.cpp \
../../hsplib-interpret/hsp3/hspvar_struct.cpp \
../../hsplib-interpret/hsp3/hspwnd_dish.cpp \
../../hsplib-interpret/hsp3/hspwnd_obj.cpp \
../../hsplib-interpret/hsp3/random.cpp \
../../hsplib-interpret/hsp3/stack.cpp \
../../hsplib-interpret/hsp3/strbuf.cpp \
../../hsplib-interpret/hsp3/strnote.cpp \
../../hsplib-interpret/hsp3/sysreq.cpp \
../../hsplib-interpret/hsp3/ndk/supio_ndk.cpp \
../../hsplib-interpret/hsp3/ndk/hsp3ext_ndk.cpp \
../../hsplib-interpret/hsp3/ndk/hgiox.cpp \
../../hsplib-interpret/hsp3/ndk/hgtex.cpp \
../../hsplib-interpret/hsp3/ndk/stb_image.c \
../../hsplib-interpret/hsp3/ndk/mmman.cpp \
../../hsplib-interpret/hsp3/ndk/webtask_ndk.cpp

LOCAL_LDLIBS    := -llog -landroid -lEGL -lGLESv1_CM -lOpenSLES -ljnigraphics -Llibs/$(TARGET_ARCH_ABI)
#-lobaqlib
#LOCAL_STATIC_LIBRARIES := obaqlib

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)

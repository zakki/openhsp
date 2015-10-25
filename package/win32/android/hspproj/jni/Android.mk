LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := openhsp_dish35b3
LOCAL_CFLAGS := -D__ANDROID__ -Wno-psabi -DHSPNDK -DHSPEMBED -DHSPDISH -DHSPNDK2
LOCAL_CPPFLAGS  += -fexceptions
LOCAL_C_INCLUDES += ../../hsplib

LOCAL_SRC_FILES := \
../../hsplib/hsp_native_app_glue.c \
../../hsplib/javafunc.cpp \
../../hsplib/main.c \
../../hsplib/hsp3ndk.cpp \
../../hsplib/hsp3/hsp3.cpp \
../../hsplib/hsp3/hsp3code.cpp \
../../hsplib/hsp3embed/misc.cpp \
../../hsplib/hsp3/dpmread.cpp \
../../hsplib/hsp3/hsp3debug.cpp \
../../hsplib/hsp3/hsp3gr_dish.cpp \
../../hsplib/hsp3/hsp3int.cpp \
../../hsplib/hsp3/hspvar_core.cpp \
../../hsplib/hsp3/hspvar_double.cpp \
../../hsplib/hsp3/hspvar_int.cpp \
../../hsplib/hsp3/hspvar_label.cpp \
../../hsplib/hsp3/hspvar_str.cpp \
../../hsplib/hsp3/hspvar_struct.cpp \
../../hsplib/hsp3/hspwnd_dish.cpp \
../../hsplib/hsp3/hspwnd_obj.cpp \
../../hsplib/hsp3/random.cpp \
../../hsplib/hsp3/stack.cpp \
../../hsplib/hsp3/strbuf.cpp \
../../hsplib/hsp3/strnote.cpp \
../../hsplib/hsp3/sysreq.cpp \
../../hsplib/hsp3/ndk/supio_ndk.cpp \
../../hsplib/hsp3/ndk/hsp3ext_ndk.cpp \
../../hsplib/hsp3/ndk/hgiox.cpp \
../../hsplib/hsp3/ndk/hgtex.cpp \
../../hsplib/hsp3/ndk/stb_image.c \
../../hsplib/hsp3/ndk/mmman.cpp \
../../hsplib/hsp3/ndk/webtask_ndk.cpp

LOCAL_LDLIBS    := -llog -landroid -lEGL -lGLESv1_CM -lOpenSLES -ljnigraphics -Llibs/$(TARGET_ARCH_ABI)
#-lobaqlib
#LOCAL_STATIC_LIBRARIES := obaqlib

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)

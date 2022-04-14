LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := hspproj
LOCAL_CFLAGS := -D__ANDROID__ -Wno-narrowing -DHSPNDK -DHSPEMBED -DHSPDISH -DHSPDISHGP
LOCAL_CPPFLAGS  += -fexceptions -std=c++11 -frtti -Wno-switch-enum -Wno-switch -Wno-narrowing
LOCAL_ARM_MODE := arm
LOCAL_SHORT_COMMANDS := true

LOCAL_C_INCLUDES += ../hsplib37r1
LOCAL_C_INCLUDES += ../gameplay/src
LOCAL_C_INCLUDES += ../extlib/src

LOCAL_SRC_FILES := hsp3embed/hsp3r.cpp hsp3embed/hspsource.cpp javafunc.cpp maingp.cpp \
PlatformAndroid.cpp \
../../hsplib37r1/hsp_native_app_glue.c \
../../hsplib37r1/hsp3embed/hsp3code.cpp \
../../hsplib37r1/hsp3embed/hsp3embed.cpp \
../../hsplib37r1/hsp3embed/hspvar_util.cpp \
../../hsplib37r1/hsp3embed/misc.cpp \
../../hsplib37r1/hsp3/dpmread.cpp \
../../hsplib37r1/hsp3/filepack.cpp \
../../hsplib37r1/hsp3/hsp3utfcnv.cpp \
../../hsplib37r1/hsp3/essprite.cpp \
../../hsplib37r1/hsp3/geometry.cpp \
../../hsplib37r1/hsp3/hsp3debug.cpp \
../../hsplib37r1/hsp3/hsp3gr_dish.cpp \
../../hsplib37r1/hsp3/hsp3int.cpp \
../../hsplib37r1/hsp3/hspvar_core.cpp \
../../hsplib37r1/hsp3/hspvar_double.cpp \
../../hsplib37r1/hsp3/hspvar_int.cpp \
../../hsplib37r1/hsp3/hspvar_label.cpp \
../../hsplib37r1/hsp3/hspvar_str.cpp \
../../hsplib37r1/hsp3/hspvar_struct.cpp \
../../hsplib37r1/hsp3/hspwnd_dish.cpp \
../../hsplib37r1/hsp3/hspwnd_obj.cpp \
../../hsplib37r1/hsp3/hspwnd_edit.cpp \
../../hsplib37r1/hsp3/random.cpp \
../../hsplib37r1/hsp3/stack.cpp \
../../hsplib37r1/hsp3/strbuf.cpp \
../../hsplib37r1/hsp3/strnote.cpp \
../../hsplib37r1/hsp3/sysreq.cpp \
../../hsplib37r1/hsp3/texmes.cpp \
../../hsplib37r1/hsp3/ndk/fontsystem.cpp \
../../hsplib37r1/hsp3/ndk/supio_ndk.cpp \
../../hsplib37r1/hsp3/ndk/hsp3ext_ndk.cpp \
../../hsplib37r1/hsp3/ndk/mmman.cpp \
../../hsplib37r1/hsp3/ndk/webtask_ndk.cpp \
../../hsplib37r1/hsp3/ndkgp/hgiox.cpp \
../../hsplib37r1/hsp3/ndkgp/gamehsp.cpp \
../../hsplib37r1/hsp3/ndkgp/gpcam.cpp \
../../hsplib37r1/hsp3/ndkgp/gplgt.cpp \
../../hsplib37r1/hsp3/ndkgp/gpmat.cpp \
../../hsplib37r1/hsp3/ndkgp/gpphy.cpp \
../../hsplib37r1/hsp3/ndkgp/gpevent.cpp \

LOCAL_LDLIBS    := -llog -landroid -lEGL -lGLESv2 -lOpenSLES -ljnigraphics -lgameplay -Llibs/$(TARGET_ARCH_ABI)

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)

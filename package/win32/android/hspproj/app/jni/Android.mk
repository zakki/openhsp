LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := hspproj
LOCAL_CFLAGS := -D__ANDROID__ -Wno-narrowing -DHSPNDK -DHSPEMBED -DHSPDISH -DUSE_OBAQ
LOCAL_CPPFLAGS  += -fexceptions
LOCAL_C_INCLUDES += ../hsplib37r1

LOCAL_SRC_FILES := hsp3embed/hsp3r.cpp hsp3embed/hspsource.cpp javafunc.cpp main.cpp \
../../hsplib37r1/hsp_native_app_glue.c \
../../hsplib37r1/hsp3embed/hsp3code.cpp \
../../hsplib37r1/hsp3embed/hsp3embed.cpp \
../../hsplib37r1/hsp3embed/hspvar_util.cpp \
../../hsplib37r1/hsp3embed/misc.cpp \
../../hsplib37r1/hsp3/essprite.cpp \
../../hsplib37r1/hsp3/dpmread.cpp \
../../hsplib37r1/hsp3/filepack.cpp \
../../hsplib37r1/hsp3/hsp3utfcnv.cpp \
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
../../hsplib37r1/hsp3/ndk/supio_ndk.cpp \
../../hsplib37r1/hsp3/ndk/hsp3ext_ndk.cpp \
../../hsplib37r1/hsp3/ndk/fontsystem.cpp \
../../hsplib37r1/hsp3/ndk/hgiox.cpp \
../../hsplib37r1/hsp3/ndk/hgtex.cpp \
../../hsplib37r1/hsp3/ndk/stb_image.c \
../../hsplib37r1/hsp3/ndk/mmman.cpp \
../../hsplib37r1/hsp3/ndk/webtask_ndk.cpp \
../../hsplib37r1/hsp3/obaq/hsp3dw.cpp \
../../hsplib37r1/hsp3/obaq/omkedraw.cpp \
../../hsplib37r1/hsp3/obaq/game.cpp \
../../hsplib37r1/obaq/physics/vessel.cpp \
../../hsplib37r1/obaq/physics/rock.cpp

LOCAL_LDLIBS    := -llog -landroid -lEGL -lGLESv1_CM -lOpenSLES -ljnigraphics -lhsp3crypt -Llibs/$(TARGET_ARCH_ABI)

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)

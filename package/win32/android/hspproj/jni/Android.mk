LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := test_view
LOCAL_CFLAGS := -D__ANDROID__ -Wno-narrowing -DHSPNDK -DHSPEMBED -DHSPDISH -DUSE_OBAQ
LOCAL_CPPFLAGS  += -fexceptions
LOCAL_C_INCLUDES += ../hsplib36b4

LOCAL_SRC_FILES := hsp3embed/hsp3r.cpp hsp3embed/hspsource.cpp javafunc.cpp main.cpp \
../../hsplib36b4/hsp_native_app_glue.c \
../../hsplib36b4/hsp3embed/hsp3code.cpp \
../../hsplib36b4/hsp3embed/hsp3embed.cpp \
../../hsplib36b4/hsp3embed/hspvar_util.cpp \
../../hsplib36b4/hsp3embed/misc.cpp \
../../hsplib36b4/hsp3/essprite.cpp \
../../hsplib36b4/hsp3/dpmread.cpp \
../../hsplib36b4/hsp3/geometry.cpp \
../../hsplib36b4/hsp3/hsp3debug.cpp \
../../hsplib36b4/hsp3/hsp3gr_dish.cpp \
../../hsplib36b4/hsp3/hsp3int.cpp \
../../hsplib36b4/hsp3/hspvar_core.cpp \
../../hsplib36b4/hsp3/hspvar_double.cpp \
../../hsplib36b4/hsp3/hspvar_int.cpp \
../../hsplib36b4/hsp3/hspvar_label.cpp \
../../hsplib36b4/hsp3/hspvar_str.cpp \
../../hsplib36b4/hsp3/hspvar_struct.cpp \
../../hsplib36b4/hsp3/hspwnd_dish.cpp \
../../hsplib36b4/hsp3/hspwnd_obj.cpp \
../../hsplib36b4/hsp3/hspwnd_edit.cpp \
../../hsplib36b4/hsp3/random.cpp \
../../hsplib36b4/hsp3/stack.cpp \
../../hsplib36b4/hsp3/strbuf.cpp \
../../hsplib36b4/hsp3/strnote.cpp \
../../hsplib36b4/hsp3/sysreq.cpp \
../../hsplib36b4/hsp3/texmes.cpp \
../../hsplib36b4/hsp3/ndk/supio_ndk.cpp \
../../hsplib36b4/hsp3/ndk/hsp3ext_ndk.cpp \
../../hsplib36b4/hsp3/ndk/fontsystem.cpp \
../../hsplib36b4/hsp3/ndk/hgiox.cpp \
../../hsplib36b4/hsp3/ndk/hgtex.cpp \
../../hsplib36b4/hsp3/ndk/stb_image.c \
../../hsplib36b4/hsp3/ndk/mmman.cpp \
../../hsplib36b4/hsp3/ndk/webtask_ndk.cpp \
../../hsplib36b4/hsp3/obaq/hsp3dw.cpp \
../../hsplib36b4/hsp3/obaq/omkedraw.cpp \
../../hsplib36b4/hsp3/obaq/game.cpp \
../../hsplib36b4/obaq/physics/vessel.cpp \
../../hsplib36b4/obaq/physics/rock.cpp

LOCAL_LDLIBS    := -llog -landroid -lEGL -lGLESv1_CM -lOpenSLES -ljnigraphics -Llibs/$(TARGET_ARCH_ABI)

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)

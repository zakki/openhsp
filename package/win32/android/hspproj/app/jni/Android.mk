LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := hspproj
LOCAL_CFLAGS := -D__ANDROID__ -Wno-narrowing -DHSPNDK -DHSPEMBED -DHSPDISH -DUSE_OBAQ
LOCAL_CPPFLAGS  += -fexceptions

LOCAL_SRC_FILES := hsp3embed/hsp3r.cpp hsp3embed/hspsource.cpp javafunc.cpp main.cpp \
hsp_native_app_glue.c \
hsp3embed/hsp3code.cpp \
hsp3embed/hsp3embed.cpp \
hsp3embed/hspvar_util.cpp \
hsp3embed/misc.cpp \
hsp3/dpmread.cpp \
hsp3/filepack.cpp \
hsp3/hsp3utfcnv.cpp \
hsp3/hsp3debug.cpp \
hsp3/hsp3int.cpp \
hsp3/hspvar_core.cpp \
hsp3/hspvar_double.cpp \
hsp3/hspvar_int.cpp \
hsp3/hspvar_label.cpp \
hsp3/hspvar_str.cpp \
hsp3/hspvar_struct.cpp \
hsp3/stack.cpp \
hsp3/strbuf.cpp \
hsp3/strnote.cpp \
hsp3/ndk/supio_ndk.cpp \
hsp3/ndk/hsp3ext_ndk.cpp \
hsp3dish/ndk/mmman.cpp \
hsp3dish/ndk/webtask_ndk.cpp \
hsp3dish/essprite.cpp \
hsp3dish/geometry.cpp \
hsp3dish/hsp3gr_dish.cpp \
hsp3dish/hspwnd_dish.cpp \
hsp3dish/hspwnd_obj.cpp \
hsp3dish/hspwnd_edit.cpp \
hsp3dish/random.cpp \
hsp3dish/sysreq.cpp \
hsp3dish/texmes.cpp \
hsp3dish/emscripten/fontsystem.cpp \
hsp3dish/emscripten/hgiox.cpp \
hsp3dish/emscripten/hgtex.cpp \
hsp3dish/emscripten/stb_image.c \
hsp3dish/obaq/hsp3dw.cpp \
hsp3dish/obaq/omkedraw.cpp \
hsp3dish/obaq/game.cpp \
obaq/physics/vessel.cpp \
obaq/physics/rock.cpp

LOCAL_LDLIBS    := -llog -landroid -lEGL -lGLESv1_CM -lOpenSLES -ljnigraphics -lhsp3crypt -Llibs/$(TARGET_ARCH_ABI)

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)

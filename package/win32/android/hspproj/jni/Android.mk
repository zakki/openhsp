LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := jumper
LOCAL_CPPFLAGS  += -fexceptions
LOCAL_SRC_FILES := hsp_native_app_glue.c main.c javafunc.cpp hsp3embed/hsp3code.cpp hsp3embed/hsp3embed.cpp hsp3embed/hsp3r.cpp hsp3embed/hspvar_util.cpp hsp3embed/misc.cpp hsp3embed/hspsource.cpp hsp3/dpmread.cpp hsp3/hsp3debug.cpp hsp3/hsp3gr_dish.cpp hsp3/hsp3int.cpp hsp3/hspvar_core.cpp hsp3/hspvar_double.cpp hsp3/hspvar_int.cpp hsp3/hspvar_label.cpp hsp3/hspvar_str.cpp hsp3/hspvar_struct.cpp hsp3/hspwnd_dish.cpp hsp3/hspwnd_obj.cpp hsp3/random.cpp hsp3/stack.cpp hsp3/strbuf.cpp hsp3/strnote.cpp hsp3/sysreq.cpp hsp3/ndk/supio_ndk.cpp hsp3/ndk/hsp3ext_ndk.cpp hsp3/ndk/hgiox.cpp hsp3/ndk/stb_image.c hsp3/ndk/mmman.cpp hsp3/geometry.cpp hsp3/hgdx.cpp hsp3/hgemitter.cpp hsp3/hgevent.cpp hsp3/hgmodel.cpp hsp3/hgobj.cpp
LOCAL_LDLIBS    := -llog -landroid -lEGL -lGLESv1_CM -lOpenSLES
#LOCAL_STATIC_LIBRARIES := android_native_app_glue 

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)

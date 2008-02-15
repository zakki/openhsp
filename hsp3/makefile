# GNU make 用メイクファイル
#
# (使い方)
#   make ( PLATFORM [ release ] [ all | clean ] ) | cleanall
#
#   PLATFORMは
#       linux
#       win32_mingw
#       win32gui_mingw
#   のどれか。all, clean を指定する場合もPLATFORMを指定する。
#
#   release を指定するとリリースビルド、それ以外はデバッグビルド。
#
#   all を指定するとリビルド。
#   clean を指定するとPLATFORMに関係したオブジェクトファイルと実行ファイルの削除。
#   cleanall を指定するとそのフォルダ内のすべてのオブジェクトファイルと実行ファイルの削除。
#
#   環境に合わせて includedir, libdir を設定する。
#

#/*----------------------------------*/

CC = gcc
CXX = g++.exe
WINDRES = windres.exe
RM = rm -f

#/*----------------------------------*/


includedir =
libdir =


#/*-----------------------------------------------------------*/

#/*>>>>------------------------------*/
#
# linux版 ビルドオプション
#

#  rev 43 : 動作未確認、問題があれば makefile.linux を使用してください

ifeq ($(filter linux,$(MAKECMDGOALS)),linux)

#/*>>>>>>>>--------------------------*/
#
# リリース・デバッグビルドの切り替え
#
    ifeq ($(filter release,$(MAKECMDGOALS)),release)
        HSP = -DHSPLINUX -O3
    else
        HSP = -DHSPLINUX -DHSPDEBUG
    endif

#/*<<<<<<<<--------------------------*/

    EXECMODE = $(TARGET)

    vpath
    vpath %.cpp ../hsp3/linux
    vpath %.c ../hsp3/linux
    vpath %.hpp ../hsp3/linux 
    vpath %.h ../hsp3/linux

    CXX = $(CC)

    CFLAGS = $(includedir) -Wall --input-charset=cp932 --exec-charset=cp932 $(HSP)
    CXXFLAGS = $(CFLAGS)

    TARGET = hsp3

    OBJS = linux/main.o hsp3.o hsp3code.o hsp3debug.o \
           hsp3int.o hspvar_core.o hspvar_double.o hspvar_int.o \
           hspvar_label.o hspvar_str.o hspvar_struct.o stack.o strbuf.o strnote.o \
           dpmread.o linux/supio_linux.o linux/hsp3cl.o linux/hsp3ext_linux.o linux/hsp3gr_linux.o

    RESES =

    LIBS = -s $(libdir) -lm -lstdc++

endif

#/*<<<<------------------------------*/

#/*-----------------------------------------------------------*/

#/*>>>>------------------------------*/
#
# mingw 用
# win32コンソール版 ビルドオプション
# mingw32(gcc3.4.2) + msys で動作確認。
#

ifeq ($(filter win32_mingw,$(MAKECMDGOALS)),win32_mingw)

#/*>>>>>>>>--------------------------*/
#
# リリース・デバッグビルドの切り替え
#
    ifeq ($(filter release,$(MAKECMDGOALS)),release)
        HSP = -DHSPWIN -DHSPCL_WIN -O3
    else
        HSP = -DHSPWIN -DHSPCL_WIN -DHSPDEBUG
    endif

#/*<<<<<<<<--------------------------*/

    EXECMODE = $(TARGET)

    includedir = -I"/mingw/include"  -I"/mingw/include/c++/3.4.2"
    libdir = -L"/mingw/lib"

    vpath
    vpath %.cpp ../hsp3/win32 ../hsp3/win32gui
    vpath %.c ../hsp3/win32 ../hsp3/win32gui
    vpath %.hpp ../hsp3/win32 ../hsp3/win32gui
    vpath %.h ../hsp3/win32 ../hsp3/win32gui
    vpath %.rc ../hsp3/win32 ../hsp3/win32gui

    CFLAGS = $(includedir) -Wall -Wno-unused -funsigned-char -finput-charset=cp932 -fexec-charset=cp932 -mwindows -mconsole -DWINVER=0x0400 -D_WIN32_IE=0x0500 $(HSP)
    CXXFLAGS = $(CFLAGS)

    TARGET = hsp3cl.exe

    OBJS =  $(RESES) dpmread.o hsp3.o hsp3code.o hsp3debug.o hsp3int.o hspvar_core.o hspvar_double.o hspvar_int.o hspvar_label.o hspvar_str.o hspvar_struct.o stack.o strbuf.o strnote.o \
            comobj.o comobj_event.o filedlg.o hsp3ext_win.o hsp3extlib.o hspvar_comobj.o hspvar_variant.o supio_win.o \
            hsp3cl.o hsp3gr_win.o main.o

    RESES =# hsp3.res

    LIBS = -s $(libdir) -lcomctl32 -lole32 -loleaut32 -luuid

endif

#/*<<<<------------------------------*/

#/*-----------------------------------------------------------*/

#/*>>>>------------------------------*/
#
# mingw 用 
# win32gui版 ビルドオプション
# mingw32(gcc3.4.2) + msys で動作確認。
#

ifeq ($(filter win32gui_mingw,$(MAKECMDGOALS)),win32gui_mingw)

#/*>>>>>>>>--------------------------*/
#
# リリース・デバッグビルドの切り替え
#
    ifeq ($(filter release,$(MAKECMDGOALS)),release)
        HSP = -DHSPWIN -DHSPWINGUI -O3
    else
        HSP = -DHSPWIN -DHSPWINGUI -DHSPDEBUG
    endif

#/*<<<<<<<<--------------------------*/

    EXECMODE = $(TARGET)

    includedir = -I"/mingw/include"  -I"/mingw/include/c++/3.4.2"
    libdir = -L"/mingw/lib"

    vpath
    vpath %.cpp ../hsp3/win32gui
    vpath %.c ../hsp3/win32gui
    vpath %.hpp ../hsp3/win32gui
    vpath %.h ../hsp3/win32gui
    vpath %.rc ../hsp3/win32gui

    CFLAGS = $(includedir) -Wall -Wno-unused -funsigned-char -finput-charset=cp932 -fexec-charset=cp932 -mwindows -DWINVER=0x0400 -D_WIN32_IE=0x0500 $(HSP)
    CXXFLAGS = $(CFLAGS)

    TARGET = hsp3.exe

    OBJS =  $(RESES) dpmread.o hsp3.o hsp3code.o hsp3debug.o hsp3int.o hspvar_core.o hspvar_double.o hspvar_int.o hspvar_label.o hspvar_str.o hspvar_struct.o stack.o strbuf.o strnote.o \
            comobj.o comobj_event.o fcpoly.o filedlg.o hsp3ext_win.o hsp3extlib.o hsp3gr_wingui.o hsp3win.o hspvar_comobj.o hspvar_variant.o hspwnd_obj.o hspwnd_win.o main.o mmman.o supio_win.o

    RESES = hsp3.res

    LIBS = -s $(libdir) -lcomctl32 -lole32 -loleaut32 -luuid -lwinmm

endif

#/*<<<<------------------------------*/

ifeq ($(filter all,$(MAKECMDGOALS)),all)
    EXECMODE = exec_all
endif

ifeq ($(filter clean,$(MAKECMDGOALS)),clean)
    EXECMODE = exec_clean
    TARGET =
endif

#/*----------------------------------*/

.SUFFIXES:
.SUFFIXES: .c .cpp .o .rc .res

.PHONY: all clean cleanall exec_all exec_clean release \
        linux win32_mingw win32gui_mingw

#/*----------------------------------*/

all clean release: $(EXECMODE) ;
linux win32_mingw win32gui_mingw: $(EXECMODE) ;

cleanall:
	$(RM) *.o *.exe *.out *.res

exec_all: exec_clean $(TARGET) ;

exec_clean:
	$(RM) $(OBJS) $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) $(LIBS) -o $@

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

.cpp.o:
	$(CXX) $(CXXFLAGS) -c $< -o $@

.rc.res:
	$(WINDRES) -i $< --input-format=rc -o $@ -O coff --include-dir $(<D)


#/*----------------------------------*/
#
#  ../hsp3
#

dpmread.o: dpmread.cpp hsp3config.h dpmread.h supio.h
hsp3.o: hsp3.cpp hsp3.h hsp3debug.h hsp3struct.h hspvar_core.h hsp3ext.h \
  hsp3code.h hsp3config.h dpmread.h supio.h
hsp3code.o: hsp3code.cpp hspwnd.h supio.h dpmread.h stack.h strbuf.h \
  hsp3code.h hsp3debug.h hsp3struct.h hspvar_core.h hsp3config.h \
  hsp3int.h
hsp3debug.o: hsp3debug.cpp hsp3config.h hsp3.h hsp3debug.h hsp3struct.h \
  hspvar_core.h hsp3ext.h hsp3code.h
hsp3int.o: hsp3int.cpp hsp3config.h hspwnd.h supio.h dpmread.h strbuf.h \
  strnote.h hsp3int.h hsp3struct.h hspvar_core.h hsp3debug.h hsp3code.h
hspvar_core.o: hspvar_core.cpp hspvar_core.h hspvar_label.h hsp3debug.h \
  strbuf.h supio.h
hspvar_double.o: hspvar_double.cpp hspvar_core.h hsp3debug.h strbuf.h
hspvar_int.o: hspvar_int.cpp hspvar_core.h hsp3debug.h strbuf.h supio.h
hspvar_label.o: hspvar_label.cpp hsp3code.h hsp3debug.h hsp3struct.h \
  hspvar_core.h hspvar_label.h strbuf.h supio.h
hspvar_str.o: hspvar_str.cpp hspvar_core.h hsp3debug.h strbuf.h supio.h
hspvar_struct.o: hspvar_struct.cpp hsp3code.h hsp3debug.h hsp3struct.h \
  hspvar_core.h strbuf.h supio.h
stack.o: stack.cpp stack.h hspvar_core.h hsp3debug.h
strbuf.o: strbuf.cpp supio.h strbuf.h hsp3debug.h
strnote.o: strnote.cpp strnote.h


#/*----------------------------------*/
#
#  ../hsp3/linux
#

linux/Main.o: hsp3cl.h hsp3config.h
linux/hsp3cl.o: strbuf.h hsp3.h hsp3debug.h \
  hsp3struct.h hspvar_core.h hsp3ext.h hsp3code.h \
  hsp3config.h supio.h hsp3gr.h
linux/hsp3ext_linux.o: hsp3ext.h hsp3code.h hsp3debug.h \
  hsp3struct.h hspvar_core.h
linux/hsp3gr_linux.o: hsp3code.h hsp3debug.h hsp3struct.h \
  hspvar_core.h supio.h strbuf.h hsp3gr.h
hsp3.o: hsp3.h hsp3debug.h hsp3struct.h \
  hspvar_core.h hsp3ext.h hsp3code.h hsp3config.h \
  dpmread.h supio.h
hsp3code.o: hspwnd.h hsp3code.h hsp3debug.h \
  hsp3struct.h hspvar_core.h supio.h dpmread.h stack.h \
  strbuf.h hsp3config.h hsp3int.h
hsp3debug.o: hsp3config.h hsp3.h hsp3debug.h \
  hsp3struct.h hspvar_core.h hsp3ext.h hsp3code.h
hsp3int.o: hspwnd.h hsp3code.h hsp3debug.h \
  hsp3struct.h hspvar_core.h supio.h dpmread.h strbuf.h \
  strnote.h hsp3int.h
hspvar_core.o: hspvar_core.h hspvar_label.h \
  hsp3debug.h strbuf.h supio.h
hspvar_double.o: hspvar_core.h hsp3debug.h \
  strbuf.h
hspvar_int.o: hspvar_core.h hsp3debug.h \
  strbuf.h supio.h
hspvar_label.o: hsp3code.h hsp3debug.h \
  hsp3struct.h hspvar_core.h hspvar_label.h strbuf.h \
  supio.h
hspvar_str.o: hspvar_core.h hsp3debug.h \
  strbuf.h supio.h
hspvar_struct.o: hsp3code.h hsp3debug.h \
  hsp3struct.h hspvar_core.h strbuf.h supio.h
stack.o: stack.h hspvar_core.h hsp3debug.h
strbuf.o: supio.h strbuf.h hsp3debug.h
strnote.o: strnote.h
Dpmread.o: dpmread.h supio.h
linux/supio_linux.o: linux/supio_linux.h supio.h dpmread.h strbuf.h


#/*----------------------------------*/
#
#  ../hsp3/win32
#

win32/hsp3cl.o: win32/hsp3cl.cpp win32/hsp3gr_win.h hsp3struct.h \
  hspvar_core.h hsp3debug.h hsp3config.h \
  strbuf.h hsp3.h hsp3struct.h \
  hsp3ext.h hsp3code.h hsp3gr.h \
  supio.h win32gui/hsp3ext_win.h \
  hsp3code.h win32gui/hspvar_comobj.h \
  win32gui/comobj.h win32gui/hsp3extlib.h \
  win32gui/hspvar_comobj.h win32gui/hspvar_variant.h
win32/hsp3gr_win.o: win32/hsp3gr_win.cpp hsp3code.h \
  hsp3debug.h hsp3struct.h hspvar_core.h \
  hsp3debug.h supio.h strbuf.h \
  win32gui/filedlg.h win32/hsp3gr_win.h hsp3struct.h
win32/main.o: win32/main.cpp win32/hsp3cl.h


#/*----------------------------------*/
#
#  ../hsp3/win32gui
#

win32gui/comobj.o: win32gui/comobj.cpp hsp3code.h \
  hsp3debug.h hsp3struct.h \
  hspvar_core.h win32gui/comobj.h win32gui/comobj_event.h \
  hsp3ext.h strbuf.h
win32gui/comobj_event.o: win32gui/comobj_event.cpp hsp3code.h \
  hsp3debug.h hsp3struct.h \
  hspvar_core.h win32gui/comobj_event.h \
  win32gui/hspvar_comobj.h win32gui/comobj.h
win32gui/fcpoly.o: win32gui/fcpoly.cpp win32gui/fcpoly.h supio.h
win32gui/filedlg.o: win32gui/filedlg.cpp
win32gui/hsp3ext_win.o: win32gui/hsp3ext_win.cpp supio.h \
  hsp3ext.h win32gui/hsp3extlib.h hsp3code.h \
  hsp3debug.h hsp3struct.h \
  hspvar_core.h win32gui/hspvar_comobj.h win32gui/comobj.h \
  win32gui/hspvar_variant.h win32gui/comobj_event.h win32gui/hsp3win.h \
  hspwnd.h strbuf.h
win32gui/hsp3extlib.o: win32gui/hsp3extlib.cpp supio.h \
  dpmread.h hsp3ext.h win32gui/hsp3extlib.h \
  hsp3code.h hsp3debug.h hsp3struct.h \
  hspvar_core.h win32gui/hspvar_comobj.h win32gui/comobj.h \
  win32gui/hsp3win.h hspwnd.h strbuf.h
win32gui/hsp3gr_wingui.o: win32gui/hsp3gr_wingui.cpp hspwnd.h \
  win32gui/mmman.h win32gui/filedlg.h supio.h \
  dpmread.h stack.h strbuf.h \
  win32gui/fcpoly.h hsp3gr.h hsp3code.h \
  hsp3debug.h hsp3struct.h \
  hspvar_core.h hsp3debug.h
win32gui/hsp3win.o: win32gui/hsp3win.cpp strbuf.h hsp3.h \
  hsp3debug.h hsp3struct.h \
  hspvar_core.h hsp3ext.h hsp3code.h \
  hsp3ext.h hsp3gr.h win32gui/hspvar_comobj.h \
  win32gui/comobj.h win32gui/hspvar_variant.h supio.h
win32gui/hspvar_comobj.o: win32gui/hspvar_comobj.cpp hsp3code.h \
  hsp3debug.h hsp3struct.h \
  hspvar_core.h hsp3struct.h \
  hsp3ext.h hspvar_core.h win32gui/comobj.h \
  win32gui/hspvar_comobj.h win32gui/comobj_event.h strbuf.h \
  supio.h
win32gui/hspvar_variant.o: win32gui/hspvar_variant.cpp hsp3code.h \
  hsp3debug.h hsp3struct.h \
  hspvar_core.h hsp3struct.h \
  hsp3ext.h hspvar_core.h win32gui/comobj.h \
  win32gui/hspvar_comobj.h win32gui/hspvar_variant.h \
  win32gui/comobj_event.h strbuf.h supio.h
win32gui/hspwnd_obj.o: win32gui/hspwnd_obj.cpp hsp3config.h \
  hsp3debug.h hspwnd.h dpmread.h \
  strbuf.h strnote.h supio.h
win32gui/hspwnd_win.o: win32gui/hspwnd_win.cpp hsp3config.h \
  hsp3debug.h hspwnd.h dpmread.h \
  strbuf.h strnote.h supio.h
win32gui/main.o: win32gui/main.cpp win32gui/hsp3win.h
win32gui/mmman.o: win32gui/mmman.cpp supio.h dpmread.h \
  strbuf.h win32gui/mmman.h
win32gui/supio_win.o: win32gui/supio_win.cpp hsp3config.h \
  win32gui/supio_win.h dpmread.h strbuf.h

win32gui/hsp3.res: win32gui/hsp3.rc


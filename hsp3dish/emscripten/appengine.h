#ifndef APPENGINE_H
#define APPENGINE_H

#include <errno.h>

#include <EGL/egl.h>
//#include <GLES/gl.h>
//#include <GLES/glext.h>
#include <math.h>

//#include <android/log.h>


/**
 * �ĊJ�ɕK�v�ȕۑ����ׂ��f�[�^
 */
struct saved_state
{
    int32_t x;
    int32_t y;
};

/**
 * �A�v���P�[�V�������ŋ��ʂ��ė��p������
 */
struct engine
{
    struct android_app* app;

//    ASensorManager* sensorManager;
//    const ASensor* accelerometerSensor;
//    ASensorEventQueue* sensorEventQueue;

    int animating;
    EGLDisplay display;
    EGLSurface surface;
    EGLContext context;
    int32_t width;
    int32_t height;
    void *hspctx;
    struct saved_state state;
};

#endif

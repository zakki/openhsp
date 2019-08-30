#ifdef OPENGL_ES
precision highp float;
#else
precision mediump float;
#endif

// Varyings
varying vec4 v_color;


void main()
{
    gl_FragColor = v_color;
}
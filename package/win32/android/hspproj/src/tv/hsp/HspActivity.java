package tv.hsp;

import android.app.NativeActivity;
import android.app.Activity;
import android.app.AlertDialog;

import android.content.pm.ActivityInfo;
import android.content.Intent;
import android.content.pm.PackageManager;

import android.net.Uri;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Paint.FontMetrics;
import android.graphics.Paint.Style;
import android.graphics.Typeface;

import android.os.AsyncTask;
import android.os.Vibrator;
import android.os.Bundle;
import android.util.Log;
import android.view.Surface;
import android.widget.Toast;

import java.util.List;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Random;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;

public class HspActivity extends NativeActivity {

  public String hello() {
    return "JNITest";
  }
  public String getInfo_Device() {
    return android.os.Build.DEVICE;
  }
  public String getInfo_Version() {
    return android.os.Build.VERSION.RELEASE;
  }
  public String getInfo_FilesDir() {
    File f=this.getApplicationContext().getFilesDir();
    String path=f.toString();
    return path;
  }

  public int callVibrator( int val ) {
    Vibrator vibrator = (Vibrator)getSystemService(VIBRATOR_SERVICE);
    if (vibrator != null) vibrator.vibrate(val);
    return 0;
  }
  public int dispDialog( String msg1, String msg2, int type ) {

    AlertDialog.Builder alert = new AlertDialog.Builder(this);
    alert.setTitle(msg2);
    alert.setMessage(msg1);
    alert.show();
    return 0;
  }
  public int callActivity( String msg1, String msg2, int type ) {
    if ( type == 16 ) {
    	Uri uri = Uri.parse( msg1 );
	Intent i = new Intent();
	i.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
	i.setAction(Intent.ACTION_VIEW);
	i.setData(uri);
   	startActivity(i);
   	return 0;
    }

    Intent intent = new Intent();
    intent.setClassName( msg1, msg2 );
    intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    startActivity(intent);
    return 0;
  }

  public native void nativepoke(int val, int val2);

}


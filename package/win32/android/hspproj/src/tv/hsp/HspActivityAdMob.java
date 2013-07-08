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
import android.view.Display;
import android.view.Surface;
import android.view.WindowManager;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.Gravity;

import android.widget.Toast;
import android.widget.PopupWindow;
import android.widget.LinearLayout;
import android.widget.Button;
import android.widget.TextView;

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

import com.google.ads.*;

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



	// for AdMob
	AdView adView;
	PopupWindow popUp;
	HspActivity _activity;
	LinearLayout layout;
	LinearLayout mainLayout;
	boolean adsinited = false;
	int disp_width = 0;
	int disp_height = 0;

	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		// Make your custom init here
		//getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
		_activity = this;

		WindowManager windowmanager = (WindowManager)getSystemService(WINDOW_SERVICE);
		Display disp = windowmanager.getDefaultDisplay();
		disp_width = disp.getWidth();
		disp_height = disp.getHeight();
	       	//Log.i("HspActivity","size"+disp_width+"x"+disp_height);
		// Create our ad view here
		adView = new AdView(_activity, AdSize.BANNER, "publisherID");
	}

	// Our popup window, you will call it from your C/C++ code later
	public int callAdMob( int val ) {
		if(adsinited) {
			return -1;
		}
		if(adView!=null)  {
			_activity.runOnUiThread(new Runnable()  {
			@Override
			public void run()  {
				adsinited = true;
				// Out popup window
				popUp = new PopupWindow(_activity);
				// This is the minimum size for AdMob, we need to set this in case our target device run at 320x480 resolution (Otherwise no ad will be shown, see the padding kill below)
				//popUp.setWidth(484);
				popUp.setWidth(disp_width+4);
				popUp.setHeight(77);
				popUp.setWindowLayoutMode(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
				popUp.setClippingEnabled(false);
				layout = new LinearLayout(_activity);
				mainLayout = new LinearLayout(_activity);
				// The layout system for the PopupWindow will kill some pixels due to margins/paddings etc(No way to remove it), so padd it to adjust
				layout.setPadding(-5, -5, -5, -5);
				MarginLayoutParams params = new MarginLayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
				params.setMargins(0, 0, 0, 0);
				layout.setOrientation(LinearLayout.VERTICAL);
				layout.addView(adView, params);
				popUp.setContentView(layout);
				_activity.setContentView(mainLayout, params);
				AdRequest adRequest = new AdRequest();
				// Enable this if your are testing AdMob, otherwise you'll risk to be banned!
				//adRequest.addTestDevice(AdRequest.TEST_EMULATOR);
				//adRequest.addTestDevice("********************************");
				_activity.adView.loadAd(adRequest);
				// Show our popup window
				popUp.showAtLocation(mainLayout, Gravity.BOTTOM, 0, 0);
				popUp.update();
				}});

		}
		return 0;
	}

	// Do some cleanup
	  @Override
	  public void onDestroy() {
	    if (adView != null) {
	      adView.destroy();
	    }
	    super.onDestroy();
	  }


}


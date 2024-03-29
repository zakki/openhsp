package tv.hsp;

import android.app.NativeActivity;
import android.app.Activity;
import android.app.AlertDialog;

import android.content.pm.ActivityInfo;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.DialogInterface;
import android.content.ComponentName;

import android.graphics.Insets;
import android.net.Uri;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Paint.FontMetrics;
import android.graphics.Paint.Style;
import android.graphics.Typeface;

import android.os.AsyncTask;
import android.os.Build;
import android.os.Vibrator;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.Surface;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.Gravity;
import android.view.View.OnClickListener;

import android.view.WindowMetrics;
import android.widget.Toast;
import android.widget.PopupWindow;
import android.widget.LinearLayout;
import android.widget.Button;
import android.widget.TextView;
import android.widget.FrameLayout;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;

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
import java.io.UnsupportedEncodingException;

import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.HttpVersion;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.util.EntityUtils;

import com.google.android.gms.ads.*;
import com.google.android.gms.ads.initialization.InitializationStatus;
import com.google.android.gms.ads.initialization.OnInitializationCompleteListener;
import com.google.android.gms.ads.interstitial.InterstitialAd;
import com.google.android.gms.ads.interstitial.InterstitialAdLoadCallback;


public class HspActivity extends NativeActivity {

	// string code
	// public static final String CHAR_CODE = "Shift-JIS";
	public static final String CHAR_CODE = "UTF8";

	public String hello() {
		return "JNITest";
	}
	public String getInfo_Device() {
		return android.os.Build.DEVICE;
	}
	public String getInfo_Version() {
		return android.os.Build.VERSION.RELEASE;
	}
	public String getInfo_Locale() {
		return Locale.getDefault().getISO3Language();
	}
	public String getInfo_FilesDir() {
		File f=this.getApplicationContext().getFilesDir();
		String path=f.toString();
		return path;
	}

	// Nativeへの通知
	public native void nativepoke(int val, int val2);

	public int callVibrator( int val ) {
		Vibrator vibrator = (Vibrator)getSystemService(VIBRATOR_SERVICE);
		if (vibrator != null) vibrator.vibrate(val);
		return 0;
	}

	public int callNamedActivity( String msg1, String msg2, int mode ) {

		Intent shareIntent = new Intent(Intent.ACTION_SEND);
		shareIntent.setType("text/plain");
		shareIntent.putExtra(Intent.EXTRA_TEXT, msg2 );
		String appName = msg1; //"twitter";
		int res = -1;

		PackageManager pm = getPackageManager();
		List<?> activityList = pm.queryIntentActivities(shareIntent, 0);
		int len = activityList.size();
		for (int i = 0; i < len; i++) {
			ResolveInfo app = (ResolveInfo) activityList.get(i);
			if ((app.activityInfo.name.contains(appName))) {
				if ( mode > 0 ) {
					ActivityInfo activity = app.activityInfo;
					ComponentName name = new ComponentName(activity.applicationInfo.packageName, activity.name);
					shareIntent.setComponent(name);
					startActivity(shareIntent);
				}
				res = 0;
				break;
			}
		}
		return res;
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

		if ( type == 48 ) {
			return callNamedActivity( msg1, msg2, 1 );
		}

		Intent intent = new Intent();
		intent.setClassName( msg1, msg2 );
		intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		startActivity(intent);
		return 0;
	}

	public int ui_dispDialog( String msg1, String msg2, int type ) {
		//	OKダイアログ
		final int addtype;
		final String s_msg1;
		final String s_msg2;
		final HspActivity myActivity;

		addtype = type;
		myActivity = this;
		s_msg1 = msg1;
		s_msg2 = msg2;

		this.runOnUiThread( new Runnable()
		{
			@Override
			public void run()
			{
				AlertDialog.Builder alert = new AlertDialog.Builder(myActivity);
				// ダイアログ外で閉じた場合
				alert.setOnCancelListener(new DialogInterface.OnCancelListener()
				{
					@Override
					public void onCancel(DialogInterface dialog)
					{
						nativepoke( 0, 0 );
					}
				});

				alert.setMessage( s_msg1 );
				alert.setTitle( s_msg2 );
				if (( addtype & 1 ) > 0 ) {
					alert.setIcon(android.R.drawable.ic_dialog_alert);
				} else {
					alert.setIcon(android.R.drawable.ic_dialog_info);
				}
				alert.setPositiveButton( "OK", new DialogInterface.OnClickListener()
				{
					@Override
					public void onClick(DialogInterface dialog, int which)
					{
						nativepoke( 0, 1 );
					}
				});
				alert.create().show();
			}
		} );

		return 0;
	}

	public int ui_dispDialogYN( String msg1, String msg2, int type ) {
		//	YES/NOダイアログ
		final int addtype;
		final String s_msg1;
		final String s_msg2;
		final HspActivity myActivity;

		addtype = type;
		myActivity = this;
		s_msg1 = msg1;
		s_msg2 = msg2;

		this.runOnUiThread( new Runnable()
		{
			@Override
			public void run()
			{
				AlertDialog.Builder alert = new AlertDialog.Builder(myActivity);
				// ダイアログ外で閉じた場合
				alert.setOnCancelListener(new DialogInterface.OnCancelListener()
				{
					@Override
					public void onCancel(DialogInterface dialog)
					{
						nativepoke( 0, 0 );
					}
				});

				alert.setMessage( s_msg1 );
				alert.setTitle( s_msg2 );
				if (( addtype & 1 ) > 0 ) {
					alert.setIcon(android.R.drawable.ic_dialog_alert);
				} else {
					alert.setIcon(android.R.drawable.ic_dialog_info);
				}
				alert.setPositiveButton( "Yes", new DialogInterface.OnClickListener()
				{
					@Override
					public void onClick(DialogInterface dialog, int which)
					{
						nativepoke( 0, 6 );
					}
				});
				alert.setNegativeButton( "No", new DialogInterface.OnClickListener()
				{
					@Override
					public void onClick(DialogInterface dialog, int which)
					{
						nativepoke( 0, 7 );
					}
				});

				alert.create().show();
			}
		} );

		return 0;
	}

	public int dispDialog( String msg1, String msg2, int type ) {
		if ( type >= 4 ) return -1;
		if (( type & 2 ) > 0 ) {
			return ui_dispDialogYN( msg1, msg2, type );
		}
		return ui_dispDialog( msg1, msg2, type );
	}

	public int addWindowFlag( int type ) {
		final int addtype;
		if ( type == 1 ) {
			addtype = WindowManager.LayoutParams.FLAG_FULLSCREEN;
		} else {
			addtype = WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON;
		}
		this.runOnUiThread( new Runnable() {
			public void run()
			{
				getWindow().addFlags( addtype );
			}
		} );
		return 0;
	}

	public int clearWindowFlag( int type ) {
		final int clrtype;
		if ( type == 1 ) {
			clrtype = WindowManager.LayoutParams.FLAG_FULLSCREEN;
		} else {
			clrtype = WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON;
		}
		this.runOnUiThread( new Runnable() {
			public void run() {
				getWindow().clearFlags( clrtype );
			}
		} );
		return 0;
	}


	//	conversion ByteText->String
	public String ByteTextToString( byte[] byteText )
	{
		try {
			if( byteText == null ) return "";
			return new String(byteText, CHAR_CODE);
		}
		catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "";
		}
	}


	//	retrieve font text by bitmap data
	public Bitmap getFontBitmap( byte[] byteText, int fontsize, boolean bBold )
	{
		String text = ByteTextToString( byteText );

		Paint paint = new Paint();
		paint.setStyle(Paint.Style.FILL);
		paint.setColor(Color.WHITE);
		paint.setTextSize(fontsize);
		paint.setAntiAlias(true);
		paint.setSubpixelText(true);
		paint.setTypeface( Typeface.create( Typeface.SANS_SERIF, ( bBold ) ? Typeface.BOLD : Typeface.NORMAL ) );

		FontMetrics fontMetrics = paint.getFontMetrics();

		int width = (int)Math.round(paint.measureText(text));
		if (width <= 0) {
			width = (int)Math.round(paint.measureText("0"));
		}

		int offsetY = (int)Math.ceil(-fontMetrics.top);
		int height = offsetY + (int)(Math.ceil(fontMetrics.bottom));
		Bitmap bitmap = Bitmap.createBitmap(width,height,Bitmap.Config.ALPHA_8);
		Canvas canvas = new Canvas(bitmap);
		canvas.drawText(text,0, offsetY,paint);
		return bitmap;
	}

	//		http network task
	private String _httpResult;
	private ArrayList <NameValuePair> _httpParams;

	public String getHttpResult() {
		return _httpResult;
	}

	public int httpParamSet( String prm1, String prm2, int type ) {
		if ( type < 0 ) {
			return -1;
		}
		if ( type == 0 ) {
			_httpParams = new ArrayList <NameValuePair>();
			return 0;
		}
		_httpParams.add( new BasicNameValuePair( prm1, prm2 ) );
		return 0;
	}

	public int httpRequestGET( String url, String optstr, int type ) {

		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpParams params = httpClient.getParams();
		HttpConnectionParams.setConnectionTimeout( params, 5000 );
		HttpConnectionParams.setSoTimeout( params, 3000 );

		StringBuilder uri = new StringBuilder( url );
		HttpGet request = new HttpGet(uri.toString());
		HttpResponse httpResponse;
		_httpResult = "";
		try {
			httpResponse = httpClient.execute(request);
		} catch (Exception e) {
			return -1;
		}

		int status = httpResponse.getStatusLine().getStatusCode();
		try {
			_httpResult = EntityUtils.toString( httpResponse.getEntity(), "UTF-8" );
		} catch (Exception e) {
			return -1;
		}

		httpClient.getConnectionManager().shutdown();
		if ( status != HttpStatus.SC_OK ) {
			return status;
		}
		return 0;
	}

	public int httpRequestPOST( String url, String optstr, int type ) {

		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpParams params = httpClient.getParams();
		HttpConnectionParams.setConnectionTimeout( params, 5000 );
		HttpConnectionParams.setSoTimeout( params, 3000 );

		StringBuilder uri = new StringBuilder( url );
		HttpPost request = new HttpPost(uri.toString());
		HttpResponse httpResponse;
		_httpResult = "";
		try {
			request.setEntity( new UrlEncodedFormEntity( _httpParams, "UTF-8" ) );
			httpResponse = httpClient.execute(request);
		} catch (Exception e) {
			return -1;
		}

		int status = httpResponse.getStatusLine().getStatusCode();
		try {
			//_httpResult = EntityUtils.toString( httpResponse.getEntity(), "SHIFT-JIS" );
			_httpResult = EntityUtils.toString( httpResponse.getEntity(), "UTF-8" );
		} catch (Exception e) {
			return -1;
		}

		httpClient.getConnectionManager().shutdown();
		if ( status != HttpStatus.SC_OK ) {
			return status;
		}
		return 0;
	}


// for AdMob

	static AdView _adView;
	static String APP_ID = "ca-app-pub-3940256099942544/3419835294";
	static final String BANNER_AD_UNIT_ID = "ca-app-pub-3940256099942544/6300978111";

	static InterstitialAd _interstitialAd;
	static final String INTERSTITIAL_AD_UNIT_ID = "ca-app-pub-3940256099942544/1033173712";
	private static boolean adisshow = false;

	static final String TestDeviceID = "********************************";
	static HspActivity _instance;

	private static PopupWindow popUp;
	private static LinearLayout layout;
	private static LinearLayout mainLayout;
	private static boolean adsinited = false;
	private static boolean bShow = false;
	private static boolean bHide = false;
	private static int disp_width = 0;
	private static int disp_height = 0;
	private static int ad_height = 0;



	public static HspActivity getInstance(){
		return _instance;
	}

	@RequiresApi(api = Build.VERSION_CODES.R)
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		_instance = this;

		DisplayMetrics displayMetrics= new DisplayMetrics();
		this.getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
		disp_width = displayMetrics.widthPixels;
		disp_height = displayMetrics.heightPixels;
		ad_height = disp_height/10;
		float density = displayMetrics.density;
		int adWidth = (int) (disp_width / density);

		Log.i("HspActivity","size"+disp_width+"x"+disp_height);

		MobileAds.initialize(getApplicationContext(), new OnInitializationCompleteListener() {
			@Override
			public void onInitializationComplete(InitializationStatus initializationStatus) {
			}
		});

		_adView = new AdView(this);
		List<String> testDevices = new ArrayList<>();
		//testDevices.add(TestDeviceID);
		RequestConfiguration requestConfiguration
				= new RequestConfiguration.Builder()
				.setTestDeviceIds(testDevices)
				.build();
		MobileAds.setRequestConfiguration(requestConfiguration);

		AdSize adsize = AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(this, adWidth);
		_adView.setAdSize(adsize);
		_adView.setAdUnitId(BANNER_AD_UNIT_ID);
		_adView.setBackgroundColor(Color.TRANSPARENT);

		_adView.setVisibility(View.VISIBLE);

		_adView.loadAd( new AdRequest.Builder().build() );

		layout = new LinearLayout(_instance);
		mainLayout = new LinearLayout(_instance);
		// The layout system for the PopupWindow will kill some pixels due to margins/paddings etc(No way to remove it), so padd it to adjust
		layout.setPadding(-5, -5, -5, -5);
		layout.setOrientation(LinearLayout.VERTICAL);


		//interstitial
		//_interstitialAd = new InterstitialAd(this);
		//_interstitialAd.setAdUnitId(INTERSTITIAL_AD_UNIT_ID);

		//_interstitialAd.setAdListener(new AdListener() {
		//	@Override
		//	public void onAdClosed() {
				//requestNewInterstitial();
		//	}
		//});
		requestNewInterstitial();


	}


	private void requestNewInterstitial() {
		AdRequest adRequest = new AdRequest.Builder().build();
		InterstitialAd.load(this,INTERSTITIAL_AD_UNIT_ID,adRequest,
				new InterstitialAdLoadCallback() {
					@Override
					public void onAdLoaded(@NonNull InterstitialAd interstitialAd) {
						// The mInterstitialAd reference will be null until
						// an ad is loaded.
						_interstitialAd = interstitialAd;
						Log.i("HspActivity", "onAdLoaded");
						adisshow = true;
					}
				}
		);
	}
	public void showIntersAd() {
		Activity my = this;
		runOnUiThread(new Runnable() {
			@Override
			public void run() {
				if (adisshow) {
					_interstitialAd.show(my);
				}
			}
		});
	}

	public int hideAd() {
		if(adsinited) {
			runOnUiThread(new Runnable() {
				@Override
				public void run() {
					_adView.removeView(layout);
					layout.setEnabled(false);
					layout.setVisibility(View.GONE);
					_adView.pause();
					bHide = true;
				}
			});
			return 0;
		}
		return -1;
	}

	public int showAd() {

		if(bHide == true){
			if ( bShow == false ) {
				return -1;
			}
			runOnUiThread(new Runnable() {
				@Override
				public void run() {
					layout.setEnabled(true);
					layout.setVisibility(View.VISIBLE);
					_adView.resume();
					bHide = false;
				}
			});
		}
		if(adsinited == true) {
			return -1;
		}
		if(_adView!=null)  {
			Log.i("HspActivity","callAdMob.");
			_instance.runOnUiThread(new Runnable()  {
				@Override
				public void run()  {
					adsinited = true;
					// Out popup window
					popUp = new PopupWindow(_instance);
					// This is the minimum size for AdMob, we need to set this in case our target device run at 320x480 resolution (Otherwise no ad will be shown, see the padding kill below)
					popUp.setWidth(disp_width+10);
					popUp.setHeight(ad_height);
					popUp.setWindowLayoutMode(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT);
					popUp.setClippingEnabled(false);

					MarginLayoutParams params = new MarginLayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
					params.setMargins(0, 0, 0, 0);

					layout.addView(_adView, params);
					popUp.setContentView(layout);
					_instance.setContentView(mainLayout, params);

					Log.i("HspActivity","loadAd.");
					popUp.showAtLocation(mainLayout, Gravity.NO_GRAVITY, 0, disp_height-ad_height);
					popUp.update();
					bShow = true;
					bHide = false;
				}
			});

		} else {
			Log.i("HspActivity","callAdMob failed.");
		}
		return 0;
	}
	@Override
	protected void onResume() {
		super.onResume();
		if (_adView != null) {
			_adView.resume();
		}
	}
	@Override
	protected void onPause() {
		if (_adView != null) {
			_adView.pause();
		}
		super.onPause();
	}
	@Override
	protected void onDestroy() {
		if (_adView != null) {
			if(adsinited) {
				popUp.dismiss();
			}
			_adView.destroy();
		}
		super.onDestroy();
	}

	public int callAdMob( int val ) {
		if(_adView!=null)  {
			Log.i("HspActivity","callAdMob.");

			if ( val < 0 ) {
				hideAd();
				return 0;
			}
			if ( val == 0 ) {
				showAd();
				return 0;
			}
			if (( val & 16 )==16) {
				HspActivity.getInstance().showIntersAd();
				return 0;
			}

		} else {
			Log.i("HspActivity","callAdMob failed.");
		}
		return 0;
	}



}


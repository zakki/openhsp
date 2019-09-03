%dll
arduino
%ver
3.5
%date
2016/07/01
%author
onitama

%url
http://hsp.tv/

%note
arduino.asをインクルードすること。

%type
ユーザー定義命令

%group
拡張入出力制御命令

%port
Win

%index
arduino_init
arduino通信の初期化

%prm
port, baud
port=0～(0) : COMポート番号
baud=0～(0) : 通信ボーレート

%inst
USBを経由したarduinoデバイスとのシリアル通信を初期化します。
初期化の結果が、システム変数statに反映されます。
statが0の場合は、初期化が正常に終了したことを示します。
それ以外の場合は、エラーが発生しています。エラーが発生した場合は、変数arduino_errorにエラーメッセージが格納されます。

arduino.asがサポートする命令を使用する際には、最初に必ずarduino_initを呼び出して下さい。
arduino_init命令には、COMポート番号とボーレートのパラメーターを正しく指定する必要があります。
Arduino IDEで通信を行なっているCOMポート番号、及びfirmataで使用しているボーレート(通常は57600)を適切に記述してください。

%href
arduino_bye
arduino_exec



%index
arduino_bye
arduino通信の終了

%prm

%inst
arduinoデバイスとのシリアルポートの解放を行ない通信を終了します。


%href
arduino_init
arduino_exec



%index
arduino_exec
arduino受信処理の実行

%prm

%inst
USBを経由したarduinoデバイスとの受信処理を実行します。
結果が、システム変数statに反映されます。statが0の場合は、初期化が正常に終了したことを示します。
それ以外の場合は、エラーが発生しています。エラーが発生した場合は、変数arduino_errorにエラーメッセージが格納されます。
arduino_exec命令は、シリアル通信を監視して、arduinoからのメッセージを適切に処理します。
アプリケーションの動作中は、一定時間ごとに実行するようにしてください。

%sample
	arduino_exec
	if stat {
		; エラーがあれば終了
		dialog arduino_error
		end
	}

%href
arduino_init
arduino_bye


%index
delay
時間待ち

%prm
ms
ms=0～(0) : 実行を待つ時間(ミリ秒単位)

%inst
指定された時間、スクリプトの実行を停止させます。
内部的には、await命令と変わりありません。
arduino IDEで用意されているdelay関数と互換で使用することができます。

%href
await
arduino_init


%index
pinmode
ピンのモード設定

%prm
pin, outmode
pin=0～(0)     : デジタルピン番号
outmode=0～(0) : 設定されるモード(MODE_*)

%inst
arduinoのデジタルピンを指定したモードに設定します。
たとえば、「pinmode 9, MODE_OUTPUT」は、9番のピンをデジタル出力に設定します。
pinmode命令は、firmataで規定されたいくつかのモードを指定することができます。
以下のモードがマクロとして定義されています。
^p
	モード名       内容
	--------------------------------
	MODE_INPUT    デジタル入力
	MODE_OUTPUT   デジタル出力
	MODE_ANALOG   アナログ出力
	MODE_PWM      PWM制御(出力)
	MODE_SERVO    サーボ制御(出力)
^p
適切にモード設定を行なった後は、指定されたピンでの入出力が可能になります。

%href
digitalWrite
analogWrite
digitalRead
analogRead

%index
digitalWrite
デジタルデータの出力

%prm
pin, value
pin=0～(0)   : デジタルピン番号
value=0～(0) : 出力する値

%inst
pinで指定されたピンに、valueで設定された値を出力します。
出力される値は、0(OFF)、か1(ON)のどちらかになります。「D_LOW」(OFF)、か「D_HIGH」(ON)のマクロを指定することも可能です。

%href
analogWrite


%index
analogWrite
アナログデータの出力

%prm
pin, value
pin=0～(0)   : デジタルピン番号
value=0～(0) : 出力する値

%inst
pinで指定されたピンに、valueで設定された値を出力します。
出力される値は、0(最小)から255(最大)の範囲となります。「D_LOW」(0)、か「D_HIGH」(255)のマクロを指定することも可能です。

%href
digitalWrite


%index
digitalRead
デジタルデータの読み出し

%prm
(pin)
pin=0～(0)   : デジタルピン番号

%inst
pinで指定されたピンの内容を取得します。
取得される値は、0(OFF)、か255(ON)のどちらかになります。「D_LOW」(OFF)、か「D_HIGH」(ON)のマクロにより比較することも可能です。

%href
analogRead
digitalReport


%index
analogRead
アナログデータの読み出し

%prm
(analogpin)
analogpin=0～(0)   : アナログピン番号

%inst
pinで指定されたアナログピンの内容を取得します。
取得される値は、0(最小)、か1023(最大)の範囲になります。「A_LOW」(最小)、か「A_HIGH」(最大)のマクロにより比較することも可能です。
^p
	digitalReport 0, 1	; アナログポート0を読み出す設定
	value=analogRead(0)	; 実際の値を読み出す
^p
初期化の後に、analogReport命令を使って指定されたポートの読み出しを開始する必要があるので注意してください。
また、analogInterval命令によりアナログポート読み出しの周期を設定することも可能です。


%href
analogReport
analogInterval
digitalRead


%index
analogReport
アナログデータの読み出し設定

%prm
analogpin, sw
analogpin=0～(0) : アナログピン番号
sw=0～(0)        : 読み出し設定(0=OFF,1=ON)

%inst
指定されたアナログピンの読み出しON/OFFを制御します。
analogRead命令による読み出しの設定を行なう場合は、必ず読み出し設定をONにする必要があります。(デフォルトはOFFに設定されています)
読み出し設定がONの時は、analogInterval命令により設定された周期でアナログピンの値が更新されます。

%href
analogRead
analogInterval


%index
digitalReport
デジタルデータの読み出し設定

%prm
port, sw
port=0～(0) : デジタルポート番号
sw=0～(0)   : 読み出し設定(0=OFF,1=ON)

%inst
指定されたデジタルピンの読み出しON/OFFを制御します。
読み出し設定がONの時は、デジタルピンの変更を取得可能になります。
(デフォルトはONに設定されていますので、通常は特に設定する必要ありません)
digitalRead命令による読み出しの設定を行なう場合は、必ず読み出し設定がONになっている必要があります。

%href
digitalRead


%index
analogInterval
アナログデータの読み出し間隔設定

%prm
analogpin, ms
analogpin=0～(0) : アナログピン番号
ms=0～(0)        : 読み出し間隔(ミリ秒単位)

%inst
指定されたアナログピンの読み出し間隔をミリ秒単位で設定します。

%href
analogRead
analogReport



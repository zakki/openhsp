;
;	arduino.as - シリアル接続されたarduinoを制御するためのモジュール
;	             hspext.dllのシリアル通信機能を使ってfirmataプロトコルを
;	             送信します(arduino側はfirmataをアップロードしておきます)
;	             詳しくは、ドキュメントhsp_arduino.txtを参照してください
;	             2016/6/28 onitama
;
#ifndef __arduino__
#define __arduino__

#module
#include "hspext.as"

#define global MODE_INPUT    (0x00)
#define global MODE_OUTPUT   (0x01)
#define global MODE_ANALOG   (0x02)
#define global MODE_PWM      (0x03)
#define global MODE_SERVO    (0x04)
#define global MODE_SHIFT    (0x05)
#define global MODE_I2C      (0x06)
#define global MODE_ONEWIRE  (0x07)
#define global MODE_STEPPER  (0x08)
#define global MODE_ENCODER  (0x09)
#define global MODE_SERIAL   (0x0A)
#define global MODE_PULLUP   (0x0B)
#define global MODE_IGNORE   (0x7F)

#define START_SYSEX             0xF0 // start a Sysex message
#define END_SYSEX               0xF7 // end a Sysex message
#define PIN_MODE_QUERY          0x72 // ask for current and supported pin modes
#define PIN_MODE_RESPONSE       0x73 // reply with current and supported pin modes
#define PIN_STATE_QUERY         0x6D
#define PIN_STATE_RESPONSE      0x6E
#define CAPABILITY_QUERY        0x6B
#define CAPABILITY_RESPONSE     0x6C
#define ANALOG_MAPPING_QUERY    0x69
#define ANALOG_MAPPING_RESPONSE 0x6A
#define REPORT_FIRMWARE         0x79 // report name and version of the firmware

#deffunc arduino_init int port, int baud

	sdim arduino_error@,256
	arduino_stat@=0
	arduino_ready@=0

	comopen port,"baud="+baud+" parity=N data=8 stop=1"
	if stat {
		arduino_error@="COMポートの初期化に失敗しました"
		arduino_stat@=-1
	}

	data=0
	sdim buf,256
	sdim wbuf,256
	sdim pin_digital,128
	dim pin_analog,128
	sdim en_digital,128
	sdim en_analog,128
	dim comdata,16

	poke wbuf,0,START_SYSEX
	poke wbuf,1,REPORT_FIRMWARE
	poke wbuf,2,END_SYSEX
	computb wbuf,3

	;	デジタルポートの通知をONにする
	digitalReport 0,1
	digitalReport 1,1
	return


#deffunc arduino_bye

	if arduino_ready@=0 : return
	comclose
	arduino_ready@=0
	return


#deffunc arduino_query

	if arduino_ready@=0 {
		arduino_error@="クエリを取得できません"
		arduino_stat@=-3
		return
	}

	poke wbuf,0,START_SYSEX
	poke wbuf,1,ANALOG_MAPPING_QUERY
	poke wbuf,2,END_SYSEX
	poke wbuf,3,START_SYSEX
	poke wbuf,4,CAPABILITY_QUERY
	poke wbuf,5,END_SYSEX
	computb wbuf,6
	return


#deffunc pinmode int pin, int outmode

	if arduino_ready@=0 : return

	poke wbuf,0,0xf4
	poke wbuf,1,pin
	poke wbuf,2,outmode
	computb wbuf,3
	return

#deffunc digitalWrite int pin, int value

	if arduino_ready@=0 : return

	poke wbuf,0,0xf5
	poke wbuf,1,pin
	poke wbuf,2,value&1
	computb wbuf,3
	return

#deffunc analogWrite int pin, int value

	if arduino_ready@=0 : return

	poke wbuf,0,0xe0+pin
	poke wbuf,1,value&0x7f
	poke wbuf,2,value>>7
	computb wbuf,3
	return

#defcfunc digitalRead int pin

	return (pin_digital(pin>>3)>>(pin&7))&1

#defcfunc analogRead int analogpin

	return pin_analog(analogpin)

#deffunc analogReport int pin, int sw

	if arduino_ready@=0 : return

	poke wbuf,0,0xc0+pin
	poke wbuf,1,sw
	computb wbuf,2
	return

#deffunc digitalReport int port, int sw

	if arduino_ready@=0 : return

	poke wbuf,0,0xd0+port
	poke wbuf,1,sw
	computb wbuf,2
	return

#deffunc analogInterval int pin, int ms

	if arduino_ready@=0 : return

	poke wbuf,0,0xf0
	poke wbuf,1,0x7a
	poke wbuf,2,ms & 0x7f
	poke wbuf,3,ms>>7
	poke wbuf,4,0xf7
	computb wbuf,5
	return



#deffunc arduino_exec

	if arduino_stat@ : return

*execmain
	arduino_rx@=0
	gosub *rcv
	if arduino_rx : goto *execmain
	return arduino_stat@

*rcv
	comstat comdata
	if comdata!=0 {
		arduino_error@="通信中のエラーです"
		arduino_stat@=comdata
		return
	}

	comgetc data
	if stat=0 : return

	;mes strf("rx : %x %d",data, comdata(2))

	cmdsize=0
	bufsize=0
	msn = data & 0xf0;
	if (msn == 0x90 ) : goto *msg_digital
	if (msn == 0xE0 ) : goto *msg_analog
	if (msn == 0xC0 ) : goto *rep_analog
	if (msn == 0xD0 ) : goto *rep_digital

	if (data == START_SYSEX) {
		comgetc cmdreq
		if stat=0 : return
		goto *getsysex
	}
	if ( data=0xf9 ) {
		cmdreq = data
		cmdsize = 2 : goto *getprm
	}
	return

*msg_analog
	;	analog I/O message
	arduino_rx@=data
	id=data&15
	comgetc data : if stat=0 : return
	comgetc data2 : if stat=0 : return
	data|=data2<<7
	pin_analog(id) = data
	;mes strf("analog : %d : %d",id,data)
	return

*msg_digital
	;	digital I/O message
	arduino_rx@=data
	id=data&15
	comgetc data : if stat=0 : return
	comgetc data2 : if stat=0 : return
	data|=data2<<7
	poke pin_digital, id, data
	;mes strf("digital : %d : %d",id,data)
	return

*rep_analog
	;	report analog pin
	arduino_rx@=data
	id=data&15
	comgetc data : if stat=0 : return
	poke en_analog, id, data
	return

*rep_digital
	;	report digital port
	arduino_rx@=data
	id=data&15
	comgetc data : if stat=0 : return
	poke en_digital, id, data
	return


*getprm
	;	arduino側からの通信をパースする
	poke buf, bufsize, data
	;mes strf("[%02x]",data)
	bufsize++
	if cmdsize>0 {
		cmdsize--
		comgetc data
		if stat=0 {
			arduino_error@="受信データが不正です"
			arduino_stat@=-2
			return
		}
		goto *getprm
	}
	;mes strf("data : %x : %d",cmdreq,bufsize)
	arduino_rx@=cmdreq
	return

*getsysex
	;	arduino側からのsysex通信をパースする
	comgetc data
	if stat=0 {
		await 0 : goto *getsysex
		;arduino_error@="受信データが不正です"
		;arduino_stat@=-3
		;return
	}
	;mes strf("[%02x]",data)
	if data=0xf7 {
		;mes strf("sysex : %x : %d",cmdreq,bufsize)
		arduino_rx@=cmdreq
		goto *parsesysex
	}
	poke buf, bufsize, data
	bufsize++
	goto *getsysex

*parsesysex
	if cmdreq=0x79 {		; firm,version
		arduino_firm_ver@="Version "+peek( buf, 0 )+"."+peek( buf, 1 )
		;mes arduino_firm_ver@
		arduino_ready@=1
		return
	}


	return

#global

#endif


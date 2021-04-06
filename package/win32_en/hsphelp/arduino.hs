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
Include arduino.as.

%type
User-defined instructions

%group
Extended I / O control instructions

%port
Win

%index
arduino_init
Initialization of arduino communication

%prm
port, baud
port = 0 to (0): COM port number
baud = 0 to (0): Communication baud rate

%inst
Initializes serial communication with the arduino device via USB.
The result of initialization is reflected in the system variable stat.
If stat is 0, it indicates that the initialization was successful.
Otherwise, an error has occurred. If an error occurs, the error message is stored in the variable arduino_error.

When using the instructions supported by arduino.as, be sure to call arduino_init first.
The COM port number and baud rate parameters must be specified correctly in the arduino_init instruction.
Please describe the COM port number communicating with Arduino IDE and the baud rate (usually 57600) used by firmata appropriately.

%href
arduino_bye
arduino_exec



%index
arduino_bye
End of arduino communication

%prm

%inst
Releases the serial port with the arduino device and terminates communication.


%href
arduino_init
arduino_exec



%index
arduino_exec
Execution of arduino reception processing

%prm

%inst
Performs reception processing with the arduino device via USB.
The result is reflected in the system variable stat. If stat is 0, it indicates that the initialization was successful.
Otherwise, an error has occurred. If an error occurs, the error message is stored in the variable arduino_error.
The arduino_exec instruction monitors serial communication and handles messages from arduino appropriately.
Make sure to run it at regular intervals while the application is running.

%sample
	arduino_exec
	if stat {
End if there is an error
		dialog arduino_error
		end
	}

%href
arduino_init
arduino_bye


%index
delay
Waiting for time

%prm
ms
ms = 0 to (0): Time to wait for execution (in milliseconds)

%inst
Stops script execution for the specified time.
Internally, it's no different from the await instruction.
It can be used compatible with the delay function provided by the arduino IDE.

%href
await
arduino_init


%index
pinmode
Pin mode setting

%prm
pin, outmode
pin = 0 to (0): Digital pin number
outmode = 0 to (0): Mode to be set (MODE_ *)

%inst
Set the arduino digital pin to the specified mode.
For example, "pin mode 9, MODE_OUTPUT" sets pin 9 to digital output.
The pinmode instruction can specify some modes specified by firmata.
The following modes are defined as macros.
^p
Mode name Contents
	--------------------------------
MODE_INPUT digital input
MODE_OUTPUT digital output
MODE_ANALOG Analog output
MODE_PWM PWM control (output)
MODE_SERVO Servo control (output)
^p
After properly setting the mode, input / output with the specified pin is possible.

%href
digitalWrite
analogWrite
digitalRead
analogRead

%index
digitalWrite
Digital data output

%prm
pin, value
pin = 0 to (0): Digital pin number
value = 0 to (0): Output value

%inst
The value set by value is output to the pin specified by pin.
The output value will be either 0 (OFF) or 1 (ON). You can also specify a "D_LOW" (OFF) or "D_HIGH" (ON) macro.

%href
analogWrite


%index
analogWrite
Output of analog data

%prm
pin, value
pin = 0 to (0): Digital pin number
value = 0 to (0): Output value

%inst
The value set by value is output to the pin specified by pin.
The output value will be in the range 0 (minimum) to 255 (maximum). You can also specify a "D_LOW" (0) or "D_HIGH" (255) macro.

%href
digitalWrite


%index
digitalRead
Reading digital data

%prm
(pin)
pin = 0 to (0): Digital pin number

%inst
Gets the contents of the pin specified by pin.
The value retrieved will be either 0 (OFF) or 255 (ON). It is also possible to compare by the macro of "D_LOW" (OFF) or "D_HIGH" (ON).

%href
analogRead
digitalReport


%index
analogRead
Reading analog data

%prm
(analogpin)
analogpin = 0 to (0): analog pin number

%inst
Gets the contents of the analog pin specified by pin.
The value retrieved can be in the range 0 (minimum) or 1023 (maximum). It is also possible to compare by macro of "A_LOW" (minimum) or "A_HIGH" (maximum).
^p
digitalReport 0, 1; Setting to read analog port 0
value = analogRead (0); Read the actual value
^p
Note that after initialization, you must start reading the specified port using the analogReport instruction.
It is also possible to set the analog port read cycle with the analogInterval instruction.


%href
analogReport
analogInterval
digitalRead


%index
analogReport
Analog data read settings

%prm
analogpin, sw
analogpin = 0 to (0): analog pin number
sw = 0 to (0): Read setting (0 = OFF, 1 = ON)

%inst
Controls read ON / OFF of the specified analog pin.
When setting the read by the analogRead instruction, it is necessary to turn on the read setting. (Default is set to OFF)
When the read setting is ON, the analog pin value is updated at the cycle set by the analogInterval command.

%href
analogRead
analogInterval


%index
digitalReport
Digital data read settings

%prm
port, sw
port = 0 to (0): Digital port number
sw = 0 to (0): Read setting (0 = OFF, 1 = ON)

%inst
Controls read ON / OFF of the specified digital pin.
When the read setting is ON, the digital pin change can be acquired.
(The default is set to ON, so normally you do not need to set it in particular.)
When setting the read by the digitalRead instruction, the read setting must be ON.

%href
digitalRead


%index
analogInterval
Analog data read interval setting

%prm
analogpin, ms
analogpin = 0 to (0): analog pin number
ms = 0 to (0): Read interval (in milliseconds)

%inst
Sets the read interval for the specified analog pin in milliseconds.

%href
analogRead
analogReport



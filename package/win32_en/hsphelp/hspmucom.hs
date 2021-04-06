%dll
hspmucom

%ver
3.6

%date
2020/01/14

%author
onitama

%url
http://hsp.tv/

%note
Include hspmucom.as.

%type
Extension instructions

%group
Extended sound output control instructions

%port
Win


%index
mucominit
MUCOM88 initialization

%prm
p1, option
p1 (0): Window handle
option (0): Initialization option

%inst
Initialize MUCOM88.
In order to use the various functions of MUCOM88, it is necessary to initialize it first.
The p1 parameter specifies the window handle used by the sound driver.
If p1 is omitted or 0 is specified, the currently active window is targeted.
Normally, specify hwnd (HSP window handle).
The option parameter can specify the following values.
^p
   Value: Content
 ---------------------------------------------------------------
    +1: Disable FM synthesis simulation (fmgen)
    +2: Enable SCCI (scci.dll required)
^p
When SCCI is enabled, FM sound source control on an external device via scci.dll is possible.
For details, refer to the MUCOM 88 manual.
If an error occurs, the system variable stat is assigned a non-zero value.

%href
mucombye


%index
mucombye
Release MUCOM 88

%prm

%inst
Releases MUCOM88.
Terminates all resources and interrupts that MUCOM88 has.
Call it when you are finished using MUCOM88.
Please note that the onexit instruction must be called when the application is closed.

%href
mucombye


%index
mucomreset
Reset MUCOM 88

%prm
option
option (0): Reset option

%inst
Reset the MUCOM 88.
All data including the music and timbre data being played will be reset.
When playing music or compiling MML, you need to do a reset first.
The option parameter can specify the following values.
^p
   Label: Content
 ---------------------------------------------------------------
   MUCOM_RESET_PLAYER Reset MUCOM 88 as a music player
   MUCOM_RESET_COMPILE Reset MUCOM88 as MML compiler
   MUCOM_RESET_EXTFILE Do not reference internal files when initializing MML compiler
^p
When resetting, you must always select either the music player (MUCOM_RESET_PLAYER) or the MML compiler (MUCOM_RESET_COMPILE). (If you want to play music after MML compilation, you need to reset it as MML compiler and then reset it again as music player.)
MUCOM_RESET_EXTFILE is an option to read the PC-8801 driver file (muc88, msub, etc.) used by MUCOM88 as an external file. Normally, you do not need to specify it.
If an error occurs, the system variable stat is assigned a non-zero value.

%href
mucomload
mucomcomp


%index
mucomplay
Play music

%prm
p1
p1 (0): Bank No.

%inst
Plays the music of the specified bank number.
First, it is necessary to read the MUCOM88 music data (.mub) by the mucomload instruction.
If an error occurs, the system variable stat is assigned a non-zero value.

%href
mucomload
mucomstop


%index
mucomstop
Stop playing

%prm
p1
p1 (0): Stop option

%inst
Stops the music played by the mucom play command.
Normally, the stop option for p1 can be 0 or omitted.
If $ 1000 is specified for p1, forced stop processing including the driver will be performed.
If an error occurs, the system variable stat is assigned a non-zero value.

%href
mucomplay
mucomfade


%index
mucomfade
Fade out playback

%prm
p1
p1 (0): Fade speed

%inst
Fade out the music played by the mucom play command.
* This command is currently out of support as it cannot be used correctly.
If an error occurs, the system variable stat is assigned a non-zero value.

%href
mucomplay


%index
mucomload
Read music data

%prm
"filename",p1
"filename": MUCOM88 music data file (.mub)
p1 (0): Bank No.

%inst
MUCOM88 Reads music data (.mub).
By specifying the bank number (0 to 15) to read with p1, the file with "filename" is read and prepared for playback.
MUCOM88 music data (.mub) must be created in advance with a music tool (MUCOM88Win) or compiled from an MML file (.muc).
Before using the mucomload command, you must first reset the MUCOM88 as a music player with the mucom reset command.
If an error occurs, the system variable stat is assigned a non-zero value.

%href
mucomreset
mucomplay


%index
mucomloadpcm
Read PCM data

%prm
"filename"
"filename": MUCOM88PCM data file (.bin)

%inst
Loads the MUCOM88PCM data file (.bin) that is used by default.
The PCM data file is referenced when PCM is not specified when compiling MML.
If you do not need to specify it, enter "mucomloadpcm" "" (not specified).
If an error occurs, the system variable stat is assigned a non-zero value.

%href
mucomcomp


%index
mucomloadvoice
FM tone data reading

%prm
"filename"
"filename": MUCOM88FM tone data file (.dat)

%inst
Loads the MUCOM 88FM tone data file (.dat) used by default.
The FM tone data file is referenced when the tone file is not specified during MML compilation.
Normally, it is automatically referenced from MML, so there is no need to write it.
If an error occurs, the system variable stat is assigned a non-zero value.

%href
mucomcomp


%index
mucomtag
Get tag data

%prm
var,"tagname"
var: Variable to which the acquired data is assigned
"tagname": tag string

%inst
Gets the tags defined in the MUCOM88 music data read by the mucomload command.
By specifying the tag character string with "tagname", the definition contents corresponding to the tag character string are assigned to the variable.
If you write "mucom tag a," title "", the contents of the "title" tag will be assigned to the variable a.
If the tag string is specified as an empty string (""), all definition tables are assigned to the variable.
If an error occurs, the variable is assigned an empty string ("") and the system variable stat is assigned a non-zero value.

%href
mucomload


%index
mucomcomp
Compile MML

%prm
"mmlfile","outfile",option
"mmlfile": MUCOM88 MML file to be read (.muc)
"outfile": Output MUCOM88 music data file (.mub)
option (0): Compile option

%inst
Compiles an MML file (.muc) written in the MUCOM88 format and outputs a MUCOM88 music data file (.mub).
The option parameter can specify the following values.
^p
   Value: Content
 ---------------------------------------------------------------
    0: Perform normal MUCOM 88 compilation
    +1: Ignore #voice tag
^p
Before using the mucomcomp instruction, you must first reset MUCOM88 as an MML compiler with the mucom reset instruction.
The message of the compilation result can be obtained by the mucomres instruction.
If an error occurs, the system variable stat is assigned a non-zero value.

%href
mucomres
mucommml


%index
mucommml
Compile MML

%prm
var,option
var: Variable containing MML
option (0): Compile option

%inst
Directly compiles MML strings written in MUCOM88 format.
The compiled result is stored in the music buffer 0, and it is possible to play from the compilation without going through a file.
The option parameter can be similar to the mucomcomp instruction.
Before using the mucommml instruction, you must first reset MUCOM88 as an MML compiler with the mucom reset instruction.
If an error occurs, the system variable stat is assigned a non-zero value.

%href
mucomres
mucomcomp


%index
mucomloadtag
Reading tag data

%prm
var,"mmlfile"
var: Variable to which the acquired data is assigned
"mmlfile": MUCOM88 MML file to be read (.muc)

%inst
Extracts only the defined tag information from the MML file (.muc) described in the MUCOM88 format and assigns it to a variable.
It can be used when you want to retrieve only the tag information without compiling.
If an error occurs, the system variable stat is assigned a non-zero value.

%href
mucomload


%index
mucomres
Get MUCOM88 execution result

%prm
var
var: Variable to which the acquired data is assigned

%inst
Gets the message of the compilation result by the mucomcomp instruction.
All the contents of the message buffer output by MUCOM88 are assigned to the variable as a character string.
If an error occurs, the system variable stat is assigned a non-zero value.

%href
mucomcomp


%index
mucomstat
Get MUCOM 88 status

%prm
var,option
var: Variable to which the acquired data is assigned
option (0): Get option

%inst
MUCOM88 Gets the internal status during playback and assigns it to a variable.
First, you need to reset the MUCOM 88 as a music player with the mucom reset command.
The content to be retrieved is specified by the option parameter.
The option parameter can specify the following values. All the numbers obtained will be of integer type.
^p
   Label: Content
 ---------------------------------------------------------------
   MUCOM_STATUS_PLAYING Playing flag (Stop = 0 / Playing = 1)
   MUCOM_STATUS_INTCOUNT Interrupt count (total)
   MUCOM_STATUS_PASSTICK Load on stream playback (ms)
   MUCOM_STATUS_MAJORVER Major version code
   MUCOM_STATUS_MINORVER Minor version code
   MUCOM_STATUS_COUNT interrupt count
   MUCOM_STATUS_MAXCOUNT Maximum number of counts (*)
   MUCOM_STATUS_MUBSIZE Music data size (*)
   MUCOM_STATUS_MUBRATE Music data memory usage (%) (*)
   MUCOM_STATUS_BASICSIZE MML data size (*)
   MUCOM_STATUS_BASICRATE Memory usage of MML data (%) (*)

(*) Can be obtained only after compilation
^p
If an error occurs, the system variable stat is assigned a non-zero value.

%href
mucomplay
mucomcomp


%index
mucomsetvolume
MUCOM88 volume setting

%prm
fmvol, ssgvol
fmvol (0): FM sound source volume setting
ssgvol (0): PSG sound source volume setting

%inst
Adjust the volume of each sound source simulated by MUCOM 88 in the + -direction. The standard value is 0.
Specify an integer in units of approximately 1/2 dB. The upper limit of the effective range is 20 (10 dB).
Volume settings are not reflected when using SCCI.
If an error occurs, the system variable stat is assigned a non-zero value.

%href
mucomplay


%index
mucomgetchdata
Acquisition of performance information

%prm
var, ch
var: Variable to which the acquired data is assigned
ch (0): Channel No. (0 to 10)

%inst
Acquires the performance information of the MUCOM88 player for each channel.
By specifying the channel number (0 to 10) in the ch parameter, the current state is assigned to the variable specified by var.
The variable is set as an array variable and the status is returned for each array element.
^p
   Array element: Content
 ---------------------------------------------------------------
   MUCOM_CHDATA_LENGTH Note length
   MUCOM_CHDATA_VNUM Tone No. (internal index value)
   MUCOM_CHDATA_WADR Data address during performance 1
   MUCOM_CHDATA_TADR Data address during performance 2
   MUCOM_CHDATA_VOL Volume (internal value)
   MUCOM_CHDATA_ALG algorithm value
   MUCOM_CHDATA_CH Channel No.
   MUCOM_CHDATA_DETUNE Detune value
   MUCOM_CHDATA_TLLFO TLLFO value
   MUCOM_CHDATA_REVERB Reverb parameter
   MUCOM_CHDATA_QUANTIZE Quantize value
   MUCOM_CHDATA_LFODELAY LFO parameter
   MUCOM_CHDATA_LFOCOUNT LFO parameter
   MUCOM_CHDATA_LFODIFF LFO parameter
   MUCOM_CHDATA_LFOPEAK LFO parameter
   MUCOM_CHDATA_FNUM1 Set FNUM value 1
   MUCOM_CHDATA_FNUM2 Set FNUM value 2
   MUCOM_CHDATA_FLAG Performance flag 1
   MUCOM_CHDATA_CODE code value
   MUCOM_CHDATA_FLAG2 Performance flag 2
   MUCOM_CHDATA_PAN Pan setting value
   MUCOM_CHDATA_KEYON key-on flag
   MUCOM_CHDATA_VNUMORIG Tone No.
   MUCOM_CHDATA_VOLORIG volume
^p
For example, if you write "mucomgetchdata a, 0", the state of channel 0 (A) is assigned to the variable a.
After that, you can refer to the tone number being played with "a (MUCOM_CHDATA_VNUMORIG)".
First, you need to reset the MUCOM 88 as a music player with the mucom reset command.
If an error occurs in the mucomgetchdata instruction, the system variable stat is assigned a non-zero value.

%href
mucomplay





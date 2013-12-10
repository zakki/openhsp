;
;	HSP help manager用 HELPソースファイル
;	(先頭が「;」の行はコメントとして処理されます)
;

%type
内蔵命令
%ver
3.4
%note
ver3.4標準命令
%date
2013/12/09
%author
onitama
%url
http://hsp.tv/
%port
Win
Cli
Let



%index
await
一定の時間で待つ
%group
プログラム制御命令
%prm
p1
p1=0〜(0) : 待ち時間(1ms単位)

%inst
プログラムの実行を一定時間だけ中断します。
^
wait命令と似ていますが、 await命令は前回waitした時間からの待ち時間を指定します。これにより、描画速度の違いなどから時間が早く過ぎることを防止することができます。リアルタイムで更新される画面などの速度を一定に保つ時に使用します。
^
HSPでは、他のWindowsタスクに処理時間を渡すために長い時間ループが起こる可能性がある場所にはwaitかawait命令を入れることを推奨しています。waitや await命令がない命令の中を長い時間ループするようなプログラムを実行すると、ウィンドウをドラッグしにくくなったり、他のタスクに移るのに時間がかかったりします。

%href
wait




%index
exec
Windowsのファイルを実行する
%group
プログラム制御命令
%prm
"filename",p1,"command"
"filename" : 対象となるファイル名
p1=0〜(0)  : ファイル実行モード
"command"  : コンテキストメニューの操作名

%inst
execは "filename" で指定したファイル名のアプリケーションを実行します。
拡張子がEXEの場合は、拡張子を省略することができます。
p1で実行時のモードを選ぶことができます。p1を省略した場合は0になります。
^p
 モード0  : HSPノーマル実行
 モード2  : 最小化モードで実行
 モード16 : 関連付けされたアプリケーションを実行
 モード32 : 指定したファイルを印刷する
^p
"command"が指定された場合は、 "filename"で指定したファイルまたはフォルダ名に対するコンテキストメニュー操作名となります。
コンテキストメニュー操作名は、レジストリに登録されているアクションを指定する文字列で、標準で以下のようなものが用意されています。
^p
  操作名     |     説    明
 ---------------------------------------------------------------------
  edit       | エディタを開いて編集する。
  explore    | フォルダを選択して、エクスプローラを起動します。
  open       | 関連付けられたアプリケーションでファイルを開きます。
  print      | 関連付けられたアプリケーションでファイルを印刷します。
  properties | ファイルまたはフォルダのプロパティを表示します。
^p
"command"が指定された場合は、ファイル実行モードの16、 32は無効になります。また、実行結果を示す値がシステム変数statに返されます。
^
ノーマル実行は、新しく起動したアプリケーションのウィンドウがアクティブになり、入力フォーカスも移りますが、マルチタスクで、 HSPは終了せずに実行を続けます。
^p
例 ：
	exec "calc"  ; Windows電卓を起動
^p
また、ファイル名に続けてパラメータを書くこともできます。
^p
例 ：
	exec "notepad hsp.txt"  ; ノートパッドでhsp.txtを開く
^p
モード２は指定したアプリケーションを最小化した状態で実行します。
DOSアプリケーションの実行時にHSPの画面を遮ることなくバックで実行させることができます。
^
モード16は、実行ファイルではなく、データファイルを指定してその拡張子に関連付けられたアプリケーションを実行します。
^p
例 ：
	exec "hsp.txt",16  ; hsp.txtを関連付けられたアプリケーションで開く
^p
上の例では、「hsp.txt」を関連付けされたアプリケーションで開きます。
(通常は、notepad.exe) 
また、 モード16ではインターネットのURLを指定することでインターネットショートカットとしても使用することが可能です。
^p
例 ：
	;インターネットのページを開く
	exec "http://www.onionsoft.net/hsp/",16
^p
モード32では、指定したファイルに関連付けされたアプリケーションを経由して、プリンタに印刷をします。
たとえば、
^p
例 ：
	exec "hsp.txt",32  ; hsp.txtをプリンタで印刷
^p
は、「txt」に関連付けされたアプリケーションで「hsp.txt」を自動的に印刷します。印刷のオプションなどはすべて、関連付けされたアプリケーションで指定されたものになります。
^
モードは、複数同時に指定することが可能です。
たとえば、モード2とモード16を同時に指定する場合は、それぞれの値を加算して18になります。この場合は、「最小化モードで関連付けされたアプリケーションを実行」になります。
^
※HSP2.61までサポートされていたモード1(タスク実行待ち)は、HSP3ではサポートしていません。起動したプロセスを監視するか、コンソールアプリケーションの場合はpipeexec命令をご使用ください。

%href
pipeexec
%portinfo
HSPLet時は、HTML ページを表示する目的で使用されます。
第3引数の意味がオリジナルの HSP とは違うため、この命令を直接使用することはお勧めしません。
代わりに letutil.hsp 内に定義されている showPage fileName, target 命令を使用することをお勧めします。



%index
end
プログラム終了
%group
プログラム制御命令
%prm
p1
p1(0) : 終了コード
%inst
HSPのプログラムを終了します。
end命令はスクリプトのどこにあってもかまいません。
end命令が実行されると、そのアプリケーションは終了します。
^
アプリケーションの終了コードをパラメーターp1で指定することができます。p1を省略した場合は、0がアプリケーション終了コードとなります。
アプリケーション終了コードは、他のプロセスやバッチファイルへの通知に使用されます。通常は、省略(0)していて問題ありません。

%href
stop





%index
gosub
指定ラベルにサブルーチンジャンプ
%group
プログラム制御命令
%prm
*label
*label : ラベル名

%inst
サブルーチンジャンプをします。
gosub命令は、*labelで指定した場所にジャンプをします。
その後、return命令があるとgosub命令の次の行に復帰して実行を続けます。
gosub〜returnはネスティング(入れ子構造)にすることが可能です。
(最大ネスティング数はHSPが持つスタックメモリの量により変動します)

%href
goto
return




%index
goto
指定ラベルにジャンプ
%group
プログラム制御命令
%prm
*label
*label : ラベル名

%inst
指定したラベルに無条件でジャンプします。
以降は、ラベル名で指定された場所から実行を続けます。

%href
gosub





%index
if
条件を満たしていればその行の命令を実行
%group
プログラム制御命令
%prm
p1
p1 : 条件式

%inst
p1の条件式が満たされていれば、それ以降の命令を実行する。満たされていない場合は、次の行に移ります。
BASICと違い、その行の次の命令との間には :(ｺﾛﾝ)を入れなければいけないので注意してください。
^p
例 ：
	a=10
	if a=10 : mes "aは10です。"
^p
上の例では、「a=10」の部分が条件式になります。条件式には主に、
^p
	a=b  : aとbは等しい
	a!b  : aとbは等しくない
	a<b  : aはbよりも小さい
	a>b  : aはbよりも大きい
	a<=b : aはbよりも小さいか等しい
	a>=b : aはbよりも大きいか等しい
^p
を使います。if＋条件式の後は：(コロン)で区切り、それに続いて条件が満たされた場合に実行される部分を書きます。
(C言語やJavaと同じように「=」「!」を「==」「!=」のように記述することも可能です) もし、条件によってプログラムの流れを変えたい場合には、
^p
例 ：
	a=10
	if a>10 : goto *over10
	mes "aは10以下です。"
	stop
*over10
	mes "aは10より大きいです。"
	stop
^p
上のように、goto命令で別なラベルに飛ばすことも可能です。
また、else命令を使って条件が満たされなかった場合の処理を同じ行に書くことも可能です。
^p
例 ：
	a=10
	mes "aは、"
	if a=10 : mes "10です。" : else : mes "10ではありません。"
	stop
^p
この場合は、else命令のある部分までは、条件を満たした場合に実行され、else命令以降は、条件を満たされなかった場合に実行されます。
次の行以降は、条件に関わらず通常通りに実行されます。
^
より複雑な条件判断をするために、論理演算式を使うこともできます。
^p
   a&b  : aとbがともに正しい (and)
   a|b  : aとbのどちらかが正しい (or)
^p
これによって複数の条件を一度に記述することができます。
^p
例 ：
	a=10:b=20
	if (a=10)|(b=10) : mes "aかbのどちらかが10です。"
^p
上の例では、「a=10」と「b=10」 という条件式を|(or)でつないで、どちらかが正しい場合には、正しいという結果が出るようにしています。
論理演算は、 「|」「&」といった記号の他に「or」「and」という文字列でも記述することができます。
^p
例 ：
	if (a=10)or(b=10) : mes "aかbのどちらかが10です。"
^p
上のように書いても、結果は同じになります。
^
if命令の条件が正しい時に実行されるスクリプトを複数行に渡って記述する場合は、
^p
例 :
	a=10
	if a>5 {
		mes "TRUE"
		mes "(MULTILINE IF)"
	}
^p
のように「{」で始めて「}」で終わる部分までを指定します。
(上の例では、 見やすくするためにC言語風に行の最初にTABを入れてありますが、特に必要なものではありません。ユーザーの見やすいように記述してください)
^
else命令でも複数行の指定ができます。
^p
例 :
	a=10
	if a>5 {
		mes "TRUE"
		mes "(MULTILINE IF)"
	}
	else {
		mes " FALSE"
		mes " (MULTILINE IF)"
	}
	return
^p
ただし、else の後に「{」を記述しなければ複数行にはならないので注意してください。



%href
else





%index
loop
ループの始まりに戻る
%group
プログラム制御命令
%inst
repeat命令で指定したループの終わりを指定します。
詳しくはrepeat命令の項を参照してください。

%href
repeat
foreach




%index
onexit
終了時にジャンプ
%group
プログラム制御命令
%prm
goto/gosub *label
*label : ラベル名

%inst
クローズボックス(ウィンドウ右上の終了ボタン)を押した時に、自動的にジャンプする場所を指定します。
^
onexitの後に続けて、 gotoまたはgosubキーワードを指定してからラベルを記述します。
gotoの場合には、単純なプログラムジャンプ。 gosubの場合はサブルーチンジャンプを行ないます。
goto/gosubキーワードを省略した場合には、gotoキーワードと同等の動作になります。
^p
例 :
	onexit gosub *exit_routine  ; 終了時呼び出し
^p
通常は、クローズボックスを押すとどのような時でも強制終了してしまいますが、この命令が実行された以降は、クローズボックスを押すとonexit命令で指定したラベルにジャンプし、そこから実行を続けるようになります。
^
終了時に確認メッセージを表示したい時、終了したらデータを保存するようにしたい時などに使います。
^
この命令が実行されると、 end命令以外ではスクリプトの実行が止められなくなるので、十分に注意して使ってください。
^
複数のウィンドウを作成した場合は、いずれかのウィンドウにある終了ボタンで割り込みが発生します。この時、システム変数wparamに終了の通知を受けたウィンドウIDが代入されます。
^
onexitでジャンプされた直後は、システム変数iparamに終了要因が値として保存されています。
iparamが0の場合は、ユーザーの意思でプログラムを終了。
iparamが1の場合は、 Windowsシャットダウン(再起動または電源OFF)による終了です。Windowsシャットダウン時の終了処理には、await、wait、stop命令などでシステムにアイドルタイム(待ち時間)を発生させた場合には、シャットダ
ウン処理を中止します(シャットダウンされません)。
await、wait、stop命令を使わずにend命令で終了した場合には、そのままシャットダウン処理が継続されます。
^
終了時ジャンプの一時的なON/OFFをすることも可能です。
^p
	onexit 0
^p
で一時的に割り込みを停止します。
^p
	onexit 1
^p
で一時停止した割り込みを再開させることができます。


%href
onkey
onclick
onerror
%port-
Let



%index
return
サブルーチンから復帰
%group
プログラム制御命令
%prm
p1
p1 : システム変数代入値
%inst
gosub命令やユーザー定義命令などで呼び出しされたサブルーチンを終了します。return命令により、スタックを戻し呼び出し元に復帰します。
p1を指定することにより、サブルーチンから値をシステム変数に反映させることができます。
p1に数値を指定した場合には、システム変数statに代入されます。
p1に文字列を指定した場合には、システム変数refstrに代入されます。
p1に実数値を指定した場合には、システム変数refdvalに代入されます。
p1の指定を省略した場合には、システム変数の代入は行なわれません。

%href
gosub
#deffunc
#defcfunc
stat
refstr
refdval




%index
run
指定したファイルに制御を移す
%group
プログラム制御命令
%prm
"filename","cmdline"
"filename" : 実行するHSPオブジェクトファイル名
"cmdline"  : システム変数dir_cmdlineに代入される文字列
%inst
別のファイルに書かれたHSPのプログラムを実行します。
指定するファイルはHSPのオブジェクトファイル (拡張子がAX)でなければなりません。
オブジェクトファイルは、スクリプトエディタの「オブジェクトファイル作成」によって作成することができます。
^p
例 ：
    run "MENU2.AX","-s"
^p
が実行されると、いままでのプログラムはなくなり"MENU2.AX"というファイルのプログラムが最初から実行されます。
画面の状態は維持されますが、変数、メモリバッファの内容はすべて初期化されます。また、「-s」という文字列がシステム変数 dir_cmdlineに代入された状態で実行が開始されます。
^
"cmdline"パラメーターが省略された場合は、システム変数dir_cmdlineの内容は
空になります。また、システム変数 dir_cmdlineは最大1024文字まで内容が保存されます。
%href






%index
stop
プログラム中断
%group
プログラム制御命令
%inst
プログラムの実行を一時中断します。
ボタンがクリックされるまで待つ時などに使用します。

%href
end





%index
wait
実行を一定時間中断する
%group
プログラム制御命令
%prm
p1
p1(100) : 待ち時間(10ms単位)

%inst
プログラムの実行を一定時間だけ中断します。
^
p1に待ち時間の長さを指定します。単位は10ミリ秒になります。(1ミリ秒=1/1000秒)
CPUの速度に関係なく、どんな機種でも同じ待ち時間になります。
;p1に0を指定した場合、 または省略をした場合は、前回と同じ時間だけ待ちます。
^
await命令を使うとwait命令よりも高精度で細かいウエイトが可能ですが、wait命令よりもCPUのタスクを消費します。
リアルタイムに画像を書き換えるなどの処理でなければ、 wait命令を使用した方がCPU(Windows)の負担が軽くなります。
常にデスクトップに配置するようなアクセサリにはwait命令を、ゲームアプリケーションなどにはawait命令を使うといった使い分けをするといいでしょう。
^
HSPでは、他のWindowsタスクに処理時間を渡すために長い時間ループが起こる可能性がある場所にはwaitかawait命令を入れることを推奨しています。
waitや await命令がない命令の中を長い時間ループするようなプログラムを実行すると、ウィンドウをドラッグしにくくなったり、他のタスクに移るのに時間がかかったりします。

%href
await






%index
repeat
ループの始まりの場所を示す
%group
プログラム制御命令
%prm
p1,p2
p1=1〜(-1) : ループ回数
p2=0〜(0)  : システム変数cntのスタート値

%inst
repeat〜loopの間をくり返し実行します。
repeat命令は、くり返しの開始地点を示します。
loop命令は最後に通過したrepeat命令まで戻ります。つまり、
^p
	repeat 5
		print "やっほー"
	loop
^p
のようなプログラムは、「やっほー」を5回表示します。
repeat命令のパラメータ、p1でくり返しの回数を指定することができます。回数の指定を省略、またはマイナス値を指定すると無限ループになります。
繰り返しの回数が0の場合は、繰り返し部分は実行されず対応する loop命令までジャンプします。
^
repeat〜loopを含む部分をさらにループさせるネスト構造も記述することができます。ただし、正常にloop命令を通ってループしないで抜けたりすると、ネスト構造がおかしくなるのでループから強制的に抜けるような構造にはしないようにしてください。
^
ループ回数を調べたい時や、カウンターを利用したい時のためにシステム変数cntを参照することができます。cntは通常、0からスタートして、 loop命令でループするたびに1づつ増えていきます。
ただし、repeat命令のp2でカウンタがスタートする数値を変更することも可能です。たとえば、repeat 3,1 のように指定した場合には、変数cntの値は1,2,3の順で変化します。
^
ループの内部で、強制的にループを抜け出す場合には、 break命令を使用してください。また、ループをやり直すためのcontinue命令も用意されています。

%href
loop
break
continue
foreach



%index
break
ループから抜ける
%group
プログラム制御命令
%inst
repeat〜loop間のループから、強制的に抜け出します。
^p
	repeat 5
		if cnt=2 : break
		mes "繰り返し["+cnt+"]"
	loop
^p
上の例では、システム変数が2になった時点、つまり３回目のループになると、if命令の判断によって、break命令が実行されるしくみになっています。
break命令が実行されると、繰り返しの回数がまだ残っていても、 強制的に繰り返しから抜け出し、loop命令の次にある命令から実行を続けます。
break命令以降(上の例では、mes命令)は実行されません。
この命令を使うと、たとえば次のようなスクリプトが作成可能です。
^p
	repeat
		getkey a,1
		if a>0 : break
		await 10
	loop
^p
上のスクリプトでは、マウスの左ボタンを押すまで待つループになります。
repeat命令の回数指定を省略すると無限ループになるので、それを利用してボタンの状態が 1になるまでは、ずっと同じところを繰り返すようになっています。ボタンが押されると、 break命令が実行され繰り返しから抜け出します。

%href
repeat
loop
continue
foreach



%index
continue
ループをやり直す
%group
プログラム制御命令
%prm
p1
p1 = 0〜 : 繰り返しカウンタ変更値

%inst
repeat〜loop間のループをやり直します。
continue命令が実行されると、repeat命令まで戻り次の繰り返しを実行します。
^p
	repeat 5
		if cnt=2 : continue
		mes "cnt="+cnt
	loop
^p
上の例では、システム変数cntが2になった時点で、continue命令が実行されるしくみになっています。
上のスクリプトが実行されると、
^p
	cnt=0
	cnt=1
	cnt=3
	cnt=4
^p
のような表示になり、システム変数cntが２の時だけmes命令が実行されないのがわかります。
最初はわかりにくいかもしれませんが、continue命令は、loop命令の場所ではないが、loop命令と同じ働きをするとも言えます。
繰り返しのカウンタは、continue命令が実行された場合でも、loop命令と同様1つ増加します。
もし、最後の繰り返しでcontinue命令が実行されると、repeat〜loopが終わった状態、つまりloop命令の次の命令から実行を続けます。
^
さらにもう１つ、continue命令にはパラメータを指定する使い方が存在します。
continueの後に、数値または数値型変数を指定することにより、繰り返しのカウンタを示すシステム変数cntの内容を変更することができます。
たとえば、「continue 1」と指定した場合は、システム変数cntの内容は1になり、その値のままrepeat命令の次から繰り返しを続けます。
パラメータを省略して、ただの「continue」だけの場合はloop命令と同様の処理、数値を指定すると、カウンタの値を変更して繰り返しをやり直すことになります。
ですから、
^p
	repeat 1
		await 10
		getkey a,1
		if a=0 : continue 0
	loop
^p
このようなスクリプトでは、通常1回だけしか実行されないはずの、 repeat〜loopの繰り返しですが、マウスの左ボタンが押されていない場合は、カウンタが0に戻され無限ループの状態になります。 これで、ボタンを押すまで待つという動作になります。

%href
repeat
foreach
loop
break


%index
onkey
キー割り込み実行指定
%group
プログラム制御命令
%prm
goto/gosub *label
*label : ラベル名

%inst
キーボードを押した時に、自動的にジャンプする場所を指定します。
^
onkeyの後に続けて、gotoまたはgosubキーワードを指定してからラベルを記述します。gotoの場合には、単純なプログラムジャンプ。 gosubの場合はサブルーチンジャンプを行ないます。
goto/gosubキーワードを省略した場合には、gotoキーワードと同等の動作になります。
^
onkey命令でラベルを指定すると、それ以降はHSPのウィンドウがアクティブな時にキー入力があるたびに*labelで指定したラベルにジャンプします。
^
割り込みジャンプは、stop命令および、wait、 await命令で停止している時に割り込みを受け付けてジャンプを行います。
また、割り込みによりジャンプを行なった後はシステム変数iparam、wparam、lparamがセットされます。
^p
   割り込み要因 | iparam     | wparam | lparam
 ---------------------------------------------------------
    onkey       | 文字コード | wParam | lParam
^p
システム変数iparamには、割り込み要因ごとのパラメータが代入されます。
また、wparam,lparamはWindowsメッセージとして渡されたパラメータがそのまま格納されています。
イベント割り込み実行の一時的なON/OFFをすることも可能です。
^p
	onkey 0
^p
で一時的にキー割り込みを停止します。
^p
	onkey 1
^p
で一時停止したキー割り込みを再開させることができます。


%href
onclick
onexit
onerror


%index
onclick
クリック割り込み実行指定
%group
プログラム制御命令
%prm
goto/gosub *label
*label : ラベル名

%inst
マウスのボタンを押した時に、自動的にジャンプする場所を指定します。
^
onclickの後に続けて、gotoまたはgosubキーワードを指定してからラベルを記述します。gotoの場合には、単純なプログラムジャンプ。 gosubの場合はサブルーチンジャンプを行ないます。
goto/gosubキーワードを省略した場合には、gotoキーワードと同等の動作になります。
^
onclicky命令でラベルを指定すると、 それ以降はHSPのウィンドウ上でマウスクリックがあるたびに*labelで指定したラベルにジャンプします。
^
割り込みジャンプは、stop命令および、wait、await命令で停止している時に割り込みを受け付けてジャンプを行います。
また、割り込みによりジャンプを行なった後はシステム変数iparam、wparam、lparamがセットされます。
^p
   割り込み要因 | iparam         | wparam | lparam
 -------------------------------------------------------
   onclick      | マウスボタンID | wParam | lParam
^p
システム変数iparamには、割り込み要因ごとのパラメータが代入されます。
また、wparam,lparamはWindowsメッセージとして渡されたパラメータがそのまま格納されています。
イベント割り込み実行の一時的なON/OFFをすることも可能です。
^p
	onclick 0
^p
で一時的に割り込みを停止します。
^p
	onclick 1
^p
で一時停止した割り込みを再開させることができます。


%href
onkey
onexit
onerror


%index
onerror
エラー発生時にジャンプ
%group
プログラム制御命令
%prm
goto/gosub *label
*label : ラベル名
%inst
スクリプトが原因で HSP内部でエラーが発生した時に、自動的にジャンプする場所を指定します。
^
onerrorの後に続けて、gotoまたはgosubキーワードを指定してからラベルを記述します。gotoの場合には、単純なプログラムジャンプ。 gosubの場合はサブルーチンジャンプを行ないます。
goto/gosubキーワードを省略した場合には、gotoキーワードと同等の動作になります。
^
通常は、エラー発生時にシステムのエラーメッセージダイアログが表示されますが、そのかわりに指定したラベルにジャンプするように設定されます。ジャンプ後は、以下のシステム変数に情報が代入されます。
^p
	wparam : エラー番号
	lparam : エラー発生行番号
	iparam : 0(なし)
^p
onerror命令によりエラー後の処理を指定した場合であっても、 必要な処理が終わったら、そのままアプリケーションの実行は再開せずに、 なるべくend命令で終了させてください。
onerror命令は、エラーから回復させるものではありません。
エラー発生の原因によっては、 HSPのシステム自体が不安定になったり障害が発生することも有り得ます。 onerror命令を使う場面としては、実行ファイル作成時にエラーが発生した場合にアプリケーション側で独自のエラー表示を行ないたい場合や、特定のエラーが発生する場合にだけデバッグのための表示を行なうなどが考えられます。
^
終了時ジャンプの一時的なON/OFFをすることも可能です。
^p
	onerror 0
^p
で一時的に割り込みを停止します。
^p
	onerror 1
^p
で一時停止した割り込みを再開させることができます。


%href
onkey
onclick
onexit


%index
exgoto
指定ラベルに条件ジャンプ
%group
プログラム制御命令
%prm
var,p1,p2,*label
var    : 比較に使用される変数
p1     : 比較フラグ
p2     : 比較値
*label : ラベル名
%inst
varで指定された変数に代入されている値と、 p2の比較値により指定したラベルに条件でジャンプします。
比較方法は、p1の比較フラグが0以上(正値)の場合は(varの値>=p2)が成立した時にジャンプ、p1が-1以下(負値)の場合は (varの値<=p2)が成立した時にジャンプを行ないます。
varで指定された変数は、整数型である必要があります。別な型で初期化されている場合は、実行時にエラーとなります。
この命令は、 forなど一部のマクロ処理を高速化するために用意された命令です。
exgoto命令を単体で使用することもできますが、スクリプトの視認性からもif命令による通常の条件分岐を行なうことを推奨致します。
%href
goto
if


%index
on
数値による分岐
%group
プログラム制御命令
%prm
p1 goto/gosub ラベル0,ラベル1…
p1=0〜(0) : 分岐のための値
ラベル0〜 : 分岐先のラベル名
%inst
on命令は、p1で指定された値が0,1,2…に応じて分岐先を選択します。
「on 数値 goto」または、「on 数値 gosub」 のような書式で、続いて分岐する先のラベルを1つ以上「,」で区切って記述することができます。
指定された数値が0の場合はラベル0が、数値が1の場合はラベル1が分岐の対象になります、 以降2,3,4…と対応したラベルを任意の数だけ記述していくことが可能です。
「on 数値 goto」の場合は goto命令と同じ単純な分岐、「on 数値 gosub」の場合はgosub命令と同じサブルーチンジャンプを行ないます。
数値がマイナス値か、対応したラベルが指定されていない場合は分岐は行なわれずに次の行に進みます。
n88系のBASICと違い最初のラベルが数値0に対応しているのでご注意下さい。(n88系BASICでは数値1が最初のラベルになります)
%href
goto
gosub
%sample
	a=1
	on a goto *a0,*a1,*a2
	mes "その他":stop
*a0
	mes "A=0":stop
*a1
	mes "A=1":stop
*a2
	mes "A=2":stop


%index
while
while繰り返し開始
%group
プログラム制御マクロ
%prm
p1
p1=条件式(1) : 繰り返しを行なう条件
%inst
whileに続く条件が満たされている間だけ、whileからwendまでを繰り返します。
条件が満たされていない場合はwhileからwendまでを実行しません。
whileに続く条件を省略した場合は、無限に繰り返しを行ないます。
^p
	a=0
	while a<5
	a=a+1:mes "A="+a
	wend     ; aが5以下の間だけwhile以下を繰り返す
^p
また、_continue、_breakマクロによって再開、脱出が可能です。
while〜wend制御は、プリプロセッサのマクロ機能を使って実現されています。
CやJava等に近い記述をしたいような場合にお使い下さい。
初心者の方には、repeat〜loop命令か、if命令による繰り返し記述を推奨します。
%href
_continue
_break
wend


%index
wend
while繰り返し終了
%group
プログラム制御マクロ
%inst
whileで指定した繰り返し区間の終わりを指定します。
詳しくはwhileマクロの項を参照してください。
%href
while


%index
until
do繰り返し終了
%group
プログラム制御マクロ
%prm
p1
p1=条件式(1) : 繰り返しを行なう条件
%inst
untilに続く条件が満たされるまで、doからuntilまでの部分を繰り返します。
条件が満たされている場合でも、最低一回はdo〜until内を実行します。
untilに続く条件を省略した場合は、繰り返しを行ないません。
^p
	a=0
	do
	a=a+1:mes "A="+a
	until a>5    ; aが5以上になるまでdo以下を繰り返す
^p
また、_continue、_breakマクロによって再開、脱出が可能です。
do〜until制御は、プリプロセッサのマクロ機能を使って実現されています。
CやJava等に近い記述をしたいような場合にお使い下さい。
初心者の方には、repeat〜loop命令か、goto命令とif命令を組み合わせた繰り返し記述を推奨します。
%href
_continue
_break
do


%index
do
do繰り返し開始
%group
プログラム制御マクロ
%inst
untilまでの繰り返し区間の始まりを指定します。
繰り返し条件は、untilマクロによって記述されます。
詳しくはuntilマクロの項を参照してください。
%href
until


%index
for
指定回数繰り返し開始
%group
プログラム制御マクロ
%prm
p1,p2,p3,p4
p1    : 変数名
p2(0) : 初期値
p3(0) : 終値
p4(1) : 増分
%inst
パラメーターとして変数名、初期値、終値、増分などを指定すると、for〜nextの間を指定回数繰り返します。
カッコ内は省略した場合の値です。変数名は省略できません。
指定された変数をカウンターとして使用し、初期値から始まって、１回繰り返すごとに増分を足していきます。終値に達した時点で、繰り返しから抜けます(終値はループに含みません)。
最初から終値の条件が満たされている場合は、繰り返しを実行しません。
また、_continue、_breakマクロによって再開、脱出が可能です。
^p
	for a,0,5,1
	mes "A="+a
	next    ; aが0から4の間(５回)繰り返す
^p
この例では、変数aは0,1,2,3,4と５回繰り返してループを終わります。
増分にマイナス値を指定することも可能です。
^p
	for a,5,0,-1
	mes "A="+a
	next    ; aが5から1の間(５回)繰り返す
^p
この場合、変数aは5,4,3,2,1と５回繰り返してループを終わります。
^
forマクロで指定され初期値及び、終値は必ず整数を指定する必要があります。
他の型を指定した場合は、エラーとなります。
また、増分や終値の指定によっては無限ループになる可能性がありますので注意してください。
^
for〜next制御は、プリプロセッサのマクロ機能を使って実現されています。
CやJava等に近い記述をしたいような場合にお使い下さい。
初心者の方には、repeat〜loop命令か、if命令による繰り返し記述を推奨します。forマクロは、 内部でマクロ展開後に特殊なプログラム制御命令exgotoを生成します。
%href
_continue
_break
next
exgoto


%index
next
指定回数繰り返し終了
%group
プログラム制御マクロ
%inst
forで指定した繰り返し区間の終わりを指定します。
詳しくはforマクロの項を参照してください。
%href
for


%index
switch
比較ブロック開始
%group
プログラム制御マクロ
%prm
p1
p1 : 比較元
%inst
switch〜case〜swend は、ブロック内に複数の条件判断と処理をまとめて書くことができる構文です。
p1で指定する比較元のパラメーターは、変数または式を指定することができます。switch以降は、
^
case 比較値
^
を置くことで、これ以降に「比較元」が「比較値」と同じだった場合に処理する内容を記述することができます。
caseは、ブロック内に複数記述することができ、それぞれの比較値ごとの処理を指定できます。caseの比較が正しい場合は、 swbreakが存在するまで以降の命令を実行します。また、caseの替わりに
^
default
^
を置くと、caseで指定したどの比較値にもあてはまらない条件の場合に以降が実行されます。
^
switchブロックが終了した場合は、
^
swend
^
を必ず最後に書いておく必要があります。
以下は、switchマクロを使用したスクリプトの例です。
^p
	a=0
	switch a               ; aを比較対象とする
	case 0                 ; aが0だった場合
		mes "A=0"
		swbreak            ; case0の条件実行終了
	case 1                 ; aが1だった場合
		mes "A=1"
	default                ; aが0以外だった場合
		mes "A!=0"
		swbreak
	swend
^p
この例では、変数aの内容が0か1かそれ以外かで条件分岐を行なっています。
「case 0」以降は、「swbreak」までが実行されますが、「case 1」の場合は、「swbreak」が存在しないため、「default」以降に実行される「mes "A!=0"」も含めて実行されるので注意してください。
%href
case
default
swbreak
swend


%index
swend
比較ブロック終了
%group
プログラム制御マクロ
%inst
switchで指定した比較ブロックの終わりを指定します。
詳しくはswitchマクロの項を参照してください。
%href
switch
case
default
swbreak


%index
default
デフォルト比較指定
%group
プログラム制御マクロ
%inst
switch〜swendの比較ブロック内で、 それまでのcaseにあてはまらない条件の時に実行される処理を指定します。
詳しくはswitchマクロの項を参照してください。
%href
switch
case
swbreak
swend


%index
case
比較値指定
%group
プログラム制御マクロ
%prm
p1
p1 : 比較値
%inst
switch〜swendの比較ブロック内で、比較元との条件を指定して正しい場合に実行される処理を指定します。
詳しくはswitchマクロの項を参照してください。
%href
switch
default
swbreak
swend


%index
swbreak
比較実行脱出指定
%group
プログラム制御マクロ
%inst
switch〜swendの比較ブロック内から脱出します。
詳しくはswitchマクロの項を参照してください。
%href
switch
default
case
swend


%index
_continue
マクロループをやり直す
%group
プログラム制御マクロ
%inst
標準マクロによって定義されている繰り返しマクロ、
while〜wend、do〜until、for〜next間のループをやり直します。
現在以降の繰り返しブロック内は実行せずに、次の繰り返しから再開されます。
%href
_break
while
wend
do
until
for
next


%index
_break
マクロループを脱出する
%group
プログラム制御マクロ
%inst
標準マクロによって定義されている繰り返しマクロ、
while〜wend、do〜until、for〜next間のループから抜け出します。
現在以降の繰り返しブロック内は実行せずに、ループの次にある命令から再開されます。
%href
_continue
while
wend
do
until
for
next




%index
foreach
変数の要素数だけ繰り返す
%group
プログラム制御命令
%prm
p1
p1=変数名 : ループの対象となる変数

%inst
配列変数に格納されている要素の数だけ繰り返しを行ないます。
foreachは、repeat命令と同様にループ開始場所に記述し、 ループの終了場所にloop命令を記述します。
repeat命令との違いは、指定された配列変数の要素数が繰り返し回数になる点と、モジュール型変数の場合には、delmod命令で削除された要素はループ内容を実行しないという点です。
^p
例 :
	dim a,10
	foreach a
	mes "#"+cnt+":"+a.cnt
	loop
^p
ループの中で、システム変数cntを配列要素として指定することで、 すべての要素を繰り返し実行させるような処理を簡潔に書くことができます。
また、break、continue命令もrepeat命令使用時と同じように機能します。

%href
repeat
loop
break
continue



%index
oncmd
Windowsメッセージ割り込み実行指定
%group
プログラム制御命令
%prm
goto/gosub *label,p1
*label : ラベル名
p1     : メッセージID

%inst
指定されたウィンドウメッセージが送られた時に、自動的にジャンプする場所を指定します。
^
oncmdの後に続けて、gotoまたはgosubキーワードを指定してからラベルを記述します。
gotoの場合には、単純なプログラムジャンプ。 gosubの場合はサブルーチンジャンプを行ないます。
goto/gosubキーワードを省略した場合には、gotoキーワードと同等の動作になります。
^
oncmd命令でラベルを指定すると、それ以降はHSPのウィンドウに対してp1のメッセージが送られた時に*labelで指定したラベルにジャンプします。
oncmd命令は、現在の操作先ウィンドウのみが対象になります。
複数のウィンドウを作成している場合は、 ウィンドウごとにoncmd命令による登録が可能です。
^
既に登録されているウィンドウメッセージが指定された場合は、以前の登録が無効になります。
また、割り込みの登録は、ウィンドウの初期化とは同期していません。
一度登録された割り込みは、アプリケーションが終了するまで有効になります。
^
割り込みジャンプは、stop命令および、wait、 await命令で停止している時に割り込みを受け付けてジャンプを行います。
また、割り込みによりジャンプを行なった後はシステム変数iparam、wparam、lparamがセットされます。
割り込みが発生したウィンドウIDは、 ginfo関数により取得することができます。
^p
   割り込み要因 | iparam       | wparam | lparam
 ---------------------------------------------------------------------
   oncmd        | メッセージID | wParam | lParam
^p
システム変数iparamには、送信されたメッセージIDが代入されます。
また、wparam,lparamはWindowsメッセージとして渡されたパラメータがそのまま格納されています。
割り込みの設定で、 gosubキーワードによるサブルーチンジャンプが発生した場合は、return命令により戻り値を設定することが可能です。
「return 数値」で、ウィンドウプロシージャーが返す値を指定します。
return命令にパラメーターを指定しなかった場合には、デフォルトのウインドゥプロシージャーに処理が渡されます。
^
イベント割り込み実行の一時的なON/OFFをすることも可能です。
^p
	oncmd 0
^p
で一時的に割り込みを停止します。
^p
	oncmd 1
^p
で一時停止した割り込みを再開させることができます。


%href
onkey
onclick
onexit
onerror


%index
else
条件を満たしていなければその行の命令を実行
%group
プログラム制御命令
%inst
if命令と組み合わせて使用します。
詳しくはif命令の解説を参照してください。

%sample
if a == 0 {
	mes "aは0です。"
} else {
	mes "aは0ではありません。"
}

%href
if


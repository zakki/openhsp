------------------------------------------------------------------------------
HSP ver3.7 beta TESTING MANUAL                      HSP : Hot Soup Processor  
ＨＳＰβテスト版説明書               Copyright 2022 (c) ONION software/onitama
------------------------------------------------------------------------------

・はじめに

このアーカイブには、Hot Soup Processor ver3.7β版のファイルが含まれています。
Hot Soup Processor 3.7β版は、アップデートされたHSP3.6の機能やSDKを
検証するためのバージョンとなっています。
このアーカイブに含まれる内容は、テスト版であり未実装の機能や、
不具合が含まれていることをご了承の上お使い下さい。


・インストール方法

アーカイブは、以下の構成になっています。

+---hsp37beta             ルートフォルダ
    +---common	          標準のスクリプトヘッダ
    +---hsptv	          HSPTVブラウザ、素材データ
    +---hsphelp	          ワンキーヘルプデータ
    +---doclib	          ドキュメントフォルダ
    +---android	          android版HSP3Dishランタイム
    +---iOS	          iOS版HSP3Dishランタイム
    +---hsp3js	          WebGL版HSP3Dishランタイム
    +---runtime	          Windows版ランタイム
    +---sample	          サンプルスクリプト

アーカイブに含まれる「hsp37beta」フォルダを、ハードディスクに展開してご使用ください。(推奨パスは「C:\hsp37beta」になります)
β版は、HSP3.6リリース版と共存させることが可能です。HSP3.6リリース版がインストールされているフォルダ(通常は、「C:\hsp36」になります)以外に配置して(上書きしないで)ご利用ください。(HSP3.7β版の各種設定は、既存のHSP3.6とも共有されます。)
hsp37betaフォルダ以下にあるスクリプトエディタ(hsed3.exe)を始めとする各種ツールを使用して、3.7β版の機能を利用することができます。
(以前のβ版を使用している方は、古い「hsp37beta」フォルダを削除した後に、再度コピーを行なってください)


・OneDriveでの最新版の提供について

開発中の最新版は、随時OneDriveでも公開されます。
「ダウンロード」から全体のアーカイブ(hsp35betaフォルダの内容)を取得可能です。

HSP3.7β版(OneDrive)
https://onedrive.live.com/embed?cid=EC425522ED849DA7&resid=EC425522ED849DA7%211229&authkey=AB-pNztAqBp6BcU


・Linux版の提供について

LinuxのGUI環境(X Window System)及びRaspberry Pi(Raspbian)で動作するバージョンについては、
最新版をgithubにて公開しています。

git clone https://github.com/onitama/OpenHSP

のような形で取得してください。
詳しくは、以下のページをご覧ください。
最新版の入手及び、インストール方法についても説明されています。

HSP3 for Linux/Raspberry Pi
http://hsp.tv/make/hsp3linux_pi.html


・新機能の詳細について

新機能の詳細については、「HSP3.6 新機能ハイライト」「HSP3 アップデートガイド」にまとめられています。
以下のドキュメントを参照してください。

HSP3.6 新機能ハイライト
doclib/update37.htm

HSP3 アップデートガイド
doclib/update.htm


・更新履歴

	詳しい更新履歴は、docs/history.txt をご覧ください。


・謝辞

	OpenHSPで多くのご協力を頂いた、zakkiさん、fujidigさん、sharkppさんに感謝致します。
	多くの助言を頂いたHSP3掲示板、HSP-Dev MLメンバーの皆様、ありがとうございました。


・著作権および連絡先

	β版を使用したスクリプト・実行ファイルの公開、ライセンスについては
	HSP3.6と同様の規定で自由に行なっていただいて構いません。
	ただし、十分テストが行なわれていないテスト版であることを留意しておいてください。
	あくまで、自己の責任の範囲で運用してください。
	不具合やお気づきの点がありましたら、お知らせ頂けると嬉しいです。

	onion softwareは本プログラムによって生じた、いかなる損害についても
	保証いたしません。自己の責任の範囲で使用してください。
	HSPおよび周辺ツールは、Microsoft Visual Studio 2019によってコンパイルされています。

	このソフトに関するお問い合わせ、感想、ご意見などは以下のメールアドレスまで。

	Homepage: http://www.onionsoft.net/
	          http://hsp.tv/
        e-mail  : hsp@onionsoft.net

------------------------------------------------------------------------------
                                                     README.TXT / end of file 
------------------------------------------------------------------------------

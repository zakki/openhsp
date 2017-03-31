------------------------------------------------------------------------------
HSP3 : HSP3 Linux beta 	                   HSP : Hot Soup Processor  
ホットスーププロセッサ                     copyright 2017 (c) onion software  
------------------------------------------------------------------------------

・はじめに

このアーカイブには、Hot Soup Processor Linuxβ版のファイルが含まれています。
β版は、アップデートされたHSP3の機能やSDKを検証するためのバージョンとなっています。
このアーカイブに含まれる内容は、テスト版であり未実装の機能や、
不具合が含まれていることをご了承の上お使い下さい。


・動作環境

LinuxのGUI環境(X Window System)で動作します。
一部の機能は、OpenGL及びSDLライブラリを使用して動作します。


・インストール

アーカイブの内容を任意のディレクトリに展開して、ソースをコンパイルしてください。コンパイルには、gcc及びmakeを実行できる環境が必要になります。

	tar -vxzf hsplinux-???.tar.gz   (???はバージョン)

コンパイルの際には、以下のライブラリが必要になりますので、あらかじめ確認を行なって下さい。

	OpenGLES2.0以降 / EGL
	SDL1.2
	gtk+-2

アーカイブにはソースのみが含まれていますので、makeによってコンパイルする必要があります。
(Linuxのバージョンやディストリビューションによって正しくコンパイルされない場合は、修正が必要になります。)


	make

アーカイブの内容が展開されたディレクトリでmakeコマンドを実行してください。
必要なツールのコンパイルが行なわれ、HSP3が使用できる状態になります。


・使用方法

HSP3は、オープンソースとして公開されているOpenHSP技術をベースに、
Linux上で手軽にプログラミングを楽しむことができるよう構成されています。
インストールを行なうと、以下のコマンドが生成されます。

	hsed		スクリプトエディタ(簡易版)
	hspcmp		HSP3コードコンパイラ
	hsp3cl		HSP3コマンドラインランタイム
	hsp3dish	HSP3Dishランタイム
	hsp3gp		HGIMG4ランタイム

スクリプトエディタ(簡易版)は、HSP3のスクリプトを記述して、実行することのできる
GUIアプリケーションです。
基本的なスクリプトの編集、及びロード・セーブ機能を持っています。
[F5]キー、または「HSP」メニューから「Run」を選択することで編集している
スクリプトを実行できます。
現在のバージョンでは、標準ランタイムとしてhsp3dishが使用されます。
HSP3Dishに対応するサンプルコードがsampleフォルダに含まれていますので、
お試しください。
スクリプトの文字コードはUTF-8として扱われます。Windowsが使用する文字コード
(SJIS)とは異なりますので注意してください。

コマンドラインからスクリプトの実行を行なう場合は、hspcmpにより
HSPオブジェクトファイルを作成する必要があります。

	./hspcmp -d -i -u test.hsp

上の例では、「test.hsp」ファイルからオブジェクトファイル「test.ax」を生成します。
生成されたオブジェクトファイルを、ランタイムに渡して実行を行ないます。

	./hsp3cl test.ax

上の例では、「test.ax」をHSP3コマンドラインランタイムで実行します。
同様に、「hsp3dish」「hsp3gp」などのランタイムに合わせたスクリプトを
実行させることができます。
(「hsp3dish」「hsp3gp」の実行は、GUI環境が必要になります。)


・オンラインマニュアル

HSP3.5に関する情報はオンラインマニュアルでご覧いただけます。
http://www.onionsoft.net/hsp/v35/

HSPについての最新情報やコミュニティは、HSPTV!サイトにて提供されています。
http://hsp.tv/


・将来の予定

HSP3標準ランタイム、及びヘルプリファレンスや周辺ツールなどHSP3で用意されている
機能なども、今後追加される予定です。
まだ不備も多く、必要なものが足りない状況ですが、今後整備したいと考えています。
パッケージの不備やアドバイスなどありましたら、お知らせ頂ければ幸いです。

	onion software (hsp@onionsoft.net)
	http://www.onionsoft.net/

頂いたメールには、すべて目を通しておりますが、返信や、要望の反映などについては
作者がすぐに対応できないこともありますので、予めご了承下さい。
HSPについての一般的な質問や、スクリプトの作り方に関するご質問は、
ネット上のFAQや、書籍などでも情報を提供していますので、まず調べてみることを
お勧め致します。


・謝辞

HSPスクリプトエディタ(hsed)は、K-K(瓶詰堂)さんのご協力により作成されています。
HSP3及びOpenHSPに多大なご協力を頂いた以下の皆様に感謝致します。

Senchaさん、ゆめゆめゆうかさん、Lonely Wolfさん、Shark++さん、
HyperPageProjectさん、ちょくとさん、S.Programsさん、zakkiさん、
山田 雄己(Yuki)さん、K-Kさん、USKさん、NGND001さん、yoshisさん、
nakaさん、JETさん、ellerさん、さくらさん、うすあじさん、悠黒喧史さん、tomさん、
ぷまさん、arueさん、mjhd_otsukaさん、tds12さん、fujidigさん、naznyarkさん

その他、HSP周辺ツール開発者ML(HSPDev-ML)の皆様及び、β版のテスト報告や、
ご意見をお寄せいただいた多くの方々に感謝致します。


・ライセンス

HSP3 Linuxは、OpenHSPの派生物として取り扱い、ライセンスもOpenHSP/HSP3に準拠した修正BSDライセンスとなります。

-------------------------------------------------------------------------------
Hot Soup Processor (HSP)
Copyright (C) 1997-2017, Onion Software/onitama, all rights reserved.
Made with base technology of OpenHSP.

OpenHSP
Copyright (C) 1997-2017, Onion Software/onitama, all rights reserved.

These softwares are provided by the copyright holders and contributors "as is" and
any express or implied warranties, including, but not limited to, the implied
warranties of merchantability and fitness for a particular purpose are disclaimed.
-------------------------------------------------------------------------------
                                                HSP users manual / end of file 
-------------------------------------------------------------------------------

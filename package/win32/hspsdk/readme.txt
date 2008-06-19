------------------------------------------------------------------------------
Hot Soup Processor SDK ver3.1                       HSP : Hot Soup Processor  
ホットスーププロセッサ                copyright 1997-2007 (c) onion software  
------------------------------------------------------------------------------

・はじめに

このアーカイブには、Hot Soup Processor SDK ver3.1が含まれています。
Hot Soup Processor 3.1 SDKは、HSP 3.1のプラグイン開発及びランタイムの作成
などHSPとの高度な連携をサポートするための素材が含まれています。


・アーカイブの内容について

	hsp3 フォルダ

	ランタイムSDKのライプラリを含むランタイムサンプルです。
	VC++でコンパイルすることで、HSP3.EXEと同等のランタイムを生成します。
	また、例外エラー(Windowsエラー)を捕獲しないデバッグ版hsp3.exeを
	同じフォルダに同梱しています。

	hsed3 フォルダ

	スクリプトエディタのプラグイン、外部ツール作成のための資料です。
	HSPスクリプトによるサンプルを同じフォルダに同梱しています。

	hspcl フォルダ

	HSP3CL(コマンドライン版)のソースコードです。
	ランタイムSDKのライブラリとともにビルドすることができます。

	hpi3sample フォルダ

	実際にビルド可能なプラグインサンプルです。
	HSP3に対応したコマンド拡張プラグイン作成の参考にしてください。

	hpi3type フォルダ

	実際にビルド可能なプラグインサンプルです。
	HSP3に対応した変数型拡張プラグイン作成の参考にしてください。

	vartype フォルダ

	HSP3に内蔵されている型のソースコードです。
	型を拡張するプラグインのサンプルとしてお使い下さい。

	cmdtype フォルダ

	HSP3に内蔵されているコマンドのソースコードです。
	コマンド・関数を拡張するプラグインのサンプルとしてお使い下さい。

	hsp3debug フォルダ

	HSP3に同梱されているデバッグウインドゥ(hsp3debug.dll)の
	ソースコードです。
	デバッグウインドゥの機能検証、拡張などにお使いください。

	peas フォルダ

	同梱されているPeasエディタのソーススクリプトです。
	AHT機能の参考や、機能拡張のベースとしてお使い下さい。

	hspda、hspdb、hspext、hspinet、hspsock、hspcv フォルダ

	HSP3に同梱されているプラグインのソースコードです。
	プラグイン作成の参考や、機能拡張などにお使いください。


・ランタイムSDKについて

	HSP3ランタイムSDKは、HSP本体機能を呼び出すライブラリ(lib形式)として
	提供します。VC++等で必要な機能を呼び出すことで、独自のランタイムを
	作成することができるほか、アプリケーションの内部でHSP3をコントローラー
	として動作させる組み込みにも利用することが可能です。


・デバッグ版hsp3.exeについて

	hsp3フォルダ内に、例外エラー(Windowsエラー)を捕獲しないデバッグ版の
	hsp3.exeを同梱しました。
	これは、プラグイン側などでエラーが発生した場合でも、HSPでエラーを
	捕獲せずに、そのままWindowsのエラーへ渡すバージョンです。
	通常版のhsp3.exeと差し替えて、プラグインのデバッグ等にご利用下さい。


・著作権および連絡先

Hot Soup Processor SDKに付随するソースコード及びマニュアルの著作権はonion softwareにあります。 
onion softwareは本プログラムによって生じた、いかなる損害についても保証いたしません。自己の責任の範囲で使用してください。 

Hot Soup Processor SDKに付随するソースコード及びマニュアルは、BSDライセンスの
もと自由に引用、改編、再配布を行なって頂いて構いません。

ただし、hsp3/libフォルダに含まれる、HSP開発システム関連ファイルを使用した場合
(「HSP拡張ランタイム」作成時)には、OpenHSPを使用していることを示す、
HSPのライセンス表記(hsplicense.txt)を明示するようにしてください。

HSPのライセンス表記の内容は、以下の通りです。
-------------------------------------------------------------------------------
Hot Soup Processor (HSP)
Copyright (C) 1997-2008, Onion Software/onitama, all rights reserved.
Made with base technology of OpenHSP.

OpenHSP
Copyright (C) 1997-2008, Onion Software/onitama.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. 
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. 
Neither the name of the Onion Software nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. 

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


ソースコード形式かバイナリ形式か、変更するかしないかを問わず、以下の条件を満たす場合に限り、再頒布および使用が許可されます。 

・ソースコードを再頒布する場合、上記の著作権表示、本条件一覧、および下記免責条項を含めること。 
・バイナリ形式で再頒布する場合、頒布物に付属のドキュメント等の資料に、上記の著作権表示、本条件一覧、および下記免責条項を含めること。 
・書面による特別の許可なしに、本ソフトウェアから派生した製品の宣伝または販売促進に、Onion Softwareの名前またはコントリビューターの名前を使用してはならない。 

本ソフトウェアは、著作権者およびコントリビューターによって「現状のまま」提供されており、明示黙示を問わず、商業的な使用可能性、および特定の目的に対する適合性に関する暗黙の保証も含め、またそれに限定されない、いかなる保証もありません。著作権者もコントリビューターも、事由のいかんを問わず、 損害発生の原因いかんを問わず、かつ責任の根拠が契約であるか厳格責任であるか（過失その他の）不法行為であるかを問わず、仮にそのような損害が発生する可能性を知らされていたとしても、本ソフトウェアの使用によって発生した（代替品または代用サービスの調達、使用の喪失、データの喪失、利益の喪失、業務の中断も含め、またそれに限定されない）直接損害、間接損害、偶発的な損害、特別損害、懲罰的損害、または結果損害について、一切責任を負わないものとします。 

-------------------------------------------------------------------------------

「HSP拡張プラグイン」を作る上での制約は特にありません。
あなたが、 個人的な用途で作る場合も、配布や販売を目的とした場合であっても
onion softwareに対して無断で運用してかまいません。
「HSP拡張プラグイン」及び「HSP拡張ランタイム」の著作権は、作者に帰属します。
「HSP拡張プラグイン」を配布する場合は、HSPに対応した拡張プラグインである 旨を
ドキュメント等に明記して、なるべくHSP本体の入手先( 「HSPTV!」など )
を併記してもらえると嬉しいです。 
「HSP拡張プラグイン」の拡張子は、DLLまたはHPIの どちらかを使うよう推奨しています。
拡張子HPIは、通常のDLLと区別するためと、 Windowsの設定で拡張子DLLが表示されなく
なっている場合に対処したい方のためのものです。 

このアーカイブに関するお問い合わせ、感想、ご意見などは以下のメールアドレスまでお寄せ下さい。
メールの返信につきましては、時間がかかる場合がありますので予めご了承下さい。

	Homepage: http://www.onionsoft.net/
	          http://hsp.tv/
        e-mail  : onitama@onionsoft.net

------------------------------------------------------------------------------
                                                     README.TXT / end of file 
------------------------------------------------------------------------------

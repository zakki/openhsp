+----------------------------------------------------------
|
| Android/iOSアイコン作成ツール
|
| Ver 0.2
|
+----------------------------------------------------------
|
| HSP3DishのAndroid/iOSアイコン作成ツール
|
| By. しまくろねこ
|
+----------------------------------------------------------


(1). 当アプリの概要

    Dish Helperで作成されたAndroid/iOS用プロジェクトフォルダ内にあるアイコンファイルを指定のpngファイルでアイコンを作成します。

    Android用では512x512のpngファイルを元に以下のサイズのアイコンを作成します。

        drawable-ldpi      36x36ドット
        drawable-mdpi      48x48ドット
        drawable-hdpi      72x72ドット
        drawable-xhdpi     96x96ドット
        drawable-xxhdpi    144x144ドット
        drawable-xxxhdpi   192x192ドット

    iOS用では180x180のpngファイル(透過色なし)を元に以下のサイズのアイコンを作成します。

        icon57.png         57x57ドット
        icon58.png         58x58ドット
        icon120.png        120x120ドット
        icon180.png        180x180ドット



(2). 仕様

   ・Android用
           ・Dish Helperで作成されたresフォルダ内の各アイコンpngファイル名をそのまま利用するので、Dish Helperで作成されたresフォルダ内の各アイコンpngファイルは削除しないでください。
           ・アイコンの元にする512x512のpngファイルにアルファチャンネルが付いている場合、出力されるアイコンも同様にアルファチャンネル付きとなります。

   ・iOS用
           ・Dish Helperで作成されたXCode用プロジェクトフォルダ内の各アイコンpngファイル名をそのまま利用するので、Dish Helperで作成されたフォルダ内の各アイコンpngファイルは削除しないでください。



(3). 使い方

   起動すると、Android用/iOS用のボタンがあるので作成したい方のボタンをクリックしてください。

   ・Android用
              1. 「フォルダ選択」ボタンをクリックしてDish Helperで作成されたプロジェクトフォルダを指定してください。
              2. 「pngファイル選択」ボタンをクリックしてアイコン化する元のpngファイル(512x512ドット)を指定してください。
              3. 「アイコン(png)を作成する」ボタンをクリックします。
              4. 終わり。

   ・iOS用
              1. 「フォルダ選択」ボタンをクリックしてDish Helperで作成されたプロジェクトフォルダを指定してください。
              2. 「pngファイル選択」ボタンをクリックしてアイコン化する元のpngファイル(180x180ドット)を指定してください。
              3. 「アイコン(png)を作成する」ボタンをクリックします。
              4. 終わり。



(3). 履歴

   2022/03/17 (Ver0.2) : Android用の指定するフォルダを「res」フォルダではなく、Dish Helperで作成されたプロジェクトフォルダの先頭のフォルダを指定するように修正。iOS用も追加。

   2022/03/04 (Ver0.1) : 初版。



(4). 配布等について

    当アプリはフリーです。
    再配布もOKですが、その場合事後で結構ですのでE-Mail( simakuroneko@gmail.com )までご連絡ください。

    また、書籍等に掲載する場合も自由に掲載していただいてOKです。
    その場合も事後で結構ですのでE-Mail( simakuroneko@gmail.com )までご連絡頂けると嬉しいです。



(5). 動作確認OS

    ・Windows 8.1
    ・Windows 10
    ・Windows 11



(6). 作者情報

    ハンドルネーム : しまくろねこ
    Webページ      : https://sites.google.com/site/simakuroneko/
    Twitter        : https://twitter.com/simakuroneko_tw?lang=ja
    E-Mail         : simakuroneko@gmail.com
    掲示板(BBS)    : http://simakuroneko.bbs.fc2.com/

#よくわからないこと
通信方法

シーンの切り替え（タイトル→設定→戦闘→リザルト）

エフェクト（攻撃、魔法、バリア）

(ゲージの作り方（体力、MP）)



#ゲーム仕様

タイトルをクリック→設定画面に遷移
****

設定で、AIか通信対戦かを選ぶ。
キャラを選ぶ、ステージを選ぶ。（先ずはステージは一つ）
選ぶ終わったら戦闘へ。

戦闘はコマンド選択画面、戦闘画面の２つのフェーズがある。

コマンド選択画面では、制限時間内(例えば１０秒)に[攻撃、魔法、バリア、チャージ]の４つの中から一つコマンドをえらぶ。選ばなかった場合は何もできない。
####同じコマンドは2回連続で使えない.
####コマンドはイラストで表現する

****

戦闘画面では、選んだコマンドに対してそれぞれが振る舞う。
攻撃はバリアに勝つ
魔法は攻撃に勝つ
バリアは魔法に勝つ（弾き返す）
チャージは体力とMPがある程度回復する。
攻撃の強さは最初のキャラは（バリア＜攻撃＜魔法）とする。

バリアは魔法を弾き返すことで攻撃になるが、バリアvsバリアの場合もお互いがバリアで攻撃することとする。
魔法を使うとMPが減る。
同じコマンドを使用した場合はランダムな順番で（後々素早さ的な要素を追加してもいい）振る舞う。どちらかの体力が無くなった時点で戦闘終了。リザルト画面に移る。

****
リザルト画面でどっちが勝ったか表示。ゲーム終了。

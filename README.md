# アプリケーション名
マモンクエスト

# アプリケーション概要
目標金額や目標期日等をゲームキャラクターのステータスに反映させ、ゲーム感覚で節約を楽しめます。

# URL
[http://52.202.58.97/](http://52.202.58.97/)

# テスト用アカウント
- Basic認証ID：admin
- Basic認証パスワード：2222
- メールアドレス：player@gmail.com
- パスワード：mammonquest

# 利用方法

## 目標設定
1.ログインページ内「初めてプレイする方はこちら」のリンクをクリックし、新規登録を行います。<br>
2.登録後、「いくら貯めるか」「いつまでに貯めるか」「先月の収入」「先月の固定費」を入力して、確認ボタンを押します。<br>
3.確認画面で1日あたりで使える金額を確認した後、「マモンと戦う」のリンクをクリックしてゲームを開始します。

## マモンとの戦闘
1.プレイヤーは1日に1回、マモンに攻撃ができます。<br>
攻撃力は先月の収入から先月の固定費を差し引いた値を当月の日数で割った値となりますが、買い物をするとこの値は下がっていきます。<br>
2.マモンのHPが目標金額、MPが目標期日となります。<br>
MPは最初0ですが、攻撃を受けるたびに1ずつ上昇します。MPが溜まりきるまでにHPを削り切らないと、ゲームオーバーとなります。

# アプリケーションを作成した背景
株で失敗して全財産を失ってしまい、また貯金し直す必要性に迫られました。<br>
「10ヶ月で100万円貯めるには生活費を1日いくら以内に抑えなければならないか」<br>
というシミュレーションをして、それを元に生活をしていました。<br>
使える金額と相談しながら生活するのは楽しかったですが、自身の行動でお金が貯まっていく過程を可視化できればもっと楽しくなると考えて当該アプリケーションを開発することにしました。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1MeHUUnYlXgyHNCk9L-pD9bzMjy9BqGuU2d9NtipgI_U/edit#gid=982722306)

# 実装した機能についての画像
- [ユーザー新規登録](https://gyazo.com/1f9e13b006bebbafa76dbaa7bce13430)<br>
- [目標設定画面](https://gyazo.com/b4e7231a5ccc1ff2f5cf7260c37a03c9)<br>
- [目標確認画面](https://gyazo.com/28d41be7ddf9f7b2bd674f2551db534b)<br>
- [戦闘画面(買い物をした場合)](https://gyazo.com/0c3db9402b2558de284a8cbcd1ad50b8)<br>
- [戦闘画面(攻撃をした場合)](https://gyazo.com/1b7e10b45ec6708e54d8e18d13c90220)<br>
- [ゲームクリア](https://gyazo.com/0e6863bc491638e65f88954b16a82103)<br>
- [ゲームオーバー](https://gyazo.com/c5d473e33d6f5d2fe0b0f2b06c862418)<br>

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/de163cbd15916381b2caaa8ab2afbcf9.png)](https://gyazo.com/de163cbd15916381b2caaa8ab2afbcf9)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/88f331ab53e0222ff642a0d817bcd038.png)](https://gyazo.com/88f331ab53e0222ff642a0d817bcd038)

# 開発環境
- フロントエンド:HTML,CSS,JavaScript
- バックエンド:ruby(ruby on rails)
- インフラ:EC2
- テスト:ruby on rails(rspec)
- テキストエディタ:VSCode
- タスク管理:GitHub

# ローカルでの動作方法
以下のコマンドを順に実行<br>
% git clone https://github.com/kanieksuke/mammon-quest<br>
% cd mammon-quest<br>
% bundle install<br>
% yarn install<br>

# 工夫したポイント
目標データをcreateした後、そのidを戦闘画面であるeditアクションに持ち運びするにはどうすれば良いかに難儀しました。<br>
目標データを登録した後、一旦indexアクションを挟み、一番最後にcreateしたデータのみを表示させ、強制的にそのデータを選択させてeditアクションに遷移するという方法に落ち着きました。<br>
今考えればconfirmメソッドを作ったりと、もっとスマートな方法があったのではないかと思いますが、今持っている知識を上手くやりくりして実装できたのではないかと考えております。

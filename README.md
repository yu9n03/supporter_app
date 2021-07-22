# supporter_app
[![Image from Gyazo](https://i.gyazo.com/388cf76de9fa0535d9439ee4b2c6d64e.jpg)](https://gyazo.com/388cf76de9fa0535d9439ee4b2c6d64e)

# supporter_app 概要
- ダイエットを頑張るユーザーを保健師が応援！
- 特定保健指導の進捗の管理・評価にも活用が可能

# App URL
http://35.72.58.224/

# 利用方法（操作方法）
### ①My Page
- トップページから新規登録・ログイン
- My Pageへ遷移する
- My Planの設定を行う
[![Image from Gyazo](https://i.gyazo.com/151fa3891a84c5a6a65bc6626c6c17aa.gif)](https://gyazo.com/151fa3891a84c5a6a65bc6626c6c17aa)
- 今日の記録を上部のフォームから入力する
- グラフの表示や残り日数や目標体重との乖離が表示される
[![Image from Gyazo](https://i.gyazo.com/d5e3ebd55613258052f52ad2490af94a.gif)](https://gyazo.com/d5e3ebd55613258052f52ad2490af94a)

### ②Message
- ヘッダー部分の「Message」をクリックし、モーダルを表示させる
- テキストを入れ、「SEND」クリックでメッセージ送信
[![Image from Gyazo](https://i.gyazo.com/ee6b20f8d41d6a325bf1f281bf978fd4.gif)](https://gyazo.com/ee6b20f8d41d6a325bf1f281bf978fd4)

### ③面談予約
- 右下の「面談予約を確認」をクリックすると、面談予約フォームが表示される
- 希望する日付、時間を選択し、「予約」をクリックすると送信される
- 直近の予約があればフォームの上部に表示される

### ④管理者画面
- 管理者IDでログインすると、管理者画面にアクセスできる
- 管理者画面にはユーザー一覧が表示され、「詳細」をクリックすると個人のMy Pageに準ずるページを確認できる
[![Image from Gyazo](https://i.gyazo.com/45245a0222f68d5c864bd3dc8f73a9ca.gif)](https://gyazo.com/45245a0222f68d5c864bd3dc8f73a9ca)
- Message/面談管理をクリックすると対象ユーザーとのメッセージの確認・管理ができる
[![Image from Gyazo](https://i.gyazo.com/b05369ebd27f665963cb8e3f56a52665.gif)](https://gyazo.com/b05369ebd27f665963cb8e3f56a52665)

# テスト用アカウント
### user
Email:    sample@sample.com \
Password: 111111

### admin（管理者）
Email:    admin@admin.com \
Password: password

# 目指した課題解決
 
| タイトル          |  概要                         |
|----------------- | ---------------------------- |
|目的              | ダイエットサポートアプリ          |
|ペルソナ(user)     | ４０代・男性                    |
|ペルソナ(admin)    | 保健指導実施者（保健師/栄養士など)  |
|ニーズ/課題        |健康診断でメタボ指摘をされて痩せたい！目標を定めてダイエットにアプローチしたい！思いを持つ対象者。|
|どのように解決するか|目標の設定から、目標までの行動プランを表明させ、プランに対しての実行具合も管理。また、体重の推移はグラフ化により視覚的に訴えかけ、順調な場合も、そうでない場合も自らの気づきに繋げる。また、メッセージ機能でモチベーションの維持、向上を図る。|
|なぜ？何のために？  |ダイエットの挫折を防ぐためサポートを行う。アプリを利用して日々の体重管理から目標値へのアプローチを視覚的に訴えかけることでモチベーションに繋げる。|
|ペルソナはどのようになるのか？|ダイエット成功はもちろんのこと、このアプリの使用を継続することで、体重推移、行動プランの実行や生活の些細な変化により起こる体重変化に対してどのように行動していけば良いか内省し、ダイエット（体重維持）のコツを掴めるようになること。|

# 機能一覧
| 機能           |  概要                     |
|-------------- | ----------------------- |
| ユーザー管理機能 |ユーザー登録を行うと、マイページを取得できる。|
| 目標設定機能    |各ユーザーはまず目標を定める。|
| 記録機能        |日々の体重、体脂肪率、Planの達成度、メモを投稿できる。|
| 体重推移表示機能 |投稿した体重はマイページにグラフ化され、視覚的に体重の経緯が確認できる。|
| メッセージ機能   |ユーザー対管理者（管理者は保健師を想定）のメッセージ機能を実装することで、ユーザーは相談したり評価を受けることができる。|
| 面談予約機能     |ユーザーは管理者に対して面談の予約を送信することができる。|
| 管理者機能      |管理者（保健師）はユーザーの記録を閲覧でき、また、ユーザーとのやりとりも行える。|

# 実装予定の機能
| 機能           |  概要                     |
|-------------- | ------------------------- |
| チャット機能 |ユーザー同士がルームを作成し、お互いにチャット内で励ましあったり、成功体験を共有したりすることで、グループダイナミクスの発生を期待する。|


# テーブル設計

## users テーブル

| Column             | Type    | Options                             |
| ------------------ | ------- | ----------------------------------- |
| nickname           | string  | null: false                         |
| email              | string  | null: false, unique: true           |
| encrypted_password | string  | null: false                         |
| age                | integer | null: false                         |
| height             | decimal | null: false, precision: 4, scale: 1 |
| basis_weight       | decimal | null: false, precision: 5, scale: 2 |

### Association
- has_many :records
- has_many :messages
- has_many :reservations
- has_one :target
- has_one :room

## records テーブル

| Column     | Type       | Options                             |
| ---------- | ---------- | ----------------------------------- |
| weight     | decimal    | null: false, precision: 5, scale: 2 |
| body_fat   | decimal    | null: false, precision: 4, scale: 2 |
| memo       | text       |                                     |
| assessment | string     | null: false                         |
| input_day  | date       | null: false                         |
| user       | references | null: false, foreign_key: true      |

### Association
- belongs_to :user

## targets テーブル

| Column      | Type       | Options                             |
| ----------- | ---------- | ----------------------------------- |
| goal_weight | decimal    | null: false, precision: 5, scale: 2 |
| period_id   | integer    | null: false                         |
| plan        | text       | null: false                         |
| user        | references | null: false, foreign_key: true      |

### Association
- belongs_to :user
- has_many :records

## rooms テーブル
  
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :messages

## messages テーブル
  
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | text       | null: false                    |
| user_nickname | string     | null: false                    |
| room_id       | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :room

## reservations テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| reservation_day     | date       | null: false                    |
| reservation_time_id | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user

# ローカルでの動作方法
##### $ git clone https://github.com/yu9n03/supporter_app.git
##### $ cd supporter_app
##### $ bundle install 
##### $ rails db:create 
##### $ rails db:migrate 
##### $ rails s 
##### ブラウザ⇨ http://localhost:3000

# 開発環境
- VScode
- Ruby 2.6.5
- Rails 6.0.4
- mysql 14.14
- gem 3.0.3
- heroku 7.56.1
- JavaScript
- AWS(EC2)
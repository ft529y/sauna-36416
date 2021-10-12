# アプリケーション名

[![Image from Gyazo](https://i.gyazo.com/c1d0c513aa92e28767b5ccd3ed4db9cd.png)](https://gyazo.com/c1d0c513aa92e28767b5ccd3ed4db9cd)

# アプリケーションの概要
自分の趣味でもあるサウナに対して、意見交換の場を設けて他の方達の意見を取り入れたいと感じていた。ユーザーがコメントだけではなく施設情報を投稿できるようにすることで、よりたくさんの情報交換の場を設けられる機会を作ることができる。
また、サウナに関してあまり詳しくない方のためにクイズ機能を実装し、より興味を持ってもらいたいと感じており、今回のアプリ開発に至った。

# URL
- https://sauna-36416.herokuapp.com/

# 本番環境
- Basic ID : admin  

- Password : 0529  
<br>

- 資格保有ユーザー①  
email : sample@gmail.com  
password : A1a1a1  

- 資格保有ユーザー②  
email : saunner@gmail.com  
password : B2b2b2

# 利用方法
- 施設情報投稿機能  
ログイン後、TOPページから遷移することができる。サウナ施設の画像と施設名、施設の紹介文を記述し、送信することで施設一覧リストに情報を投稿することができる。  
※herokuでデプロイしているため、画像がリンク切れを起こしている可能性がございます。 

- コメント機能  
ログインユーザーは他者が投稿した、サウナ施設の情報にコメントと段階評価をつけることができる。段階評価は0.5点から最大5点までの範囲で加点することができる。  

- 3択クイズ機能  
会員、非会員問わずTOPページから3択クイズページへと遷移できる。簡単なサウナに関するクイズが出題され、最後に最終得点が表示される。

# 洗い出した要件
| 機能 | 目的 | 詳細 | ストーリー |
| --- | ---- | --- | -------- |
| ユーザー管理機能 | 登録されたユーザーのみ使えるようにするため | ユーザーの新規登録画面を表示し、登録を可能にする。<br>またログイン、ログアウトができる。 | トップページに新規登録ページへのリンク、ログイン、ログアウトへのリンクを設け、クリックすることにより新規登録ページ、ログイン、ログアウトページへ遷移する |
| コメント投稿機能 | 登録済みユーザーの施設へのコメント投稿を実現するため | 施設詳細ページでコメントができる欄を設ける。<br>登録ユーザーは自由に投稿できる。 | 登録ユーザーは施設詳細ページに存在するコメント欄に、直接コメントを投稿できる。コメント投稿後は施設詳細ページの下部に投稿したコメントが表示される |
| 段階評価機能 | 施設を評価する際、おすすめ具合の程度を可視化するため | 星形の表示を利用し、段階的におすすめ度を表示する。<br>コメント欄ページにて選択する。 | 登録ユーザーはコメントページ内に存在する段階評価を使用し、採点することができる。 |
| 画像プレビュー機能 | 施設情報投稿時にピックアップした画像を認識しやすくするため | 施設情報投稿時、画像選択した際にページ上に選択した画像を表示する。 | 施設情報投稿時、画像選択した際に自動的に選択した画像が表示される。 |
|Basic認証機能 | 誰でも閲覧できる状態を防止するため | アプリ画面に遷移する前にID,パスワードを入力する。 | アプリ遷移時に自動的にID,パスワードを確認するので入力してアプリへ遷移する。 |
| エラーメッセージ日本語化機能 | 誰でも分かりやすいような表記を実現するため | 各バリデーション実行時のエラー文を日本語表記にする。 | 入力エラー発生時、自動的に日本語化された文章が表示される。 |
| 3択クイズ機能 | クイズ形式で出題することにより、登録していないユーザーに興味を持たせるため | JavaScriptを利用して、5問程度の3択クイズを設ける。 | 会員、非会員問わず、利用できる。3問選択形式になっており、利用者は5問のクイズに答える。 | 
| 退会機能 | 今後、アプリを使用しなくなるユーザーのため | マイページから退会手続きができる。 | 退会ボタンをクリックすることで登録を解除することができる。 |

# 実装した機能
- 施設情報投稿機能
[![Image from Gyazo](https://i.gyazo.com/d5a2fb3c3f268fca5042a059e5a7a7b4.gif)](https://gyazo.com/d5a2fb3c3f268fca5042a059e5a7a7b4)

- コメント機能
[![Image from Gyazo](https://i.gyazo.com/305c5d03db3a5bdaf49b5109e071a9e7.gif)](https://gyazo.com/305c5d03db3a5bdaf49b5109e071a9e7)

- 3択クイズ機能
[![Image from Gyazo](https://i.gyazo.com/5f8f0e4c143706ccb9126d12eaca573d.gif)](https://gyazo.com/5f8f0e4c143706ccb9126d12eaca573d)

- カレンダー機能
[![Image from Gyazo](https://i.gyazo.com/b9abdbb1c301d31db9fadab06ae9ace8.gif)](https://gyazo.com/b9abdbb1c301d31db9fadab06ae9ace8)

# 工夫したポイント
- コメント機能だけでなく、星形の段階評価を実装することでより、評価をわかりやす
くした。
- サウナ施設の情報登録の際に詳細な部分のカラムを追加し、よりユーザーに情報を提供することを目指した。
- 3択クイズ機能はJavaScriptにて動きを加えて表示させた。


# 実装予定の機能
- サウナ施設の住所情報等を加えることでより、実用性のあるアプリにする。
- 検索機能を導入し、サウナ施設の検索ができるようにする。
- マイページから自信がコメントした投稿履歴を閲覧できるようにする。

# データベース設計
### ER図
![sauna-er](https://user-images.githubusercontent.com/87511321/136897856-fc438368-781e-4602-89b8-bec88f48054e.png)





# テーブル設計

## usersテーブル

| Column             | Type    | Options                     |
| ------------------ | ------- | ----------------------------|
| nickname           | string  | null: false                 |
| email              | string  | null: false, unique: true   |
| encrypted_password | string  | null: false                 |
| last_name          | string  | null: false                 |
| first_name         | string  | null: false                 |
| birthday           | date    | null: false                 |
| is_deleted         | boolean | null: false, default: false |
| my_area            | string  |                             |
| period_id          | integer | null: false, default: false |
| introduce          | text    | null: false, default: false |

### Association

has_many :comments
has_many :stores
has_one :event

## storesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| store_name      | string     | null: false                    |
| description     | text       | null: false                    |
| user            | references | null: false, foreign_key: true |
| sauna_temp      | integer    | null: false                    |
| water_temp      | integer    | null: false                    |
| rouryu_id       | integer    | null: false                    |
| outside_bath_id | integer    | null: false                    |
| break_space_id  | integer   | null: false                  |
| bathing_fee     | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| address         | string     | null: false                    |
| phone_number    | string     | null: false                    |


### Association

has_many :comments
belongs_to :user
has_one_attached :image

## active_storage_attachments テーブル

| Column  | Type       | Options                                     |
| ------ | ---------- | -------------------------------------------- |
| name   | string     | null: false                                  |
| record | references | null: false, polymorphic: true, index: false |
| blob   | references | null: false, foreign_key: true               |

## active_storage_blobs テーブル

| Column       | Type   | Options                        |
| ------------ | ------ | ------------------------------ |
| key          | string | null: false                    |
| filename     | string | null: false                    |
| content_type | string |                                |
| metadata     | text   |                                |
| byte_size    | bigint | null: false                    |
| checksum     | string | null: false                    |

## commentsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| store      | references | null: false, foreign_key: true |
| evaluation | float      |                                |

### Association
belongs_to :user
belongs_to :store

## eventsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| execution  | integer    | null: false                    |
| place      | string     |                                |
| fee        | integer    |                                |
| start-time | datetime   |                                |
| user       | references | null: false, foreign_key: true |

### Association
belongs_to :user


# ローカルでの動作方法
```ターミナル
% git clone https://github.com/ft529y/sauna-36416.git 
% cd sauna-36416
% bundle install
% rails db:create
% rails db:migrate
$ rails s
→http://localhost:3000
```

# 開発環境
- フロントエンド：HTML5/CSS/SCSS/JavaScript/jQuery Raty
- バックエンド：Ruby on Rails(6.0.4.1)/Ruby(2.6.5)/JavaScript
- テスト：RSpec
- Linter：Rubocop
- データベース：MySQL(5.6.51)/Sequel Pro
- インフラ：Heroku
- タスク管理：GitHub
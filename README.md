# アプリ名

BooKPuT(bookとoutputを組み合わせた造語)

# 概要

自身が読んだ本について「アウトプット」として投稿でき、
且つ、他のユーザーの投稿内容を閲覧して、素敵な本と出会えるきっかけを作る読書アプリ。

# 使用方法

## 新規登録
①トップページ右上部の新規登録ボタンをクリックして登録ページへ遷移。
②ユーザー情報とアンケート情報を記入して登録ボタンをクリックする。

## 新規投稿
①トップページ右下部の新規投稿ボタンをクリックして投稿ページへ遷移。
②書籍情報を入力して投稿ボタンをクリックする。
③投稿が完了するとトップページに遷移して、投稿一覧に投稿内容が表示される。

## 投稿閲覧
①投稿一覧の中から気になった投稿をクリックして、投稿詳細ページへ遷移。
②投稿の詳細を閲覧できる。

# 制作背景

## ペルソナ

- 読書を習慣・趣味にしたいと思ってはいるが、気に入った本がなかなか見つからず、実際に買って読む勇気が持てない人。

- 読書を習慣・趣味としていて、面白い本をたくさん読みたいと思っているが、探すための情報源が無くて困っている人。

- ビジネス書や自己啓発本など、勉強目的で読書しているが、いつも読んだだけ（インプット）で終わってしまい、学んだ内容を発信（アウトプット）できていない人。

# 本番環境

https://book-put-3839.herokuapp.com/

## Basic認証
ID → book-lover
パスワード → attractive2009

## テスト用アカウント
ID → test@gmail.com
パスワード → test11111111

# DEMO

## トップページ
[![Image from Gyazo](https://i.gyazo.com/cdd58fa78b921d65297f0a2ca2c27726.gif)](https://gyazo.com/cdd58fa78b921d65297f0a2ca2c27726)

## 新規投稿
[![Image from Gyazo](https://i.gyazo.com/780b972d82e1991bc36f63af58631e60.gif)](https://gyazo.com/780b972d82e1991bc36f63af58631e60)

## 投稿詳細
[![Image from Gyazo](https://i.gyazo.com/97bd6e0783e138c0b413f08420858a23.gif)](https://gyazo.com/97bd6e0783e138c0b413f08420858a23)

## コメント投稿
[![Image from Gyazo](https://i.gyazo.com/581cd7a60e97517304bcca2ef84e200f.gif)](https://gyazo.com/581cd7a60e97517304bcca2ef84e200f)

## 投稿検索
[![Image from Gyazo](https://i.gyazo.com/29db8bb940a61b6af890e552c60fe9fa.gif)](https://gyazo.com/29db8bb940a61b6af890e552c60fe9fa)

# 工夫した、苦労したポイント

①トップページの作成

理由
- 全てのページの中で、ユーザーが一番目にするページであり、デザインやレイアウトがダサいとアプリを使ってもらえないため。

実装方法
- コードを記述する前に、ページ全体の設計図を、紙に下書きとして書いていく。
- フリマアプリなど、今まで作成したアプリやその他のwebサイトを参考にして、気に入ったデザインやレイアウトを自身のアプリに取り入れる。

②テストコードの記述

理由
- 本番環境でアプリが正常に動くか確かめるため。

実装方法
- 実装した機能に応じて都度、コントローラーの単体テストコード・モデルの単体テスト・結合テスト用のファイルを作成し、そこにコードを記述。
- 必要となるgemやマッチャーは都度導入する。
- 分からないことがあったら、その都度カリキュラムに戻って確認したり、Qiitaなどの外部サイトで調べたりする。

③ウィザード形式のユーザー管理機能の実装

理由
- どの情報をどのページで登録しているのかを明確にし、アプリを少しでも使いやすいものにするため。

実装方法
- 工程が多いので、それらを全て紙に書いてリスト化する。
- 最初はストロングパラメーターの設定、次は1ページ目という風に、一つ一つ地道に取り組んでいく。
- 分からないことがあったら、その都度カリキュラムに戻って確認したり、Qiitaなどの外部サイトで調べたりする。。

# 使用技術（開発環境）

## バックエンド
Ruby, Ruby on Rails

## フロントエンド
JavaScript, jQuery

## データベース
MySQL

## インフラ
AWS

## Webサーバ（本番環境）
Heroku

## ソース管理
Github, GitHubDesktop

## エディタ
Visual Studio Code

## テスト
Rspec

# 要件定義

https://docs.google.com/spreadsheets/d/1jw4iVI66nGr78hE87O600KTDIGfpDUCkZna_1KXkurM/edit#gid=282075926

# 実装中・未実装の機能

- wizard形式の新規登録における、画像の保存
- コメントの即時更新機能
- 好評価機能
- レスポンシブ対応

# ローカルでの動作方法

git clone https://github.com/shrine-dragon/book-put
Rubyのバージョン → 2.6.5
rbenvのバージョン → 1.1.2

# ER図

[![Image from Gyazo](https://i.gyazo.com/9d944769f576bca647eabf2181e254d4.png)](https://gyazo.com/9d944769f576bca647eabf2181e254d4)

# テーブル設計

## users テーブル

|         Column         |   Type  |          Options          |
|------------------------|---------|---------------------------|
|        nickname        |  string |       null: false         |
|        gender_id       | integer |       null: false         |
|        birth_day       |   date  |       null: false         |
|          email         |  string | null: false, unique: true |
|   encrypted_password   |  string |       null: false         |

### Association

- has_one  :questionnaire
- has_many :books
- has_many :comments

## questionnaires テーブル

|         Column        |    Type    |            Options             |
|-----------------------|------------|--------------------------------|
|       category_id     |   integer  |          null: false           |
|        genre_id       |   integer  |          null: false           |
|   purchase_place_id   |   integer  |          null: false           |
|    reading_media_id   |   integer  |          null: false           |
|         user          | references |  null: false, optional: true   |

### Association

- belongs_to :user

## books テーブル

|       Column       |    Type    |            Options             |
|--------------------|------------|--------------------------------|
|        title       |   string   |          null: false           |
|     category_id    |   integer  |          null: false           |
|      genre_id      |   integer  |          null: false           |
|     catch_copy     |   string   |          null: false           |
|       content      |    text    |          null: false           |
|      highlight     |   string   |                                |
|        user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments

## comments テーブル

| Column |    Type    |            Options             |
|--------|------------|--------------------------------|
|  text  |    text    |          null: false           |
|  user  | references | null: false, foreign_key: true |
|  book  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :book

## favorites テーブル（お気に入り）

| Column |    Type    |            Options             |
|--------|------------|--------------------------------|
|  user  | references | null: false, foreign_key: true |
|  book  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :book

## likes テーブル（好評価）

| Column |    Type    |            Options             |
|--------|------------|--------------------------------|
|  user  | references | null: false, foreign_key: true |
|  book  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :book
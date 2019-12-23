# 北海道Walker

## アプリ概要
**開催中のイベントを地図から探せるアプリ**です。（本番環境ではイベント投稿数が少ないため当日以降へ変更しています）

## 作成した経緯
北海道札幌市に住んでいた時、素敵なイベントと数多く出会いました。日常にイベントを取り入れることで毎日は豊かになると感じましたが、イベントを探すと遠かったり開催期間ではなかったりします。今開催されているイベントを地図で一目でわかることができれば、イベント参加がより日常になり、より豊かな生活を送れると思い、作成しました。

## アプリイメージ
[Imgur](https://i.imgur.com/667tfv2.png)


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :favorites
- has_many :events, through :favorites
- has_many :likes
- has_many :events, through :likes
- has_many :events

## eventsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|start|date|null: false|
|end|date||
|url|text||
|category_id|integer|null: false|
|user_id|references|foreign_key: true|

### Association
- has_many :favorites
- has_many :users, through :favorites
- has_many :likes
- has_many :users, through :likes
- belongs_to :user
- has_one :address
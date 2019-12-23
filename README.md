# 北海道Walker
※12/23現在未デプロイです。もうしばらくお待ちください。

## アプリ概要
**開催中のイベントを地図から探せるアプリ**です。（本番環境ではイベント投稿数が少ないため当日以降へ変更しています）

## 作成した経緯
北海道札幌市に住んでいた時、素敵なイベントと数多く出会いました。日常にイベントを取り入れることで毎日は豊かになると感じましたが、イベントを探すと遠かったり開催期間ではなかったりします。今開催されているイベントを地図で一目でわかることができれば、イベント参加がより日常になり、より豊かな生活を送れると思い、作成しました。

## アプリイメージ
![トップページ](https://i.imgur.com/UkKZoSq.png)
![条件検索機能](https://i.imgur.com/667tfv2.png)
![地域検索機能]](https://i.imgur.com/2E6nI4A.png)

## 使用技術
### フロントサイド
- jQuery 1.12.4
- GoogleMaps API
  - Maps JavaScript API
  - Geolocation API

### サーバーサイド
- Ruby 2.5.3
- Rails 5.2.4
- Rspec

### インフラストラクチャー
- Docker 19.03.5
- docker-compose 3
- Circle CI 2

<!-- 
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
- has_one :address -->
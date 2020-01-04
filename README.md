# 北海道Walker
※12/23現在未デプロイです。もうしばらくお待ちください。  
※12/31デプロイしました。  
こちらから→ [http://hokkaidowalker.work/](http://hokkaidowalker.work/)

## アプリ概要
**開催中のイベントを地図から探せるアプリ**です。（本番環境ではイベント投稿数が少ないため当日以降へ変更しています）

## 作成するにあたって
北海道札幌市に住んでいた時、素敵なイベントと数多く出会いました。日常にイベントを取り入れることで毎日は豊かになると感じましたが、イベントを探すと遠かったり開催期間ではなかったりします。また、埋もれたままのイベントもあります。  
本アプリでは、イベントをユーザー投稿型にして、知名度はないけど素晴らしいイベントにもスポットライトを当てます。また、今開催されているイベントを地図で一目でわかるようにすることで、イベントをより日常的にします。このアプリをきっかけに今より充実した生活を北海道の人に送ってほしいと思い、作成しました。

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
- AWS
  - VPC
  - EC2
  - RDS
  - S3
  - Route53

## アプリイメージ
![トップページ](https://i.imgur.com/UkKZoSq.png)
![条件検索機能](https://i.imgur.com/667tfv2.png)
![地域検索機能](https://i.imgur.com/2E6nI4A.png)

## 機能一覧
- 地図上でのイベント一覧機能
- イベント詳細ページ機能
- イベント投稿機能
- イベント編集機能
- イベント削除機能
- 地域検索機能
- 条件絞り込み機能
- いいね機能
- いいね数ランキング閲覧機能
- マイページにて各ユーザーの気になるイベント一覧機能
- ユーザー新規登録機能
- ログイン機能
- ログアウト機能
- テストユーザーログイン機能
- 終了したイベントを自動削除機能
- google analyticsによる解析

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
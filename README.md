# README

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
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


# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| birthday | string | null: false |

### Association

- has_many :items
- has_many :messages
- has_many :purchase

## items テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| name        | string  | null: false |
| image       | text    | null: false |
| content     | string  | null: false |
| item_detail | string  | null: false |
| price       | integer | null: false |
| delivery    | string  | null: false |

### Association

- belongs_to :users
- has_many :messages
- has_one :purchase


## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many :items


## addresses テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| postal_code     | string | null: false |
| prefecture_id   | string | null: false |
| city_name       | string | null: false |
| address         | string | null: false |
| buildding_name  | string | null: false |
| phone_number    | string | null: false |

### Association

- belongs_to :user
- belongs_to :items

## information テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| user_id         | string | null: false |
| item_id         | string | null: false |

### Association

- belongs_to :user
- belongs_to :items
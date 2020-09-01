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

| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| nickname                | string | null: false |
| last_name               | string | null: false |
| first_name              | string | null: false |
| last_name_furigana      | string | null: false |
| first_name_furigana     | string | null: false |
| email                   | string | null: false |
| password                | string | null: false |
| birthday                | date   | null: false |

### Association

- has_many :items
- has_many :informations

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| image              | text       | null: false                    |
| content            | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| price              | integer    | null: false                    |
| delivery_burden_id | integer    | null: false                    |
| delivery_area_id   | integer    | null: false                    |
| delivery_days_id   | integer    | null: false                    |
| user               | integer    | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one ：information
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_burden
- belongs_to_active_hash :delivery_area
- belongs_to_active_hash :delivery_days


## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city_name       | string     | null: false                    |
| address         | string     | null: false                    |
| buildding_name  | string     |                                |
| phone_number    | string     | null: false                    |
| information     | integer    | null: false, foreign_key: true |

### Association

- belongs_to :information
- belongs_to_active_hash :prefecture

## informations テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| user_id         | integer | null: false, foreign_key: true |
| item_id         | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address
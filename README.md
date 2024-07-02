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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| myouji             | string | mull: false | 
| name_kana          | string | null: false | 
| myouji_kana        | string | null: false |
| birthday_id        | integer| null: false |
### Association

- has_many :items
- has_many :memories

## items テーブル

| Column | Type         | Options     |
| ------ | ------ | ----------- |
| name   | string       | null: false |
| category_id | integer | null: false |
| condition_id | integer | null: false |
| shipping_fee_id| integer | null: false|
| area_id   | integer   | null: false |
| delay_id  | integer   | null: false |
| price  | integer      | null: false | 

### Association

- has_one  :memories
- belongs_to : user

## memories テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
  has_one    :send
- belongs_to :user

## sends テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| post_code | string   | null: false                    |
| prefecture | string  | null: false                    | 
| city    | string     | null: false                    |
| city_line | string   | null: false                    |
| city_number| string  | null:false                     |
| phone_number | string | null: false                   |
### Association

- belongs_to :memory
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
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name               | string | null: false |
| name_kana          | string | null: false | 
### Association

- has_many :items
- has_many :memories

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| image  | string | null: false |
| price  | string | null: false | 

### Association

- has_one  :memories
- belongs_to : sends

## memories テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |

### Association

- has_one    :items
- belongs_to :user

## sends テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| post_code | string   | null: false, foreign_key: true |
| city    | references | null: false, foreign_key: true |
| city_line | references | null: false, foreign_key: true |
| phone_number | integer | null: false, foreign_key: true |
### Association

- belongs_to :user
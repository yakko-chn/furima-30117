# README

# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| first_name_kana       | string | null: false |
| last_name_kana        | string | null: false |
| birth_year            | string | null: false |
| birth_month           | string | null: false |
| birth_day             | string | null: false |

### Association

- has_many :items
- has_many :orders
- has_one  :delivery_address

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | -----------| ------------------------------ |
| image                  | string     | null: false                    |
| name                   | string     | null: false                    |
| text                   | text       | null: false                    |
| category_id            | string     | null: false                    |
| item_status            | string     | null: false                    |
| seller_user_id         | string     | null: false                    |
| buyer_user_id          | string     | null: false                    |
| delivery_charge        | string     | null: false                    |
| shopping_area          | string     | null: false                    |
| shopping_day           | string     | null: false                    |
| price                  | integer    | null: false                    |

### Association

- belongs_to :user
- has_one    :order
- has_one    :delivery_address


## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_id         | references | null: false, foreign_key: true |
| buyer_user_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :prototype
- has_one    :delivery_address


## address テーブル

| Column        | Type        | Options                        |
| ------------- | ----------  | ------------------------------ |
| post_number   | integer     | null: false                    |
| prefecture    | string      | null: false                    |
| city          | string      | null: false                    |
| address1      | string      | null: false                    |
| address2      | string      | null: false                    |
| phone_number  | string      | null: false                    |


### Association

- belongs_to :user
- belongs_to :items
- belongs_to :delivery_address
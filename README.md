# README

# テーブル設計

## users テーブル

| Column                | Type     | Options     |
| --------------------- | -------- | ----------- |
| nickname              | string   | null: false |
| email                 | string   | null: false |
| first_name            | string   | null: false |
| last_name             | string   | null: false |
| first_name_kana       | string   | null: false |
| last_name_kana        | string   | null: false |
| birthday              | date     | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                 | Type        | Options                        |
| ---------------------- | ----------- | ------------------------------ |
| item_name              | string      | null: false                    |
| text                   | text        | null: false                    |
| category_id            | integer     | null: false                    |
| item_status_id         | integer     | null: false                    |
| user                   | references  | null: false, foreign_key: true |
| delivery_charge_id     | integer     | null: false                    |
| shopping_area_id       | integer     | null: false                    |
| shopping_day_id        | integer     | null: false                    |
| price                  | integer     | null: false                    |

### Association

- belongs_to :user
- has_one    :order


## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :delivery_address


## delivery_address テーブル

| Column        | Type        | Options                        |
| ------------- | ----------  | ------------------------------ |
| post_number   | string      | null: false                    |
| prefecture    | string      | null: false                    |
| city          | string      | null: false                    |
| address1      | string      | null: false                    |
| address2      | string      | null: false                    |
| phone_number  | string      | null: false                    |
| order         | references  | null: false, foreign_key: true |

### Association
- belongs_to :order
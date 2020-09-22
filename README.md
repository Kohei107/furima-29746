# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birth_year       | date    | null: false |
| birth_month      | date    | null: false |
| birth_day        | date    | null: false |

### Association

- has_many :items
- has_one :item_purchase


## items テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| name           | string  | null: false |
| detail         | text    | null: false |
| category       | integer | null: false |
| condition      | integer | null: false |
| shipping_fee   | integer | null: false |
| shipping_place | integer | null: false |
| prep_time      | integer | null: false |
| price          | integer | null: false |

### Association

- belongs_to :user
- has_one :item_purchase

## item_purchases テーブル


| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column            | Type    | Options                           |
| ----------------- | ---------- | ------------------------------ |
| postal_code       | string     | null: false                    |
| prefecture        | integer    | null: false                    |
| municipality      | string     | null: false                    |
| street_number     | string     | null: false                    |
| building          | string     |                                |
| phone_number      | string     | null: false                    |
| item_purchases_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item_purchase


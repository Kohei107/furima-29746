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
| birth_year       | integer | null: false |
| birth_month      | integer | null: false |
| birth_day        | integer | null: false |

### Association

- has_many :items
- has_one :purchasers


## items テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| image          | string  | null: false |
| item_name      | string  | null: false |
| detail         | text    | null: false |
| category       | string  | null: false |
| condition      | string  | null: false |
| shipping_fee   | boolean | null: false |
| shipping_place | string  | null: false |
| prep_time      | string  | null: false |
| price          | integer | null: false |
| seller         | string  | null: false |

### Association

- belongs_to :users
- has_one :purchasers

## purchasers テーブル


| Column  | Type    | Options     |
| --------| ------- | ----------- |
| item_id | integer | null: false |
| user_id | integer | null: false |

### Association

- has_one :addresses 
- belongs_to :items
- belongs_to :users

## addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefecture    | string  | null: false |
| municipality  | string  | null: false |
| street_number | string  | null: false |
| building      | string  |             |
| phone_number  | integer | null: false |

### Association

- belongs_to :purchasers


# テーブル設計

## users テーブル

| Column             | Type      | Options            |
| ------------------ | --------- | ------------------ |
| last_name          | string    | null: false        |
| first_name         | string    | null: false        |
| last_name_kana     | string    | null: false        |
| first_name_kana    | string    | null: false        |
| email              | string    | null: false,unique |
| encrypted_password | string    | null: false        |
| nickname           | string    | null: false,unique |
| birth_date         | integer   | null: false        |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| title                  | string     | null: false                   |
| price                  | integer    | null: false                   |
| delivery               | text       | null: false                   |
| user                   | references | null: false,foreign_key: true |
| commodity_condition_id | integer    | null: false                   |
| shipping_charges_id    | integer    | null: false                   |
| region_of_origin_id    | integer    | null: false                   |
| days_to_ship_id        | integer    | null: false                   |
| category_id            | integer    | null: false                   |

### Association

- has_one :purchases
- belongs_to :user

## purchases テーブル

| Column           | Type       | Options             |
| ---------------- | ---------- | ------------------- |
| payment          | integer    | null: false         |
| user             | references | null: false,foreign_key: true |
| item             | references | null: false,foreign_key: true |
### Association

- belongs_to :item
- belongs_to :user


## shippings テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| postal_code  | integer    | null: false                   |
| prefecture   | text       | null: false                   |
| city         | text       | null: false                   |
| addresses    | text       | null: false                   |
| building     | text       | null: false                   |
| phone-number | integer    | null: false                   |
| user         | references | null: false,foreign_key: true |
| item         | references | null: false,foreign_key: true |
### Association

- belongs_to :item
- belongs_to :user

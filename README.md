# テーブル設計

## users テーブル

| Column             | Type   | Options                |
| ------------------ | ------ | ---------------------- |
| name               | string | null: false            |
| email              | string | null: false,ユニーク制約 |
| encrypted_password | string | null: false            |
| nickname           | string | null: false,ユニーク制約 |
| address            | text   | null: false            |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column   | Type       | Options             |
| -------- | ---------- | ------------------- |
| title    | string     | null: false         |
| image    | text       | null: false         |
| price    | integer    | null: false         |
| delivery | text       | null: false         |
| user     | references | null: false,外部キー |
### Association

- has_one :purchases
- belongs_to :user

## purchases テーブル

| Column           | Type       | Options             |
| ---------------- | ---------- | ------------------- |
| delivery_address | text       | null: false         |
| payment          | integer    | null: false         |
| user             | references | null: false,外部キー |
| item             | references | null: false,外部キー |
### Association

- belongs_to :item
- belongs_to :user


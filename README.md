# テーブル設計

## users テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| nick_name         | string  | null: false |
| email             | string  | null: false |
| password          | string  | null: false |
| password_confirm  | string  | null: false |
| kanji_name        | string  | null: false |
| kana_name         | string  | null: false |
| birth_day         | integer | null: false |

### Association
- has_many :items
- has_many :buy

## items テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| image         | text    | null: false |
| item_name     | string  | null: false |
| item_explain  | text    | null: false |
| seller        | string  | null: false |
| category      | string  | null: false |
| item_status   | string  | null: false |
| delivery_fee  | string  | null: false |
| ship_locate   | string  | null: false |
| ship_date     | string  | null: false |
| price         | integer | null: false |

### Association
- belongs_to :users
- has_one :buy

## buy テーブル

| Column      | Type     | Options     |
| ----------- | -------- | ----------- |
| card        | integer  | null: false |
| limit       | integer  | null: false |
| secure      | integer  | null: false |
| post_num    | integer  | null: false |
| prefecture  | string   | null: false |
| city        | string   | null: false |
| house_num   | integer  | null: false |
| apart       | string   | null: false |
| tel         | integer  | null: false |

### Association

- belongs_to :items
- has_one :user, through :items
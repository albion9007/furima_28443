# テーブル設計

## users テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| nick_name         | string  | null: false |
| email             | string  | null: false |
| password          | string  | null: false |
| password_confirm  | string  | null: false |
| kanji_first_name  | string  | null: false |
| kanji_last_name   | string  | null: false |
| kana_first_name   | string  | null: false |
| kana_last_name    | string  | null: false |
| birth_day         | date    | null: false |

### Association
- has_many :items
- has_many :buys

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| image         | text       | null: false |
| name          | string     | null: false |
| explain       | text       | null: false |
| user          | references | null: false, foreign_key: true |
| category      | integer    | null: false |
| item_status   | integer    | null: false |
| delivery_fee  | integer    | null: false |
| ship_locate   | integer    | null: false |
| ship_date     | integer    | null: false |
| price         | integer    | null: false |

### Association
- belongs_to :user
- has_one :buy

## address テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| post_num     | string     | null: false |
| prefecture   | integer    | null: false |
| city         | string     | null: false |
| house_num    | string     | null: false |
| apart        | string     |             |
| tel          | string     | null: false |

### Association

- belongs_to :buy
- belongs_to :user

## buy テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address
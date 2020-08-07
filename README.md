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


## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| image         | text       | null: false |
| name          | string     | null: false |
| explain       | text       | null: false |
| seller        | references | null: false, foreign_key: true |
| category      | integer    | null: false |
| item_status   | integer    | null: false |
| delivery_fee  | integer    | null: false |
| ship_locate   | integer    | null: false |
| ship_date     | integer    | null: false |
| price         | string     | null: false |

### Association
- belongs_to :users
- belongs_to :address


## address テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| post_num     | integer    | null: false |
| prefecture   | integer    | null: false |
| city         | string     | null: false |
| house_num    | integer    | null: false |
| apart        | string     | null: false |
| tel          | integer    | null: false |

### Association

- belongs_to :items
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
| birth_day         | integer | null: false |

### Association
- has_many :items
- has_many :buy

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| image         | text       | null: false |
| item_name     | string     | null: false |
| item_explain  | text       | null: false |
| seller        | references | null: false, foreign_key: true |
| category      | integer    | null: false |
| item_status   | integer    | null: false |
| delivery_fee  | integer    | null: false |
| ship_locate   | integer    | null: false |
| ship_date     | integer    | null: false |
| price         | string     | null: false |

### Association
- belongs_to :users
- belongs_to :buy
- has_one :sold, through :buy

## buy テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| image        | references | null: false, foreign_key: true |
| item_explain | references | null: false, foreign_key: true |
| price        | references | null: false, foreign_key: true |
| delivery_fee | references | null: false, foreign_key: true |
| pay_price    | references | null: false, foreign_key: true |
| post_num     | integer    | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| house_num    | integer    | null: false |
| apart        | string     | null: false |
| tel          | integer    | null: false |


### Association

- belongs_to :items
- belongs_to :sold

## sold テーブル

| Column        | Type        | Options     |
| ------------- | ----------- | ----------- |
| image         | references  | null: false, foreign_key: true |
| item_name     | references  | null: false, foreign_key: true |
| price         | references  | null: false, foreign_key: true |
| delivery_fee  | references  | null: false, foreign_key: true |

### Association

- belongs_to :buy
- has_one :items, through :buy
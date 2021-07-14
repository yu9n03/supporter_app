# README

# テーブル設計

## users テーブル

| Column             | Type    | Options                             |
| ------------------ | ------- | ----------------------------------- |
| nickname           | string  | null: false                         |
| email              | string  | null: false, unique: true           |
| encrypted_password | string  | null: false                         |
| age                | integer | null: false                         |
| height             | decimal | null: false, precision: 4, scale: 1 |
| basis_weight       | decimal | null: false, precision: 5, scale: 2 |

### Association
- has_many :records
- has_many :messages
- has_many :reservations
- has_one :room
- has_one :target

## rooms テーブル
  
| Column | Type       | Options                           |
| ------ | ---------- | --------------------------------- |
| user   | references | null: false, foreign_key: true    |

### Association
- belongs_to :user
- has_one :target
- has_many :records
- has_many :messages
- has_many :reservations

## records テーブル

| Column     | Type       | Options                             |
| ---------- | ---------- | ----------------------------------- |
| weight     | decimal    | null: false, precision: 5, scale: 2 |
| body_fat   | decimal    | precision: 4, scale: 2              |
| memo       | text       |                                     |
| assessment | string     | null: false                         |
| input_day  | date       | null: false                         |
| user       | references | null: false, foreign_key: true      |
| room       | references | null: false, foreign_key: true      |

### Association
- belongs_to :user
- belongs_to :room

## targets テーブル

| Column      | Type       | Options                             |
| ----------- | ---------- | ----------------------------------- |
| goal_weight | decimal    | null: false, precision: 5, scale: 2 |
| period_id   | integer    | null: false                         |
| plan        | text       | null: false                         |
| user        | references | null: false, foreign_key: true      |

### Association
- belongs_to :user
- belongs_to :room

## messages テーブル
  
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| text            | text       | null: false                    |
| user_nickname   | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| room            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :room

## reservations テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| reservation_day     | date       | null: false                    |
| reservation_time_id | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
| room                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :room
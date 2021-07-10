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
- has_one :target

## records テーブル

| Column        | Type       | Options                             |
| ------------- | ---------- | ----------------------------------- |
| weight        | decimal    | null: false, precision: 5, scale: 2 |
| body_fat      | decimal    | null: false, precision: 4, scale: 2 |
| memo          | text       |                                     |
| assessment_id | integer    | null: false                         |
| input_day     | date       | null: false                         |
| user          | references | null: false, foreign_key: true      |

### Association
- belongs_to :user

## targets テーブル

| Column      | Type       | Options                             |
| ----------- | ---------- | ----------------------------------- |
| goal_weight | decimal    | null: false, precision: 5, scale: 2 |
| period_id   | integer    | null: false                         |
| plan        | text       | null: false                         |
| user        | references | null: false, foreign_key: true      |

### Association
- belongs_to :user

## messages テーブル
  
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## reservations テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| reservation_day     | date       | null: false                    |
| reservation_time_id | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
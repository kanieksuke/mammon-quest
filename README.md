# テーブル設計

## users テーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|

### Association

- has_many :targets

## targets テーブル

|Column|Type|Options|
|------|----|-------|
|target_amount|integer|null: false|
|target_date|integer|null: false|
|current_amount|integer|null: false|
|current_date|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_many :budgets
- has_many :attack_days

## budgets テーブル

|Column|Type|Options|
|------|----|-------|
|income|integer|null: false|
|fixed-cost|integer|null: false|
|attack|integer|null: false|
|resist|integer|null: false|
|target|references|null: false, foreign_key: true|

### Association

-belongs_to :target

## attack_days テーブル

|Column|Type|Options|
|------|----|-------|
|date|date||

### Association

-belongs_to :target
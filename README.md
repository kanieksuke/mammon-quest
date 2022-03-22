# テーブル設計

## users テーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|

### Association

- has_one :target

## targets テーブル

|Column|Type|Options|
|------|----|-------|
|target_amount|integer|null: false|
|target_date|integer|null: false|
|current_amount|integer|null: false|
|current_date|integer|null: false|
|attack_date|date||
|user|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :budget
- has_one :shopping
- has_many :messages

## budgets テーブル

|Column|Type|Options|
|------|----|-------|
|income|integer|null: false|
|fixed_cost|integer|null: false|
|target|references|null: false, foreign_key: true|

### Association

-belongs_to :target

## shoppings テーブル

|Column|Type|Options|
|------|----|-------|
|resist|integer|null: false|

### Association

-belongs_to :target

## messages テーブル

|Column|Type|Options|
|------|----|-------|
|text|strings||

### Association

-belongs_to :target
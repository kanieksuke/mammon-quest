# テーブル設計

## targets テーブル

|Column|Type|Options|
|------|----|-------|
|max_hp|integer|null: false|
|max_mp|integer|null: false|
|current_hp|integer|null: false|
|current_mp|integer|null: false|

### Association

- has_one :budget
- has_many :attack_days

## budgets テーブル

|Column|Type|Options|
|------|----|-------|
|attack_base|integer|null: false|
|resist_base|integer|null: false|
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
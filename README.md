# テーブル設計

## users table
|Column|Types|Options|
|-|-|-|
|email|string|null:false|
|password|string|null:false|
|firstname|string|null:false|
|nickname|string|null:false|
|lastname|string|null:false|
|first_kana|string|null:false|
|last_kana|string|null:false|
|birth_date|datetime|null:false|

### Association
- has_many :items
- has_many :orders

## items table
|Column|Types|Options|
|-|-|-|
|image|references|null:false, foreign_key:true|
|name|string|null:false|
|explanation|text|null:false|
|category|string|null:false|
|state|text|null:false|
|user|references|foreign_key: true|

### Association
- belongs_to :user
- has_one: orders

## orders table
|Column|Types|Options|
|-|-|-|
|delivery_fee|string|null:false|
|region|string|null:false|
|date_to_derivery|int|null:false|
|item_fee|int|null:false|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## address table
|Column|Types|Options|
|-|-|-|
|postal_code|varchar|null:false|
|prefectures|string|null:false|
|cities|string|null:false|
|address|string|null:false|
|building_name|string|-|
|telephone_number|varchar|null:false|
|user|references|foreign_key: true|
|item|references|foreign_key: true|
|order|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :order
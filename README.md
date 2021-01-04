# テーブル設計

## users table
|Column|Types|Options|
|-|-|-|
|email|string|null:false, unique: true|
|nickname|string|null:false|
|first_name|string|null:false|
|last_name|string|null:false|
|first_kana|string|null:false|
|last_kana|string|null:false|
|birth_date|date|null:false|

### Association
- has_many :items
- has_many :orders

## items table
|Column|Types|Options|
|-|-|-|
|name|string|null:false|
|explanation|text|null:false|
|category_id|integer|null:false|
|state_id|integer|null:false|
|shipping_fee_burden_id|integer|null:false|
|prefecture_id|integer|null:false|
|delivery_id|integer|null:false|
|item_fee|integer|null:false|
|user|references|foreign_key: true|

### Association
- belongs_to :user
- has_one: orders

## orders table
|Column|Types|Options|
|-|-|-|
|state|string|-|
|status|string|-|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## address table
|Column|Types|Options|
|-|-|-|
|postal_code|string|null:false|
|prefecture_id|integer|null:false|
|city|string|null:false|
|address|string|null:false|
|building_name|string|-|
|telephone_number|string|null:false|
|user|references|foreign_key: true|
|item|references|foreign_key: true|
|order|references|foreign_key: true|

### Association
- belongs_to :order
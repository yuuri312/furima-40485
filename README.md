# BASIC認証情報  
ID: admin

PASSWORD: 2222


# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, unique: true, index: true|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|kana_last_name|string|null: false|
|kana_first_name|string|null: false|
|birthday|integer|null: false|


### アソシエーション
 has_many :buyed_items, class_name: "Item"
 has_many :selled_items, class_name: "Item"
 has_one :address
 has_one :card


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|address_id|string|null: false, unique: true, index: true|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|tel|string||
|user_id|references|foreign_key: true, index: true|


### アソシエーション
belongs_to :user


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_id|string|null: false, unique: true, index: true|
|card_number|string|null: false|
|expiration_date|date|null: false|
|security_code|string|null: false|
|user_id|references|foreign_key: true, index: true|
### アソシエーション
 belongs_to :user



## items
|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
|name|string|null: false|
|description|text|null: false|
|category|string|null: false|
|condition|string|null: false|
|paid_shipping_cost|string|null: false|
|shipper_prefecture|string|null: false|
|due_date|integer|null: false|
|price|integer|null: false|
|seller_id|reference|foreign_key: true, index: true|
|buyer_id|reference|foreign_key: true, index: true|

### アソシエーション
 belongs_to :seller, class_name: "User"
 belongs_to :buyer, class_name: "User"
 


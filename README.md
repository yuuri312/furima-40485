# BASIC認証情報  
ID: admin

PASSWORD: 2222


# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true, index: true|
|nickname|string|null: false|
|encrypted_password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|kana_last_name|string|null: false|
|kana_first_name|string|null: false|
|birthday|date|null: false|
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
|user_email|references|foreign_key: true, index: true|
### アソシエーション
belongs_to :user


## items
|Column|Type|Options|
|------|----|-------|
|item_id|string|null: false, unique: true, index: true|
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
 
## purchase_histories
|Column|Type|Options|
|------|----|-------|
|purchase_history_id|string|null: false, unique: true, index: true|
|user_email|reference|foreign_key: true, index: true|
|item_id|reference|foreign_key: true, index: true|
|address_id|reference|foreign_key: true, index: true|
### アソシエーション
 belongs_to :buyer, class_name: "User"
 belongs_to :item, class_name: "Item"
 belongs_to :shipping_address, class_name: "Address"
 





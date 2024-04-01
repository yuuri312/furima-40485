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
 has_many :items, class_name: "Item"




## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|tel|string||
|purchase_history|references|foreign_key: true, index: true|
### アソシエーション
belongs_to :purchase_history, class_name: "PurchaseHistory"


## items
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|condition|string|null: false|
|paid_shipping_cost|string|null: false|
|shipper_prefecture|string|null: false|
|due_date|string|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|
### アソシエーション
 belongs_to :user, class_name: "User"

 
## purchase_histories
|Column|Type|Options|
|------|----|-------|
|user|reference|foreign_key: true, index: true|
|item|reference|foreign_key: true, index: true|
|address|reference|foreign_key: true, index: true|
### アソシエーション
 belongs_to :user, class_name: "User"
 belongs_to :item, class_name: "Item"
 belongs_to :address, class_name: "Address"
 
## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### アソシエーション
has_many :items



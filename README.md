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
 has_many :items
 has_many :purchase_history



## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|tel|string|null: false|
|purchase_history|references|foreign_key: true, index: true|
### アソシエーション
belongs_to :purchase_history

## items
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|category_id|integer|null: false|
|condition_id|integer|null: false|
|paid_shipping_cost_id|integer|null: false|
|prefecture_id|integer|null: false|
|due_date_id|integer|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|
### アソシエーション
 belongs_to :user
 has_one :purchase_history
 
## purchase_histories
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true, index: true|
|item|references|null: false, foreign_key: true, index: true|
### アソシエーション
 belongs_to :user
 belongs_to :item
 has_one :address



 


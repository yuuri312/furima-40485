class PurchaseHistoryAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :block
    validates :tel, format: {with: /\A[0-9]{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, tel: tel, purchase_history_id: purchase_history.id)
  end
end
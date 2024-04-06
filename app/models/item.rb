class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :paid_shipping_cost
  belongs_to :prefecture
  belongs_to :due_date


end

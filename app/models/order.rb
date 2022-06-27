class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details

  enum payment: { クレジットカード: 0, 口座振込: 1 }
  enum order_statuses: { payment_wait:0, payment_confirmation:1, in_production:2, preparing_ship:3, sent:4 }

end

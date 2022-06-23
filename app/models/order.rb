class Order < ApplicationRecord

  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_statuses: { payment_wait:0, payment_confirmation:1, in_production:2, preparing_ship:3, sent:4 }
end

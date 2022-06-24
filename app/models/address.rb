class Address < ApplicationRecord

  validates :name, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
end
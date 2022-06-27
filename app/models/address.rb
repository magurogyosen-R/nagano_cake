class Address < ApplicationRecord

　belongs_to :customer

  validates :name, presence: true
  validates :address, presence: true
  validates :postcode, presence: true

end
class Item < ApplicationRecord
  has_many :cart_items

  has_one_attached :image
  def get_image
    if image.attached?
      image
    else
      'noimage.jpeg'
    end
  end

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_name, presence: true
  validates :price, presence: true
  validates :sale_status, presence: true
end

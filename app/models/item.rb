class Item < ApplicationRecord
  belongs_to :cart_item

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

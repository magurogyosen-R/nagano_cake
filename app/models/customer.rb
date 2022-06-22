class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  belongs_to :cart_item
  has_many :items, through: :cart_item


end

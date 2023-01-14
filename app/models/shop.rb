class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :address
  after_validation :geocode

  has_many :posts

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :shop_name, presence: true
  validates :shop_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true

  def self.guest
    find_or_create_by!(email: 'guest@test.com') do |shop|
      shop.last_name = "guest"
      shop.first_name = "guest"
      shop.last_name_kana = "guest"
      shop.first_name_kana = "guest"
      shop.shop_name = "guest"
      shop.shop_name_kana = "guest"
      shop.postal_code = "guest"
      shop.address = "guest"
      shop.telephone_number = "guest"
      shop.genre = "guest"
      shop.password = SecureRandom.urlsafe_base64
    end
  end
end

class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :shop

  attribute :address_select, :integer

  geocoded_by :address
  after_validation :geocode

  has_many :reviews

  validates :created_at_gteq, presence: true
  validates :created_at_lteq_end_of_day, presence: true
  validates :title, presence: true, length: { maximum: 40 }
  validates :body, presence: true
  validates :address_select, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

  def self.looks(word, range)
    @posts = Post.joins(:shop).where("posts.title LIKE ? or shops.shop_name LIKE ?","%#{word}%","%#{word}%").where("shops.genre LIKE ? ",range)
  end

  before_validation :imput_address

  def imput_address
    if address_select == 0
      shop = self.shop
      self.postal_code = shop.postal_code
      self.address = shop.address
    end
  end
end
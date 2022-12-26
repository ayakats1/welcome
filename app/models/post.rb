class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :shop

  geocoded_by :address
  after_validation :geocode

  has_many :reviews

  validates :title, length: { maximum: 40 }

  def self.looks(word, range)
    @posts = Post.joins(:shop).where("posts.title LIKE ? or shops.shop_name LIKE ?","%#{word}%","%#{word}%").where("shops.genre LIKE ? ",range)
  end

end

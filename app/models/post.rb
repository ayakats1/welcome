class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :shop

  geocoded_by :address
  after_validation :geocode

  has_many :reviews

  validates :title, length: { maximum: 40 }
end

class Information < ApplicationRecord
  has_one_attached :image
  belongs_to :shop
  has_many :comments
end

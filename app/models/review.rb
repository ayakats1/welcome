class Review < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :star, presence: true
  validates :review, presence: true
end

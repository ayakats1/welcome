class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews

  def self.guest
    find_or_create_by!(email: 'guest@test.com') do |user|
      user.last_name = "guest"
      user.first_name = "guest"
      user.last_name_kana = "guest"
      user.first_name_kana = "guest"
      user.password = SecureRandom.urlsafe_base64
    end
  end
end

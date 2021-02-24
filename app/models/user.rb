class User < ApplicationRecord
  has_many :routines
  has_many :instruments, through: :routines
  validates :username, presence: true
  has_secure_password

  def self.create_user_with_google(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |u|
      u.password = SecureRandom.hex
    end
  end

end

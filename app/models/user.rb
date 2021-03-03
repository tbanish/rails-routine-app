class User < ApplicationRecord
  has_many :routines
  has_many :instruments, through: :routines
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6}
  has_secure_password

  def self.create_user_with_google(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |u|
      u.password = SecureRandom.hex
    end
  end

  def routine_count
    self.routines.count
  end

  def instrument_count
    self.instruments.count
  end
end

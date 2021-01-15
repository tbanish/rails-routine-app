class User < ApplicationRecord
  has_many :routines
  has_many :instruments, through: :routines
  has_secure_password
end

class User < ApplicationRecord
  has_many :routines
  has_secure_password
end

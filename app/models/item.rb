class Item < ApplicationRecord
  belongs_to :routine
  has_many :notes
end

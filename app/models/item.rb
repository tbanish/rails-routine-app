class Item < ApplicationRecord
  belongs_to :routine
  has_many :notes
  validates :name, :description, :goal, presence: true
end

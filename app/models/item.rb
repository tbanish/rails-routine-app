class Item < ApplicationRecord
  belongs_to :routine
  has_many :notes, dependent: :destroy
  validates :name, presence: true
  validates :description, :goal, presence: true, length: { maximum: 150 }
end

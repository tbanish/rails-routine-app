class Note < ApplicationRecord
  belongs_to :item
  validates :content, presence: true, length: { maximum: 150 }
end

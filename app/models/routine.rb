class Routine < ApplicationRecord
  belongs_to :instrument
  belongs_to :user
  has_many :items
end

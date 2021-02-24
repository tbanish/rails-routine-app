class Instrument < ApplicationRecord
  has_many :routines
  has_many :users, through: :routines
  scope :most_routines, -> {joins(:routines).group(:id).order('count(instruments.id) desc')}
end

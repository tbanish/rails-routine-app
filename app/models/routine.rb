class Routine < ApplicationRecord
  belongs_to :instrument
  belongs_to :user
  has_many :items
  accepts_nested_attributes_for :instrument, reject_if: proc {|attributes| attributes['name'].blank?}
end

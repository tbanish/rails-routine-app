class Routine < ApplicationRecord
  belongs_to :instrument
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :name, :instrument_id, presence: true
  accepts_nested_attributes_for :instrument, reject_if: proc {|attributes| attributes['name'].blank?}

  def next_item(item)
    if self.items.include?(item)
      @next_item = self.items[self.items.find_index(item) + 1]
      @next_item ? @next_item : self.items.first
    end
  end
end

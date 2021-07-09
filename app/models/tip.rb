class Tip < ApplicationRecord

  def self.random_tip
    start = 1
    last = Tip.all.count
    id = rand(start..last)
    
    Tip.find_by(id: id)
  end
end

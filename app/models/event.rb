class Event < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 140 }

  THEME = [0,1,2,3,4,5,6,7,8,9]

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end

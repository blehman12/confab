class Event < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, length: { maximum: 140 }
  validates :theme, presence: true

  THEME = ["Transportation","Comics","Entertainment and Media","Writing/Books","Business","Hobbies","Arts and Crafts","Technology and Science","Gaming","Other"]

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end

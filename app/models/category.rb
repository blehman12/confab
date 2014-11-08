class Category < ActiveRecord::Base
  belongs_to :theme
  has_many :events
  validates :theme, presence: true
  validates :category, presence: true
end

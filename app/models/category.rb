class Category < ActiveRecord::Base
  belongs_to :theme
  has_many :events
  has_many :wants
  has_many :skills
  validates :theme, presence: true
  validates :category, presence: true
end

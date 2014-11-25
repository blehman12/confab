class Theme < ActiveRecord::Base
  has_many :events
  has_many :wants
  has_many :skills
  has_many :categories, dependent: :destroy
  validates :theme, uniqueness:true
end

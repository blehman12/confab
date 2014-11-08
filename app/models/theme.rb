class Theme < ActiveRecord::Base
  has_many :events
  has_many :categories, dependent: :destroy
  validates :theme, uniqueness:true
end

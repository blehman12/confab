class Theme < ActiveRecord::Base
  has_many :events
  has_many :categories
end

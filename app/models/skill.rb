class Skill < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :skill, presence: true, length: { maximum: 140 }

  LEVEL = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
end

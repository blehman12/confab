class Skill < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :skill, presence: true, length: { maximum: 140 }
end

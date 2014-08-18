class Communication < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :excomm, presence: true, length: { maximum: 140 }
  validates :userinfo, presence: true, length: { maximum: 140 }
end

class Communication < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :excomm, presence: true, length: { maximum: 140 }
  validates :userinfo, presence: true, length: { maximum: 140 }

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end

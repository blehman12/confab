class Want < ActiveRecord::Base
  belongs_to :user
  belongs_to :theme
  belongs_to :category
  validates :user_id, presence: true
  validates :wanted, presence: true, length: { maximum: 140 }

  PRIORITY = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end

  def self.search(query)
    where("wanted like ?", "%#{query}%")
  end
end

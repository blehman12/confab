class Want < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :wanted, presence: true, length: { maximum: 140 }
end

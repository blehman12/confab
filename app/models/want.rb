class Want < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :wanted, presence: true, length: { maximum: 140 }

  PRIORITY = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
end

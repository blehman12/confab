class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendances, foreign_key: "attendee_id", dependent: :destroy
  has_many :attending_users, through: :attendances, source: :attendee
  validates :name, presence: true, length: { maximum: 140 }
  validates :theme, presence: true

  THEME = ["Transportation","Comics","Entertainment and Media","Writing/Books","Business","Hobbies","Arts and Crafts","Technology and Science","Gaming","Other"]

  #adjust to match attended? attend! unattend!
    # def following?(other_user)
    #   relationships.find_by(followed_id: other_user.id)
    # end

    # def follow!(other_user)
    #   relationships.create!(followed_id: other_user.id)
    # end

    # def unfollow!(other_user)
    #   relationships.find_by(followed_id: other_user.id).destroy
    # end

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end

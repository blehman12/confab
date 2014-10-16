class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendances, foreign_key: "attended_id", dependent: :destroy
  has_many :attending_users, through: :attendances, source: :attendee
  validates :name, presence: true, length: { maximum: 140 }
  validates :theme, presence: true

  THEME = ["Transportation","Comics","Entertainment and Media","Writing/Books","Business","Hobbies","Arts and Crafts","Technology and Science","Gaming","Other"]

  STATE = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]

  def attended?(user)
    attendances.find_by(attendee_id: user.id)
  end

  def attend!(user)
    attendances.create!(attendee_id: user.id)
  end

  def unattend!(user)
    attendances.find_by(attendee_id: user.id).destroy
  end

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end

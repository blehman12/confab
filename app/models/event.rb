class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :theme
  belongs_to :category
  has_many :attendances, foreign_key: "attended_id", dependent: :destroy
  has_many :attending_users, through: :attendances, source: :attendee
  validates :name, presence: true, length: { maximum: 140 }
  validates :theme, presence: true
  # paperclip code to allow images to be added to events, default is currently duck jpg
  missing_url = 'duck.jpg'
  has_attached_file :image, 
                    styles: { medium: ["300x300>", :png], thumb: ["100x100", :png] }, 
                    default_url: missing_url
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :image, :in => 0.megabytes..2.megabytes
 
  # default_scope -> { order('start ASC') } 

# for dropdown menu on new event form
  STATE = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY", "Outside U.S."]

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

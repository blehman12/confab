class Attendance < ActiveRecord::Base
  belongs_to :attendee, class_name: "User"
  belongs_to :attended, class_name: "Event"
  validates :attendee_id, presence: true
  validates :attended_id, presence: true
end

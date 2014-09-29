class Attendance < ActiveRecord::Base
  belongs_to :attending
  belongs_to :attendee
end

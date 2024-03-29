class User < ActiveRecord::Base
  # acts_as_messageable
  has_many :communications, dependent: :destroy
  has_many :wants, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :events
  has_many :attendances, foreign_key: "attendee_id", dependent: :destroy
  has_many :attended_events, through: :attendances, source: :attended
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :posts, dependent: :destroy
  # email validation to ensure unique email addresses that are correctly formatted
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  # validates password entered and points to password digest
  has_secure_password
  validates :password, length: { minimum: 6 }


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

# encrypts password so that it is not stored as plain text in database
  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end


# lists of users' info
  def commlist
    Communication.from_users_followed_by(self)
  end

  def wantlist
    Want.from_users_followed_by(self)
  end

  def skilllist
    Skill.from_users_followed_by(self)
  end

# methods to show followers/followed users, follow, and unfollow
  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

# methods to show events attended, attend an event, and unattend an event
  def attending?(event)
    attendances.find_by(attended_id: event.id)
  end

  def attend!(event)
    attendances.create!(attended_id: event.id)
  end

  def unattend!(event)
    attendances.find_by(attended_id: event.id).destroy
  end

  def self.search(query)
    where("name like ?", "%#{query}%")
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end

end

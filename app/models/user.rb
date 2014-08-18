class User < ActiveRecord::Base
  has_many :communications, dependent: :destroy
  has_many :wants, dependent: :destroy
  has_many :skills, dependent: :destroy
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def commlist
    # This is preliminary. See "Following users" for the full implementation.
    Communication.where("user_id = ?", id)
  end

  def wantlist
    # This is preliminary. See "Following users" for the full implementation.
    Want.where("user_id = ?", id)
  end

  def skilllist
    # This is preliminary. See "Following users" for the full implementation.
    Skill.where("user_id = ?", id)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end

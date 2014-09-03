class User < ActiveRecord::Base
  has_many :communications, dependent: :destroy
  has_many :wants, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
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

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

  def search
    @users = User.search params[:search]
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end

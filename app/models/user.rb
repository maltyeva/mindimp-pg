class User < ActiveRecord::Base

  #this takes care of the activation email
  attr_accessor :activation_token
  before_save   :downcase_email
  before_create :create_activation_digest

  #authentication
  authenticates_with_sorcery!

  #associations
  has_and_belongs_to_many :course_sessions, join_table: :students_sessions
  has_many :assignment_responses
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower



  #simple user validations
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false }, 
                    presence: true, :on => :create,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  validates :password, length: { minimum: 6 }, confirmation: true, :on => :create 
  validates :password_confirmation, presence: true, :on => :create 

  #this creates the profile pic. 
  has_attached_file :profile_photo, 
                    :styles => { :medium => "300x300>", :thumb => "50x50>" }, 
                    :default_url => "/images/:style/missing.png"
                    # :storage => :s3

  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :profile_photo, :less_than => 1.megabytes




  #not sure if using this yet. Let's keep this for now. 
  royce_roles %w[ user instructor ] 

  #helper method to set the full username 
  def name
     [((nick_name.nil? || nick_name.length == 0) ? first_name : nick_name), last_name].join(" ")
  end

  def password_required?
    password.present? || password_confirmation.present? || !external? || email_changed?
  end

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end


  private

  # Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
 
  # Creates and assigns the activation token and digest.
  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  
end
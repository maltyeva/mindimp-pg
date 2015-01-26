class User < ActiveRecord::Base

  #this takes care of the activation email
  attr_accessor :activation_token
  before_save   :downcase_email
  before_create :create_activation_digest



  authenticates_with_sorcery!

  #associasions
  has_and_belongs_to_many :course_sessions, join_table: :students_sessions
  has_many :assignment_responses


  #simple user validations
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false }, 
                    presence: true, :on => :create,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }



  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true


  #creates profile pic. 
  has_attached_file :profile_photo, 
                    :styles => { :medium => "300x300>", :thumb => "50x50>" }, 
                    :default_url => "/images/:style/missing.png"
                    # :storage => :s3

  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :profile_photo, :less_than => 1.megabytes



  royce_roles %w[ user admin superadmin ] 


  def name
     [((nick_name.nil? || nick_name.length == 0) ? first_name : nick_name), last_name].join(" ")
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
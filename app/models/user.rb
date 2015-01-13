class User < ActiveRecord::Base


 #attr_accessor :first_name, :last_name, :email

  authenticates_with_sorcery!

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false }, 
                    presence: true, 
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }



  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true


#creates profile pic. 
  has_attached_file :profile_photo, 
                    :styles => { :medium => "300x300>", :thumb => "50x50>" }, 
                    :default_url => "/images/:style/missing.png"
                    # :storage => :dropbox,
                    # :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                    # :dropbox_options => {...}


  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :profile_photo, :less_than => 1.megabytes



  royce_roles %w[ user admin superadmin ] 



  
end
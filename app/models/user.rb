class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, :on => :create
  validates :password, confirmation: true, :on => :create
  validates :password_confirmation, presence: true, :on => :create

  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

#creates profile pic. 
  has_attached_file :profile_photo, 
                    :styles => { :medium => "300x300>", :thumb => "50x50>" }, 
                    :default_url => "/images/:style/missing.png",
                    :storage => :s3,
                    :path => ":attachment/:id/:style.:extension",
                    :s3_credentials => {
                        :access_key_id => "AKIAIVE5XD2EUTMKO7GA",
                        :secret_access_key => "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"},
                    :bucket => 'mindimp'


  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :profile_photo, :less_than => 10.megabytes




  royce_roles %w[ user admin superadmin ] 



  
end
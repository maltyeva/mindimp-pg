class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, :on => :create
  validates :password, confirmation: true, :on => :create
  validates :password_confirmation, presence: true, :on => :create

  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true



  royce_roles %w[ user admin superadmin ] 



  
end
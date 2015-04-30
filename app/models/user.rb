class User < ActiveRecord::Base


  has_merit

  #authentication
  authenticates_with_sorcery!

  #associations
  has_and_belongs_to_many :course_sessions, foreign_key: "user_id", join_table: :students_sessions
  has_many :course_sessions, foreign_key: "instructor_id"
  belongs_to :course_period

  has_many :assignment_responses, foreign_key: "user_id"
  has_many :assignment_responses, foreign_key: "grader_id"

  has_many :assessments

  has_many :discusson_responses


  #this allows a user to follow another user and vice versa
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_and_belongs_to_many :advisors, foreign_key: "advisor_id", 
                                     association_foreign_key: "advisee_id",
                                     class_name:  "User", 
                                     join_table: :users_advisors
  has_and_belongs_to_many :advisees, foreign_key: "advisee_id", 
                                     association_foreign_key: "advisor_id",
                                     class_name: "User", 
                                     join_table: :users_advisors


  #these associations will set up the book lists
  has_many :book_lists, foreign_key: "watcher_id",
                        dependent: :destroy
  has_many :books, through: :book_lists

  #these associations will set up the read books lists
  has_many :read_books, foreign_key: "reader_id",
                        dependent: :destroy
  has_many :books_read, through: :read_books, class_name: "Book", foreign_key: "read_book_id", source: :book

  #these associations will set up the article lists
   has_many :article_lists, foreign_key: "watcher_id",
                        dependent: :destroy
   has_many :articles, through: :article_lists



  #user validations
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false }, 
                    presence: true, :on => :create,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  #this takes care of passwords on update                  
  validates :password, length: { minimum: 6 }, confirmation: true, if: ->(record) { record.new_record? || record.password.present? || record.password_confirmation.present?  }
  validates :password_confirmation, presence: true, :on => :create 

  #this creates the profile pic. 
  has_attached_file :profile_photo, 
                    :styles => { :medium => "300x300>", :thumb => "50x50>" }, 
                    :default_url => "/images/:style/missing.png"
                    # :storage => :s3

  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :profile_photo, :less_than => 1.megabytes


  #are we using this? 
  royce_roles %w[ articles books classes ] 



  #ok, let's define the scopes here
  scope :active, lambda { where(:active => true) }

  scope :alumni, lambda { where(:active => false) }

  scope :course_student, lambda { where(:courses_permissions => true) }





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

  #helper methods for advising students
  def advising?(other_user)
    advisees.include?(other_user)
  end




  #helper methods to set up book lists
  def add_book(book)
    self.book_lists.create(:book_id => book.id)
  end

  def remove_book(book)
    self.book_lists.find_by(:book_id => book.id).destroy
  end

  def has_book?(book)
    books.include?(book)
  end

  #helper methods to set up read book lists
  def add_read_book(book)
    self.read_books.create(:read_book_id => book.id)
  end

  def remove_read_book(book)
    self.read_books.find_by(:read_book_id => book.id).destroy
  end

  def has_read_book?(book)
    books_read.include?(book)
  end

    #helper methods to set up article lists
  def add_article(article)
    self.article_lists.create(:article_id => article.id)
  end

  def remove_article(article)
    self.article_lists.find_by(:article_id => article.id).destroy
  end

  def has_article?(article)
    articles.include?(article)
  end


  def profile_completed?
    !bio.nil? && !profile_photo_file_name.nil? && !skype_id.nil? && !high_school.nil? && !parent_email.nil? 
  end



  private

  # Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end


  
end
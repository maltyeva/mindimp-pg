class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_filter :require_login
  skip_before_filter :require_login, only: [:new, :create, :activate]
  skip_before_filter :require_profile, only: [:edit, :update, :show]


  before_filter :require_admin, only: [:index, :following, :followers, :destroy, :edit_profile, :update_profile]
  #before_filter :correct_user, only: [:edit, :update] 

  # GET /users
  # GET /users.json
  def index
    #@users = User.all
    @users = User.paginate(page: params[:page], per_page: 10) #.where(:type => params[:type])
  end

  def student_list
    @title = "Current MindImp Students"
    @users = User.active.paginate(page: params[:page], per_page: 10).where(:is_admin => false)
    render 'user_list'
  end

  def admin_list
    @title = "Current MindImp Instructors"
    @users = User.paginate(page: params[:page], per_page: 10).where(:is_admin => true)
    render 'user_list'
  end

  def alumni_list
    @title = "MindImp Alumni"
    @users = User.alumni.paginate(page: params[:page], per_page: 10).where(:is_admin => false)
    render 'user_list'
  end

  def my_student_list
    @title = "My Students"
    @user  = User.find(params[:id])
    @reading_users = @user.advisees
    @course_periods = CoursePeriod.all

    render 'my_user_list'

  end

  def my_instructor_list
    @title = "My Instructors"
    @user  = User.find(params[:id])
    @reading_users = @user.advisors
        @course_periods = CoursePeriod.all

    @course_sessions = CourseSession.joins("join students_sessions on course_sessions.id = students_sessions.course_session_id").where("students_sessions.user_id = ?", @user.id)

    render 'my_user_list'
  end


  def course_list
    @user = current_user
    @course_sessions = CourseSession.active.joins("join students_sessions on course_sessions.id = students_sessions.course_session_id").where("students_sessions.user_id = ?", @user.id)
    @my_courses = CourseSession.active.where(instructor_id: @user.id)
  end

  def instructor_list
    @user = current_user
    @course_sessions = CourseSession.joins("join students_sessions on course_sessions.id = students_sessions.course_session_id").where("students_sessions.user_id = ?", @user.id)
    @followers = @user.followers.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user  = User.find(params[:id])
    #@responses = DiscussionResponse.where(user_id: @user.id)
    @article_responses = DiscussionResponse.joins(:discussion_question).where(:discussion_questions => { :book_id => nil }).where(user_id: @user.id)
    @book_responses = DiscussionResponse.joins(:discussion_question).where(:discussion_questions => { :article_id => nil }).where(user_id: @user.id)


    @my_courses = CourseSession.where(instructor_id: @user.id)
    @course_sessions = CourseSession.joins("join students_sessions on course_sessions.id = students_sessions.course_session_id").where("students_sessions.user_id = ?", @user.id)
    #Page.joins("join pages_paragraphs on pages_paragraphs.page_id = pages.id").where("pages_paragraphs.paragraph_id = ?", paragraph_id)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.is_admin = true if User.count == 0

    respond_to do |format|
      if @user.save
        format.html { redirect_to :root, notice: 'Thank you for creating your MindImp Account! Please check your email for more details.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


    # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update    
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Successfully updated profile.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_profile
      @user = User.find(params[:id])
  end


  def update_profile
  @user = User.find(params[:id])
  @advisor_relationships = User.where(:id => params[:user_id]).where(:is_admin => true)
  @user.advisors << @advisor_relationships
  respond_to do |format|
    if @user.update_attributes(params[:user])
      format.html { redirect_to @user, notice: 'User was successfully updated.' }
    else
      format.html { render action: "edit_profile" }
    end
  end
end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def activate
  if (@user = User.load_from_activation_token(params[:id]))
    @user.activate!
    UserMailer.activation_admin_email(@user).deliver
    redirect_to(login_path, :notice => 'User was successfully activated.')
  else
    not_authenticated
  end
end


  #Methods for followiing
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end


  def book_responses
    @title = "Reading Responses"
    @user  = User.find(params[:id])
    @responses = DiscussionResponse.joins(:discussion_question).where(:discussion_questions => { :article_id => nil }).where(user_id: @user.id)
    render 'responses'
  end

  def article_responses
    @title = "Article Responses"
    @user  = User.find(params[:id])
    @responses = DiscussionResponse.joins(:discussion_question).where(:discussion_questions => { :book_id => nil }).where(user_id: @user.id)
    render 'responses'
  end


  #showing the book & article lists
  def user_books
    @title = "My Books"
    @user  = User.find(params[:id])
    @books = @user.book_lists.paginate(page: params[:page])
    render 'user_books'
  end

  def user_articles
    @title = "My Articles"
    @user  = User.find(params[:id])
    @articles = @user.article_lists.paginate(page: params[:page])
    render 'user_articles'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

   def user_params
     params.require(:user).permit(:email, :password, :password_confirmation, :first_name, 
                                  :last_name, :nick_name, :age, :is_admin, :is_student, 
                                  :profile_photo, :last_login, :bio, :hometown, :high_school,
                                  :phone, :skype_id, :books_permissions, :articles_permissions, 
                                  :courses_permissions, :college, :major, :hobbies, :fav_book, 
                                  :parent_name, :parent_email, :wechat_id, :active, 
                                  :course_period_id, :book_ids => [], :advisor_ids => [], 
                                  :advisee_ids => [])
   end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end


  def skip_password_attribute
    if params[:password].blank? && params[:password_confirmation].blank?
      params.except!(:password, :password_confirmation)
    end
  end


end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_filter :require_login
  skip_before_filter :require_login, only: [:new, :create, :activate]

  before_filter :require_admin, only: [:index, :following, :followers, :destroy]
  #before_filter :correct_user, only: [:edit, :update] 

  # GET /users
  # GET /users.json
  def index
    #@users = User.all
    @users = User.paginate(page: params[:page], per_page: 10) #.where(:type => params[:type])
  end

  def student_list
    @users = User.paginate(page: params[:page], per_page: 10).where(:is_admin => false)
  end

  def admin_list
    @users = User.paginate(page: params[:page], per_page: 10).where(:is_admin => true)
  end


  def course_list
    @user = current_user
    @course_sessions = CourseSession.joins("join students_sessions on course_sessions.id = students_sessions.course_session_id").where("students_sessions.user_id = ?", @user.id)
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

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.is_admin = true if User.count == 0

    respond_to do |format|
      if @user.save
        #UserMailer.account_activation(@user).deliver!
        # format.html { redirect_to :root, notice: 'Please check your email to activate your account.' }
        #log_in @user
        format.html { redirect_to :root, notice: 'Thank you for creating your MindImp Account! Please check your email for more details.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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


  #showing the 
  def user_books
    @title = "My Books"
    @user  = User.find(params[:id])
    @books = @user.book_lists.paginate(page: params[:page])
    render 'user_books'
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
                                  :phone, :skype_id, :books_permissions, :articles_permissions, :courses_permissions, :college, 
                                  :major, :hobbies, :fav_book, :parent_name, :parent_email, :book_ids => [])
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

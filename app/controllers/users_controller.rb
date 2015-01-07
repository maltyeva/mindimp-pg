class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_login, only: [:index, :new, :create]

  before_filter :require_admin, :only => :index
  before_filter :skip_password_attribute, only: :update



  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def student_list
    @users = User.all
  end


  # GET /users/1
  # GET /users/1.json
  def show
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
        format.html { redirect_to :root, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
       # UserMailer.welcome_email(@user).deliver!
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
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :nick_name, :age, :is_admin, :is_student, :profile_photo)
  end


  def skip_password_attribute
    if params[:password].blank? && params[:password_confirmation].blank?
      params.except!(:password, :password_confirmation)
    end
  end
end

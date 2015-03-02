class DiscussionResponsesController < ApplicationController
  before_action :set_discussion_response, only: [:show, :edit, :update, :destroy]
 
  before_filter :require_login
  before_filter :load_discussion_question

  before_filter :require_admin, only: [:edit, :index, :update]
  before_filter :correct_user, only: [:show]


  respond_to :html

  def index
    @discussion_responses = @discussion_question.discussion_responses.all
    respond_with(@discussion_responses)
  end

  def show
    respond_with(@discussion_response)
    @user = User.where(user_id: :comment_by)
  end

  def new
    @discussion_response = @discussion_question.discussion_responses.new
    respond_with(@discussion_response)
  end

  def edit
  end

  def create
    @discussion_response = @discussion_question.discussion_responses.new(discussion_response_params)
    @discussion_response.update_attribute(:user, current_user)
    @discussion_response.save
    respond_with(@discussion_question, @discussion_response)
  end

  def update
    @discussion_response.update_attribute(:comment_by, current_user.id)
    @discussion_response.update(discussion_response_params)
    respond_with(@discussion_question, @discussion_response)
  end

  def destroy
    @discussion_question.discussion_response.destroy
    respond_with(@discussion_question, @discussion_response)
  end

  private

  def load_discussion_question
      @discussion_question = DiscussionQuestion.find(params[:discussion_question_id])
  end


  def set_discussion_response
    @discussion_response = DiscussionResponse.find(params[:id])
  end

    def discussion_response_params
      params.require(:discussion_response).permit(:response, :user_id, :discussion_question_id, :comments, :comment_by)
    end
end

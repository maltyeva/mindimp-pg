class DiscussionQuestionsController < ApplicationController
  before_action :set_discussion_question, only: [:show, :edit, :update, :destroy]


  before_filter :require_login
  before_filter :require_admin, only: [:edit, :index, :update]
  

  respond_to :html

  def index
    @discussion_questions = DiscussionQuestion.all
    respond_with(@discussion_questions)
  end

  def show
    respond_with(@discussion_question)
  end

  def new
    @discussion_question = DiscussionQuestion.new
    respond_with(@discussion_question)
  end

  def edit
  end

  def create
    @discussion_question = DiscussionQuestion.new(discussion_question_params)
    @discussion_question.save
    respond_with(@discussion_question)
  end

  def update
    @discussion_question.update(discussion_question_params)
    respond_with(@discussion_question)
  end

  def destroy
    @discussion_question.destroy
   # respond_with(@discussion_question)
    redirect_to :back
  end

  private
    def set_discussion_question
      @discussion_question = DiscussionQuestion.find(params[:id])
    end

    def discussion_question_params
      params.require(:discussion_question).permit(:question, :week_number, :book_id, :visible, :chapters, :article_id)
    end
end

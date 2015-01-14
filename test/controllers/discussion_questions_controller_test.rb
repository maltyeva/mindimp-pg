require 'test_helper'

class DiscussionQuestionsControllerTest < ActionController::TestCase
  setup do
    @discussion_question = discussion_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discussion_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discussion_question" do
    assert_difference('DiscussionQuestion.count') do
      post :create, discussion_question: {  }
    end

    assert_redirected_to discussion_question_path(assigns(:discussion_question))
  end

  test "should show discussion_question" do
    get :show, id: @discussion_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discussion_question
    assert_response :success
  end

  test "should update discussion_question" do
    patch :update, id: @discussion_question, discussion_question: {  }
    assert_redirected_to discussion_question_path(assigns(:discussion_question))
  end

  test "should destroy discussion_question" do
    assert_difference('DiscussionQuestion.count', -1) do
      delete :destroy, id: @discussion_question
    end

    assert_redirected_to discussion_questions_path
  end
end

require 'test_helper'

class DiscussionResponsesControllerTest < ActionController::TestCase
  setup do
    @discussion_response = discussion_responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discussion_responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discussion_response" do
    assert_difference('DiscussionResponse.count') do
      post :create, discussion_response: {  }
    end

    assert_redirected_to discussion_response_path(assigns(:discussion_response))
  end

  test "should show discussion_response" do
    get :show, id: @discussion_response
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discussion_response
    assert_response :success
  end

  test "should update discussion_response" do
    patch :update, id: @discussion_response, discussion_response: {  }
    assert_redirected_to discussion_response_path(assigns(:discussion_response))
  end

  test "should destroy discussion_response" do
    assert_difference('DiscussionResponse.count', -1) do
      delete :destroy, id: @discussion_response
    end

    assert_redirected_to discussion_responses_path
  end
end

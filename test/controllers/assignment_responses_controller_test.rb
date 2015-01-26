require 'test_helper'

class AssignmentResponsesControllerTest < ActionController::TestCase
  setup do
    @assignment_response = assignment_responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assignment_responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assignment_response" do
    assert_difference('AssignmentResponse.count') do
      post :create, assignment_response: {  }
    end

    assert_redirected_to assignment_response_path(assigns(:assignment_response))
  end

  test "should show assignment_response" do
    get :show, id: @assignment_response
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assignment_response
    assert_response :success
  end

  test "should update assignment_response" do
    patch :update, id: @assignment_response, assignment_response: {  }
    assert_redirected_to assignment_response_path(assigns(:assignment_response))
  end

  test "should destroy assignment_response" do
    assert_difference('AssignmentResponse.count', -1) do
      delete :destroy, id: @assignment_response
    end

    assert_redirected_to assignment_responses_path
  end
end

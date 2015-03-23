require 'test_helper'

class CourseMeetingsControllerTest < ActionController::TestCase
  setup do
    @course_meeting = course_meetings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_meetings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_meeting" do
    assert_difference('CourseMeeting.count') do
      post :create, course_meeting: {  }
    end

    assert_redirected_to course_meeting_path(assigns(:course_meeting))
  end

  test "should show course_meeting" do
    get :show, id: @course_meeting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_meeting
    assert_response :success
  end

  test "should update course_meeting" do
    patch :update, id: @course_meeting, course_meeting: {  }
    assert_redirected_to course_meeting_path(assigns(:course_meeting))
  end

  test "should destroy course_meeting" do
    assert_difference('CourseMeeting.count', -1) do
      delete :destroy, id: @course_meeting
    end

    assert_redirected_to course_meetings_path
  end
end

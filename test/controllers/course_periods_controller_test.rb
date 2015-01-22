require 'test_helper'

class CoursePeriodsControllerTest < ActionController::TestCase
  setup do
    @course_period = course_periods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_periods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_period" do
    assert_difference('CoursePeriod.count') do
      post :create, course_period: {  }
    end

    assert_redirected_to course_period_path(assigns(:course_period))
  end

  test "should show course_period" do
    get :show, id: @course_period
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_period
    assert_response :success
  end

  test "should update course_period" do
    patch :update, id: @course_period, course_period: {  }
    assert_redirected_to course_period_path(assigns(:course_period))
  end

  test "should destroy course_period" do
    assert_difference('CoursePeriod.count', -1) do
      delete :destroy, id: @course_period
    end

    assert_redirected_to course_periods_path
  end
end

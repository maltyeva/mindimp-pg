require 'test_helper'

class CourseAssignmentsControllerTest < ActionController::TestCase
  setup do
    @course_assignment = course_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_assignment" do
    assert_difference('CourseAssignment.count') do
      post :create, course_assignment: {  }
    end

    assert_redirected_to course_assignment_path(assigns(:course_assignment))
  end

  test "should show course_assignment" do
    get :show, id: @course_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_assignment
    assert_response :success
  end

  test "should update course_assignment" do
    patch :update, id: @course_assignment, course_assignment: {  }
    assert_redirected_to course_assignment_path(assigns(:course_assignment))
  end

  test "should destroy course_assignment" do
    assert_difference('CourseAssignment.count', -1) do
      delete :destroy, id: @course_assignment
    end

    assert_redirected_to course_assignments_path
  end
end

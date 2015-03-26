require 'test_helper'

class CourseFilesControllerTest < ActionController::TestCase
  setup do
    @course_file = course_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_file" do
    assert_difference('CourseFile.count') do
      post :create, course_file: {  }
    end

    assert_redirected_to course_file_path(assigns(:course_file))
  end

  test "should show course_file" do
    get :show, id: @course_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_file
    assert_response :success
  end

  test "should update course_file" do
    patch :update, id: @course_file, course_file: {  }
    assert_redirected_to course_file_path(assigns(:course_file))
  end

  test "should destroy course_file" do
    assert_difference('CourseFile.count', -1) do
      delete :destroy, id: @course_file
    end

    assert_redirected_to course_files_path
  end
end

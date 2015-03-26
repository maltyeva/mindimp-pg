require 'test_helper'

class CoursePacketsControllerTest < ActionController::TestCase
  setup do
    @course_packet = course_packets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_packets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_packet" do
    assert_difference('CoursePacket.count') do
      post :create, course_packet: {  }
    end

    assert_redirected_to course_packet_path(assigns(:course_packet))
  end

  test "should show course_packet" do
    get :show, id: @course_packet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_packet
    assert_response :success
  end

  test "should update course_packet" do
    patch :update, id: @course_packet, course_packet: {  }
    assert_redirected_to course_packet_path(assigns(:course_packet))
  end

  test "should destroy course_packet" do
    assert_difference('CoursePacket.count', -1) do
      delete :destroy, id: @course_packet
    end

    assert_redirected_to course_packets_path
  end
end

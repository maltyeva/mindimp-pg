require 'test_helper'

class BookCategoriesControllerTest < ActionController::TestCase
  setup do
    @book_category = book_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_category" do
    assert_difference('BookCategory.count') do
      post :create, book_category: {  }
    end

    assert_redirected_to book_category_path(assigns(:book_category))
  end

  test "should show book_category" do
    get :show, id: @book_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book_category
    assert_response :success
  end

  test "should update book_category" do
    patch :update, id: @book_category, book_category: {  }
    assert_redirected_to book_category_path(assigns(:book_category))
  end

  test "should destroy book_category" do
    assert_difference('BookCategory.count', -1) do
      delete :destroy, id: @book_category
    end

    assert_redirected_to book_categories_path
  end
end

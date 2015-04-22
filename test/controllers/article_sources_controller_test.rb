require 'test_helper'

class ArticleSourcesControllerTest < ActionController::TestCase
  setup do
    @article_source = article_sources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:article_sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article_source" do
    assert_difference('ArticleSource.count') do
      post :create, article_source: {  }
    end

    assert_redirected_to article_source_path(assigns(:article_source))
  end

  test "should show article_source" do
    get :show, id: @article_source
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @article_source
    assert_response :success
  end

  test "should update article_source" do
    patch :update, id: @article_source, article_source: {  }
    assert_redirected_to article_source_path(assigns(:article_source))
  end

  test "should destroy article_source" do
    assert_difference('ArticleSource.count', -1) do
      delete :destroy, id: @article_source
    end

    assert_redirected_to article_sources_path
  end
end

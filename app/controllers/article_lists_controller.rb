class ArticleListsController < ApplicationController

before_filter :require_login

  def create
    @article = Article.find(params[:article_id])
    current_user.add_article(@article)
    respond_to do |format|
      format.html { redirect_to @article }
      format.js
    end
  end

  def destroy
    @article = ArticleList.find(params[:id]).article
    current_user.remove_article(@article)
    respond_to do |format|
      format.html { redirect_to @article }
      format.js
    end
  end

end

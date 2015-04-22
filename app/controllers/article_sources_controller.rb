class ArticleSourcesController < ApplicationController
  before_action :set_article_source, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @article_sources = ArticleSource.all
    respond_with(@article_sources)
  end

  def show
    respond_with(@article_source)
  end

  def new
    @article_source = ArticleSource.new
    respond_with(@article_source)
  end

  def edit
  end

  def create
    @article_source = ArticleSource.new(article_source_params)
    @article_source.save
    respond_with(@article_source)
  end

  def update
    @article_source.update(article_source_params)
    respond_with(@article_source)
  end

  def destroy
    @article_source.destroy
    respond_with(@article_source)
  end

  private
    def set_article_source
      @article_source = ArticleSource.find(params[:id])
    end

    def article_source_params
      params[:article_source]
    end
end

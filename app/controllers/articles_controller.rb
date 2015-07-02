class ArticlesController < ApplicationController
  def index
    kind = params[:kind] || :news
    @articles = Article.where(:kind => kind).page params[:page]
    render (kind == :news) ? :index : 'articles/education_index'
  end

  def show
    @article = Article.find(params[:id])
  end
end

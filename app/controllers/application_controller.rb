class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :load_gallery

  def show
    @articles = Article.all.order(created_at: :desc).limit(4)
  end

  def load_gallery
    @photos = Photo.sample(5)
  end
end

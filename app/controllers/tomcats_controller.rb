class TomcatsController < ApplicationController
  before_filter :show_nav
  
  # def show
  #   @tomcat = Tomcat.find(params[:id])
  # end

  def index
    @tomcats = Tomcat.all.order(created_at: :desc).page(params[:page]).includes(:user)
  end

  def show_nav
    @show_navigation = true
  end
end

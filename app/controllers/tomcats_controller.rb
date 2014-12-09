class TomcatsController < ApplicationController
  def show
    Tomcat.find(params[:id])
  end

  def index
    Tomcat.all.order(created_at: :desc).page(params[:page])
  end
end

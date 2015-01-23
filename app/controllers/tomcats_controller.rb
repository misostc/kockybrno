class TomcatsController < ApplicationController
  before_filter :show_nav
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @tomcats = Tomcat.all.order(created_at: :desc).page(params[:page]).includes(:user)
  end

  def new
    @tomcat = Tomcat.new
  end

  def create
    @tomcat = Tomcat.new(tomcat_parameters)
    @tomcat.user = current_user

    if @tomcat.save
      redirect_to tomcats_path, notice: 'Kocour přidán. Záznam je nutno schválit správcem.'
    else
      render :new
    end
  end

  def destroy
    @tomcat = Tomcat.find(params[:id])
    if @tomcat.user == current_user
      @tomcat.destroy
      redirect_to tomcats_path, notice: 'Kocour odstraňen.'
    else
      redirect_to tomcats_path, notice: 'Uživatelé mohou odstranit pouze své záznamy'
    end
  end

  def tomcat_parameters
    params.require(:tomcat).permit(:name, :born_at, :tests, :description, :breed, :station, :image)
  end

  def show_nav
    @show_navigation = true
  end
end

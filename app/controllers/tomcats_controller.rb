class TomcatsController < ApplicationController
  before_action :show_nav
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def tomcat_parameters
    params.require(:tomcat).permit(:name, :born_at, :ems, :tests, :description, :breed, :station, :image)
  end

  def show_nav
    @show_navigation = true
  end

  def destroy
    @tomcat = Tomcat.find(params[:id])
    if @tomcat.user == current_user
      @tomcat.destroy
      redirect_to tomcats_path, notice: 'Záznam odstraňen.'
    else
      redirect_to tomcats_path, notice: 'Uživatelé mohou odstranit pouze své záznamy'
    end
  end

  def create
    @tomcat = Tomcat.new(tomcat_parameters)
    @tomcat.confirmed = false
    @tomcat.user = current_user

    if @tomcat.save
      redirect_to tomcats_path, notice: 'Záznam přidán. Záznam je nutno schválit správcem.'
    else
      render :new
    end
  end

  def new
    @tomcat = Tomcat.new
  end

  def index
    @tomcats = Tomcat.all.order(created_at: :desc).where(confirmed: true).page(params[:page]).includes(:user)
    if current_user
      @user_tomcats = current_user.tomcats.order(created_at: :desc)
    end
  end
end

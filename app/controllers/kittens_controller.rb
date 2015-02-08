class KittensController < ApplicationController
  before_action :show_nav
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @kittens = Kitten.all.order(created_at: :desc).where(confirmed: true).page(params[:page]).includes(:user)
  end

  def show_nav
    @show_navigation = true
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_parameters)
    @kitten.confirmed = false
    @kitten.user = current_user

    if @kitten.save
      redirect_to kittens_path, notice: 'Záznam přidán. Záznam je nutno schválit správcem.'
    else
      render :new
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    if @kitten.user == current_user
      @kitten.destroy
      redirect_to kittens_path, notice: 'Záznam odstraňen.'
    else
      redirect_to kittens_path, notice: 'Uživatelé mohou odstranit pouze své záznamy.'
    end
  end

  def kitten_parameters
    params.require(:kitten).permit(:sex, :breed, :station, :born_at, :description, :image)
  end
end

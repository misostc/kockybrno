class KittensController < ApplicationController
  before_filter :show_nav

  # def show
  #   @kitten = Kitten.find(params[:id])
  # end

  def index
    @kittens = Kitten.all.order(created_at: :desc).page(params[:page]).includes(:user)
  end

  def show_nav
    @show_navigation = true
  end
end

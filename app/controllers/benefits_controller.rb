class BenefitsController < ApplicationController
  before_action :show_nav

  def index
    @benefits = Benefit.all
  end

  def show
    @benefit = Benefit.find(params[:id])
  end

  def show_nav
    @show_navigation = true
  end
end

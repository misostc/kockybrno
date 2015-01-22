class KittensController < ApplicationController
  def show
    Kitten.find(params[:id])
  end

  def index
    Kitten.all.order(created_at: :desc).page(params[:page])
  end
end

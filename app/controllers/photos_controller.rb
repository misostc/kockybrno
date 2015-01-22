class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order(created_at: :desc).page params[:page]
  end

  def show
    @photo = Photo.find(params[:id])
  end
end

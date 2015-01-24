class PhotogalleriesController < ApplicationController
  def show
    @gallery = Photogallery.find(params[:id])
    @photos = @gallery.photos.page params[:page]
  end
end

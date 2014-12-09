module ApplicationHelper
  include ArticlesHelper

  def gallery
    @photos = Photo.sample(10)
    render partial: 'application/gallery'
  end
end

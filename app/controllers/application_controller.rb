class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :load_documents
  before_filter :load_regions

  def show
    @region_main_text = Region.get("hlavni-stranka-uvodni-text")
    @articles = Article.all.order(created_at: :desc).limit(4)
    @gallery = Photogallery.all.order(created_at: :asc).first
    @photos = @gallery.photos.sample(5)
  end

  def load_documents
    @hit_docs = Document.most_hit
  end

  def load_regions
    @region_contact = Region.get("kontakt")
    @region_footer = Region.get("paticka-spodni-text")
  end
end

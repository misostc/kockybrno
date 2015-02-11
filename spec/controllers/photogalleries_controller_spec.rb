require 'rails_helper'

describe PhotogalleriesController do

  describe "GET #show" do

    context "with gallery found" do

      before(:each) do
        @gallery = FactoryGirl.create(:photogallery)
      end

      it "responds successfully with an HTTP 200 status code" do
        get :show, id: @gallery.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the show template" do
        get :show, id: @gallery.id
        expect(response).to render_template("show")
      end

      it "loads the article into @article" do
        get :show, id: @gallery.id
        expect(assigns(:gallery)).to match(@gallery)
      end

    end

    context "with gallery not found" do

      it "raises RecordNotFound" do
        expect { get :show, id: 0 }.to raise_error ActiveRecord::RecordNotFound
      end

    end

  end

end
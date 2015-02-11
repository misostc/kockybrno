require "rails_helper"

describe StaticpagesController do

  describe "GET #exhibitions" do

    context "when regions are in db" do
      before(:each) do
        @region_main_text = FactoryGirl.create(:region, name: 'vystavy-uvodni-text')
        @region_left_col =  FactoryGirl.create(:region, name: 'vystavy-levy-sloupec')
        @region_right_col = FactoryGirl.create(:region, name: 'vystavy-pravy-sloupec')
      end

      it "responds successfully with an HTTP 200 status code" do
        get :exhibitions
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the exhibitions template" do
        get :exhibitions
        expect(response).to render_template("exhibitions")
      end

      it "loads all of the regions into variabled" do
        get :exhibitions
        expect(assigns(:region_main_text)).to match(@region_main_text)
        expect(assigns(:region_left_col)).to match(@region_left_col)
        expect(assigns(:region_right_col)).to match(@region_right_col)
      end

    end

    context "when regions are not in db" do
      it "responds successfully with an HTTP 200 status code" do
        get :exhibitions
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the exhibitions template" do
        get :exhibitions
        expect(response).to render_template("exhibitions")
      end

      it "has regions assigned as nil" do
        get :exhibitions
        expect(assigns(:region_main_text)).to match(nil)
        expect(assigns(:region_left_col)).to match(nil)
        expect(assigns(:region_right_col)).to match(nil)
      end

    end

  end

end
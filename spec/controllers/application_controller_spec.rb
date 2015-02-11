require 'rails_helper'

describe ApplicationController do
  describe 'GET #show' do
    context 'with resources in db' do
      before(:each) do
        @document = FactoryGirl.create(:document)
        @document.punch
        @article = FactoryGirl.create(:article)
        @gallery = FactoryGirl.create(:photogallery)
        @photo = FactoryGirl.create(:photo, photogallery: @gallery)
        @region_contact = FactoryGirl.create(:region, name: 'kontakt')
        @region_footer = FactoryGirl.create(:region, name: 'paticka-spodni-text')
        @region_main_text = FactoryGirl.create(:region, name: 'hlavni-stranka-uvodni-text')
      end

      it 'responds successfully with an HTTP 200 status code' do
        get :show
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders the show template' do
        get :show
        expect(response).to render_template('show')
      end

      it 'loads all of the resources into variables' do
        get :show
        expect(assigns(:articles)).to eq([@article])
        expect(assigns(:hit_docs)).to eq([@document])
        expect(assigns(:gallery)).to eq(@gallery)
        expect(assigns(:photos)).to eq([@photo])
        expect(assigns(:region_contact)).to eq(@region_contact)
        expect(assigns(:region_footer)).to eq(@region_footer)
        expect(assigns(:region_main_text)).to eq(@region_main_text)
      end
    end

    context 'without resources' do
      it 'responds successfully with an HTTP 200 status code' do
        get :show
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders the show template' do
        get :show
        expect(response).to render_template('show')
      end

      it 'has empty resources' do
        get :show
        expect(assigns(:articles)).to be_empty
        expect(assigns(:hit_docs)).to be_empty
        expect(assigns(:gallery)).to eq(nil)
        expect(assigns(:photos)).to be_empty
        expect(assigns(:region_contact)).to eq(nil)
        expect(assigns(:region_footer)).to eq(nil)
        expect(assigns(:region_main_text)).to eq(nil)
      end
    end
  end
end

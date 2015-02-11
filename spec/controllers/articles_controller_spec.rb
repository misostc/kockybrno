require 'rails_helper'

describe ArticlesController do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'loads all of the articles into @articles' do
      article1 = FactoryGirl.create(:article, created_at: Time.now - 1.month)
      article2 = FactoryGirl.create(:article)
      get :index
      expect(assigns(:articles)).to eq([article2, article1])
    end
  end

  describe 'GET #show' do
    context 'when article found' do
      before(:each) do
        @article = FactoryGirl.create(:article)
      end

      it 'responds successfully with an HTTP 200 status code' do
        get :show, id: @article.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders the show template' do
        get :show, id: @article.id
        expect(response).to render_template('show')
      end

      it 'loads the article into @article' do
        get :show, id: @article.id
        expect(assigns(:article)).to eq(@article)
      end
    end

    context 'when article not found' do
      it 'raises RecordNotFound' do
        expect { get :show, id: 0 }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end

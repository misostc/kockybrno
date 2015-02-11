require 'rails_helper'

describe DocumentsController do
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

    it 'loads all of the documents into @docs' do
      doc1 = FactoryGirl.create(:document, created_at: Time.now - 1.month)
      doc2 = FactoryGirl.create(:document)
      get :index
      expect(assigns(:docs)).to eq([doc2, doc1])
    end
  end

  describe 'GET #show' do
    context 'when document found' do
      before(:each) do
        @document = FactoryGirl.create(:document)
      end

      it 'serves the found document' do
        get :show, id: @document.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(controller.headers['Content-Transfer-Encoding']).to eq('binary')
      end
    end

    context 'when document not found' do
      it 'raises RecordNotFound' do
        expect { get :show, id: 0 }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end

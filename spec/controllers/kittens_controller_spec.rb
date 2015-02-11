require 'rails_helper'

describe KittensController do
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

    it 'contains confirmed kitten in @kittens' do
      kitten = FactoryGirl.create(:kitten, confirmed: true)
      get :index
      expect(assigns(:kittens)).to include(kitten)
    end

    it 'does not contain unconfirmed kitten in @kittens' do
      kitten = FactoryGirl.create(:kitten, confirmed: false)
      get :index
      expect(assigns(:kittens)).not_to include(kitten)
    end

    it 'contains users kitten in @user_kittens' do
      user = FactoryGirl.create(:user)
      kitten = FactoryGirl.create(:kitten, user: user)
      user2 = FactoryGirl.create(:user)
      kitten2 = FactoryGirl.create(:kitten, user: user2)
      sign_in user
      get :index
      expect(assigns(:user_kittens)).to include(kitten)
      expect(assigns(:user_kittens)).not_to include(kitten2)
    end
  end

  describe 'GET #new' do
    context 'with user signed in' do
      before(:each) do
        sign_in FactoryGirl.create(:user)
      end

      it 'responds successfully with an HTTP 200 status code' do
        get :new
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders the new template' do
        get :new
        expect(response).to render_template('new')
      end
    end

    context 'without user signed in' do
      it 'redirects to sign in' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    context 'with user signed in' do
      before(:each) do
        sign_in FactoryGirl.create(:user)
      end

      it 'succeedes with valid attributes' do
        expect { post :create, kitten: FactoryGirl.attributes_for(:kitten) }.to change(Kitten, :count).by(+1)
        expect(response).to redirect_to(kittens_path)
      end

      it 'renders new with invalid attributes' do
        post :create, kitten: FactoryGirl.attributes_for(:kitten, description: nil)
        expect(response).to render_template('new')
      end
    end

    context 'without user signed in' do
      it 'redirects to sign in' do
        post :create, kitten: FactoryGirl.attributes_for(:kitten)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with user signed in' do
      before(:each) do
        @user = FactoryGirl.create(:user)
        sign_in @user
      end

      it 'deletes users kitten' do
        kitten = FactoryGirl.create(:kitten, user: @user)
        expect { delete :destroy, id: kitten.id }.to change(Kitten, :count).by(-1)
        expect(response).to redirect_to(kittens_path)
      end

      it "doesn't delete other users kitten" do
        kitten = FactoryGirl.create(:kitten)
        expect { delete :destroy, id: kitten.id }.not_to change(Kitten, :count)
        expect(response).to redirect_to(kittens_path)
      end

      it 'raises RecordNotFound when id not valid' do
        expect { delete :destroy, id: 40 }.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context 'without user signed in' do
      it 'redirects to sign in' do
        delete :destroy, id: FactoryGirl.create(:kitten).id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
